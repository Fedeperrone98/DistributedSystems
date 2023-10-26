-module(chatroom_listener).

%%API
-export([init/2, websocket_handle/2, websocket_info/2, terminate/3]).

% called when cowboy receives a request
init(Req, _State)->
  % handing the websocket to cowboy_websocket module passing it the request using infinite idle timeout option
  #{username:=CurrentUsername} = cowboy_req:match_qs([{username, nonempty}], Req),
  % TODO: handle username query string missing
  io:format("[chatroom_listener] -> initializing new websocket at pid: ~p for user ~p~n",[self(),CurrentUsername]),
  RegisterPid = whereis(registry),
  RegisterPid ! {register, CurrentUsername, self()},
  InitialState = #{username => CurrentUsername, register_pid => RegisterPid},
  {cowboy_websocket, Req, InitialState, #{idle_timeout => infinity}}.

% override of the cowboy_websocket websocket_handle/2 method
websocket_handle(Frame={text, Message}, State) -> 
  io:format("[chatroom listener] -> Received frame: ~p, along with state: ~p~n",[Frame, State]),
  DecodedMessage = jsone:try_decode(Message),
  case DecodedMessage of
    {ok, MessageMap} ->
      Destination = maps:get(<<"username">>, MessageMap),
      Message = maps:get(<<"message">>, MessageMap)
      #{register_pid := RegsiterPid} = State,
      RegisterPid ! {lookup, Destination, self()}
      receive
        {username_pid, Pid} when Pid =/= undefined ->
          io:format("[chatroom listener] -> Found destination user at pid ~p~n", [Pid]),
          Pid ! {forward_message, Message}
      end
    end,
  {ok, State}.

% called when cowboy receives an Erlang message  
% (=> from another Erlang process).
websocket_info(Info, State) ->
  io:format("[chatroom listener] -> Received info: ~p, along with state: ~p ~n",[Info, State]),
  {ok, State}.

% called when connection terminate
terminate(Reason, _Req, State) ->
  io:format("[chatroom listener] -> Closed websocket connection on host: ~p, Reason: ~p ~n", [self(), Reason]),
  #{username := Username, register_pid := RegisterPid} = State,
  RegisterPid ! {unregister, Username},
  {ok, State}.