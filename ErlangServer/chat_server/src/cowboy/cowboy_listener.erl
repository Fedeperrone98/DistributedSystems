-module(cowboy_listener).
-behaviour(gen_server).

%% API
-export([start_link/0, init/1, handle_call/3, handle_cast/2]).

start_link() ->
  io:format("[cowboy_listener] -> starting new gen_server link~n"),
  gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

routes() ->
  {ok, ChatEndpoint} = application:get_env(chat_endpoint),
  {ok, NotificationEndpoint} = application:get_env(notification_endpoint),
  Routes = [
    {ChatEndpoint, chatroom_listener, []},
    {NotificationEndpoint, notification_listener, []}  
  ],
  {Routes}.

init(_) ->
  {ok, Port} = application:get_env(port),
  {Routes} = routes(),

  Dispatcher = cowboy_router:compile([{'_', Routes}]),

  {ok, Pid} = cowboy:start_clear(chat_listener, [{port, Port}], #{env => #{dispatch => Dispatcher}}),
  io:format("[cowboy_listener] -> new cowboy listener initialized with pid ~p at port ~p~n", [Pid, Port]),
  {ok, []}.

handle_call(Req, _, State) ->
  {reply, Req, State}.

handle_cast(_, State) ->
  {noreply, State}.