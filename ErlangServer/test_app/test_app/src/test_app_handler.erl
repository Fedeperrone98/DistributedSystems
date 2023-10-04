-module(test_app_handler).
-behaviour(cowboy_handler).

-export([init/2, handle/2, terminate/3]).

init(_Transport, Req) ->
    {ok, Req, undefined}.

handle(Req, State) ->
    {websocket, my_protocol, Req, State}.

terminate(_Reason, _Req, _State) ->
    ok.