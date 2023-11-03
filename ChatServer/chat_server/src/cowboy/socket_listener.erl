-module(socket_listener).

%%API
-export([init/2, websocket_handle/2, websocket_info/2, terminate/3, websocket_init/1]).

% called when cowboy receives a request
init(Req, _State)->
  % handing the websocket to cowboy_websocket module passing it the request using infinite idle timeout option
  #{username:=CurrentUsername} = cowboy_req:match_qs([{username, nonempty}], Req),
  RegisterPid = whereis(chat_registry),
  InitialState = #{username => CurrentUsername, register_pid => RegisterPid},
  {cowboy_websocket, Req, InitialState, #{idle_timeout => infinity}}.

% stores the Username to Pid mapping in the registry
websocket_init(State)->
  #{username := CurrentUsername, register_pid := RegisterPid} = State,
  RegisterPid ! {register, CurrentUsername, self()},
  {ok, State}.

% override of the cowboy_websocket websocket_handle/2 method
websocket_handle(Frame={text, Message}, State) ->
  DecodedMessage = jsone:try_decode(Message),
  case DecodedMessage of
    {ok, MessageMap, _} ->
      io:format("[Chat WS:~p] -> Received frame: ~p~n",[self(), MessageMap]),
      Destination = maps:get(<<"username">>, MessageMap, undefined),
      Content = maps:get(<<"message">>, MessageMap, ""),
      if 
        Destination == undefined -> 
          ok;
        true -> 
          #{username := Sender, register_pid := RegisterPid} = State,
          RegisterPid ! {forward, Destination, Content, Sender, self()}
      end;
    _ -> ok
  end,
  {ok, State}.

% called when cowboy receives an Erlang message  
% (=> from another Erlang process).
websocket_info(Info, State) ->
  case Info of
    {forwarded_message, ReceivedMessage} ->
      io:format("[Chat WS:~p] -> Received forwarded message: ~p~n",[self(), ReceivedMessage]),
      Json = jsone:encode(#{<<"type">> => <<"message">>, <<"content">> => ReceivedMessage}),
      {reply, {text, Json}, State};
    _ ->
      {ok, State}
  end.

% called when connection terminate
terminate(Reason, _Req, State) ->
  io:format("[Chat WS:~p] -> Closed websocket connection, Reason: ~p ~n", [self(), Reason]),
  #{username := Username, register_pid := RegisterPid} = State,
  RegisterPid ! {unregister, Username},
  {ok, State}.