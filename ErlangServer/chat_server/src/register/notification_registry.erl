-module(notification_registry).

-export([start_notification_registry/0]).

start_notification_registry()->
  Pid = spawn(fun() -> registry_loop(#{}) end),
  io:format("[Register] -> Starting register at pid ~p~n",[Pid]),
  register(notification_registry, Pid).

registry_loop(Mappings) ->
  receive 
    {register, Username, Pid} ->
      io:format("[Register] -> adding user ~p with pid ~p~n",[Username, Pid]),
      NewMappings = maps:put(Username, Pid, Mappings),
      registry_loop(NewMappings);
    {increase, Username, Sender} ->
      case maps:get(Username, Mappings, undefined) of 
        Pid when Pid =/= undefined-> 
          io:format("[Register] -> Pushing new notification to ~p by ~p~n",[Username, Sender]),
          Pid ! {increase, Sender};
        undefined ->
          io:format("[Register] -> User not online~n")
      end,
      registry_loop(Mappings);
    {unregister, Username} ->
      io:format("[Register] -> removing user ~p from registry~n", [Username]),
      NewMappings = maps:remove(Username, Mappings),
      registry_loop(NewMappings)
    end.