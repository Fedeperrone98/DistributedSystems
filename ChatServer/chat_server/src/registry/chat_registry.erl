-module(chat_registry).

-export([start_chat_registry/0]).

start_chat_registry()->
  Pid = spawn(fun() -> registry_loop(#{}) end),
  io:format("[Chat Registry] -> Starting register at pid ~p~n",[Pid]),
  register(chat_registry, Pid).

registry_loop(Mappings) ->
  receive 
    {register, Username, Pid} ->
      io:format("[Chat Registry] -> adding user ~p with pid ~p~n",[Username, Pid]),
      NewMappings = maps:put(Username, Pid, Mappings),
      registry_loop(NewMappings);
    {forward, Username, Content, Sender, Caller} ->
      % save to MySQL, if succesful => forward and reply to Pid 
      % else reply with error to Caller
      case maps:get(Username, Mappings, undefined) of 
        Pid when Pid =/= undefined-> 
          io:format("[Chat Registry] -> forwarding message to ~p~n",[Pid]),
          Pid ! {forwarded_message, Content};
        undefined ->
          io:format("[Chat Registry] -> ~p not in chat~n",[Username]),
          NotificationNode = application:get_env(notification_node),
          if 
            nodes() == [] -> net_kernel:connect_node(NotificationNode);
            true -> ok
          end,
          {notification_registry, NotificationNode} ! {increase, Username, Sender}
      end,
      registry_loop(Mappings);
    {unregister, Username} ->
      io:format("[Chat Registry] -> removing user ~p from registry~n", [Username]),
      NewMappings = maps:remove(Username, Mappings),
      registry_loop(NewMappings)
    end.