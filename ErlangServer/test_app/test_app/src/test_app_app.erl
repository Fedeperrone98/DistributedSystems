%%%-------------------------------------------------------------------
%% @doc test_app public API
%% @end
%%%-------------------------------------------------------------------

-module(test_app_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
       {ok, _} = cowboy:start_http(http_listener, 100, [
           {port, 8080}  % Porta su cui Cowboy ascolterà
       ]),
       test_app_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
