-module(chat_registry).

-export([start_chat_registry/0]).

start_chat_registry()->
  Pid = spawn(fun() -> registry_loop(#{}) end),
  io:format("[Chat Register] -> Starting register at pid ~p~n",[Pid]),
  register(chat_registry, Pid).

registry_loop(Mappings) ->
  receive 
    {register, Username, Pid} ->
      io:format("[Chat Register] -> adding user ~p with pid ~p~n",[Username, Pid]),
      NewMappings = maps:put(Username, Pid, Mappings),
      registry_loop(NewMappings);
    {forward, Username, Content, Sender, Caller} ->
      case maps:get(Username, Mappings, undefined) of 
        Pid when Pid =/= undefined-> 
          io:format("[Chat Register] -> forwarding message to ~p~n",[Pid]),
          Pid ! {forwarded_message, Content};
        undefined ->
          io:format("[Chat Register] -> ~p not in chat~n",[Username]),
          NotificationPid = whereis(notification_registry),
          NotificationPid ! {increase, Username, Sender, Caller}
      end,
      registry_loop(Mappings);
    {unregister, Username} ->
      io:format("[Chat Register] -> removing user ~p from registry~n", [Username]),
      NewMappings = maps:remove(Username, Mappings),
      registry_loop(NewMappings)
    end.