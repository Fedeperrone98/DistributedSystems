-module(registry).

-export([start_registry/0]).

start_registry()->
  Pid = spawn(fun() -> registry_loop(#{}) end),
  io:format("[Register] -> Starting register at pid ~p~n",[Pid]),
  register(registry, Pid).

registry_loop(Mappings) ->
  receive 
    {register, Username, Pid} ->
      io:format("[Register] -> adding user ~p with pid ~p~n",[Username, Pid]),
      NewMappings = maps:put(Username, Pid, Mappings),
      registry_loop(NewMappings);
    {forward, Username, Content} ->
      case maps:get(Username, Mappings, undefined) of 
        Pid when Pid =/= undefined -> 
          io:format("[Register] -> forwarding message to ~p~n",[Pid]),
          Pid ! {forwarded_message, Content}
      end,
      registry_loop(Mappings);
    {unregister, Username} ->
      io:format("[Register] -> removing user ~p from registry~n", [Username]),
      NewMappings = maps:remove(Username, Mappings),
      registry_loop(NewMappings)
    end.