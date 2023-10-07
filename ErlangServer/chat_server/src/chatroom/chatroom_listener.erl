-module(chatroom_listener).

%%API
-export([init/2, websocket_handle/2]).

% called when cowboy receives a request
init(Req, _State)->
  io:format("[chatroom_listener] -> initializing new websocket~n"),
  {cowboy_websocket, Req, none}. % handing the websocket to cowboy_websocket module passing it the request

% override of the cowboy_websocket websocket_handle/2 method
websocket_handle(Frame, State) -> 
  io:format("[chatroom listener] -> Received frame: ~p, along with state: ~p",[Frame, State]),
  {ok, State}.