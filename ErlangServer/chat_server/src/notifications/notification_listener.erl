-module(notification_listener).

%%API
-export([init/2, websocket_handle/2, websocket_info/2, terminate/3]).

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
websocket_handle(Frame, State) -> 
  io:format("[notification listener] -> Received frame: ~p, along with state: ~p~n",[Frame, State]),
  {ok, State}.

% called when cowboy receives an Erlang message  
% (=> from another Erlang process).
websocket_info(Info, State) ->
  io:format("[notification listener] -> Received info: ~p, along with state: ~p ~n",[Info, State]),
  case Info of
    {increase, Sender} -> {reply, {text, Sender}, State};
    _ -> {ok, State}
  end.

% called when connection terminate
terminate(Reason, _Req, State) ->
  io:format("[notification listener] Terminate => logout request received from Pid: ~p, Reason: ~p ~n", [self(), Reason]),
  {ok, State}.