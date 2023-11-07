rebar3 clean
rebar3 compile
nohup rebar3 shell --name 'chat@10.2.1.57' --setcookie 'messaging_server' &