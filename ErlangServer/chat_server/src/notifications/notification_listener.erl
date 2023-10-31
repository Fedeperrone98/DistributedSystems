-module(notification_listener).

%%API
-export([init/2, websocket_handle/2, websocket_info/2, terminate/3, websocket_init/1]).

% called when cowboy receives a request
init(Req, _State)->
  % handing the websocket to cowboy_websocket module passing it the request using infinite idle timeout option
  #{username:=CurrentUsername} = cowboy_req:match_qs([{username, nonempty}], Req),
  % TODO: handle username query string missing
  io:format("[notification listener] -> initializing new websocket at pid: ~p for user ~p~n",[self(),CurrentUsername]),
  RegisterPid = whereis(notification_registry),
  InitialState = #{username => CurrentUsername, register_pid => RegisterPid},
  {cowboy_websocket, Req, InitialState, #{idle_timeout => infinity}}.

% stores the Username to Pid mapping in the registry
websocket_init(State)->
  #{username := CurrentUsername, register_pid := RegisterPid} = State,
  RegisterPid ! {register, CurrentUsername, self()},
  {ok, State}.

% called when cowboy receives a text, binary, ping or pong frame from the client
% override of the cowboy_websocket websocket_handle/2 method
websocket_handle(Frame={text, Message}, State) -> 
  if 
    Message == <<"logout">> ->
      #{username := Sender, register_pid := RegisterPid} = State,
      io:format("[notification WS:~p] -> Received logout request from: ~p",[self(), Sender]),
      RegisterPid ! {unregister, Sender};
    true -> ok
  end,
  {ok, State}.

% called when cowboy receives an Erlang message  
% (=> from another Erlang process).
websocket_info(Info, State) ->
  io:format("[notification WS:~p] -> Received info: ~p, along with state: ~p ~n",[self(), Info, State]),
  case Info of
    {increase, Sender} ->
      Reply = jsone:encode(#{<<"type">> => <<"message_notification">>, <<"from">> => Sender}), 
      {reply, {text, Reply}, State};
    {online, Who} ->
      Reply = jsone:encode(#{<<"type">> => <<"online_notification">>, <<"who">> => Who}), 
      {reply, {text, Reply}, State};
    {offline, Who} ->
      Reply = jsone:encode(#{<<"type">> => <<"offline_notification">>, <<"who">> => Who}),
      {reply, {text, Reply}, State}
  end.

% called when connection terminate
terminate(Reason, _Req, State) ->
  io:format("[notification WS:~p] -> Closed websocket connection, Reason: ~p ~n", [self(), Reason]),
  {ok, State}.