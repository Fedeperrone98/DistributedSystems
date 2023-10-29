-module(notification_registry).

-export([start_notification_registry/0]).

start_notification_registry()->
  Pid = spawn(fun() -> registry_loop(#{}) end),
  io:format("[Notification Register] -> Starting register at pid ~p~n",[Pid]),
  register(notification_registry, Pid).

send_online(_Key, Value, Who) ->
  Value ! {online, Who}.
send_offline(_Key, Value, Who) ->
  Value ! {offline, Who}.

registry_loop(Mappings) ->
  receive 
    {register, Username, Pid} ->
      io:format("[Notification Register] -> adding user ~p with pid ~p~n",[Username, Pid]),
      NewMappings = maps:put(Username, Pid, Mappings),
      registry_loop(NewMappings);
    {increase, Username, Sender, Caller} ->
      case maps:get(Username, Mappings, undefined) of 
        Pid when Pid =/= undefined-> 
          io:format("[Notification Register] -> Pushing new notification to ~p by ~p~n",[Username, Sender]),
          Pid ! {increase, Sender};
        undefined ->
          io:format("[Notification Register] -> User not logged, Notifying ~p to store notification~n",[Caller]),
          Caller ! {store_notification, Sender}
      end,
      registry_loop(Mappings);
    {unregister, Username} ->
      io:format("[Notification Register] -> removing user ~p from registry~n", [Username]),
      NewMappings = maps:remove(Username, Mappings),
      registry_loop(NewMappings);
    {broadcast_online, Who} ->
      io:format("[Notification Register] -> New user logged in, notifying active users~n"),
      maps:foreach(fun(Key, Value) -> send_online(Key,Value,Who) end, Mappings),
      registry_loop(Mappings);
    {broadcast_offline, Who} ->
      io:format("[Notification Register] -> user logged out, notifying active users~n"),
      maps:foreach(fun(Key, Value) -> send_offline(Key,Value,Who) end, Mappings),
      registry_loop(Mappings)
    end.