-module(test_app_protocol).
-behaviour(cowboy_websocket).

-export([websocket_init/1, websocket_handle/2, websocket_info/2, websocket_terminate/2]).

websocket_init(_TransportName) ->
    {ok, undefined}.

websocket_handle({text, Msg}, State) ->
    {reply, {text, Msg}, State};

websocket_handle(_Data, State) ->
    {ok, State}.

websocket_info(_Info, State) ->
    {ok, State}.

websocket_terminate(_Reason, State) ->
    {ok, State}.