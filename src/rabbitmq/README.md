
# RabbitMQ Note

@(notebook)[Manual|Markdown]



----------

## Install  
```bash
# Add Debian Wheezy backports repository to obtain init-system-helpers
root@DEBIAN:~# gpg --keyserver pgpkeys.mit.edu --recv-key 7638D0442B90D010
root@DEBIAN:~# gpg -a --export 7638D0442B90D010 | sudo apt-key add -
root@DEBIAN:~# echo 'deb http://ftp.debian.org/debian wheezy-backports main' | sudo tee /etc/apt/sources.list.d/wheezy_backports.list

# Add Erlang Solutions repository to obtain esl-erlang
root@DEBIAN:~# wget -O- https://packages.erlang-solutions.com/debian/erlang_solutions.asc | sudo apt-key add -
root@DEBIAN:~# echo 'deb https://packages.erlang-solutions.com/debian wheezy contrib' | sudo tee /etc/apt/sources.list.d/esl.list

root@DEBIAN:~# sudo apt-get update
root@DEBIAN:~# sudo apt-get install init-system-helpers socat esl-erlang

# continue with RabbitMQ installation as explained above
root@DEBIAN:~# wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
root@DEBIAN:~# echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list

root@DEBIAN:~# sudo apt-get update
root@DEBIAN:~# sudo apt-get install rabbitmq-server
```
## Run  

### edit config file

```bash
vim /etc/rabbitmq/rabbitmq.config
```

[rabbitmq.config](/src/rabbitmq/rabbitmq.config)  
  
### start server  

```bash
service rabbitmq-server start
service rabbitmq-server stop
service rabbitmq-server restart
```

## User management  

### add user

> add_user {username} {password} 
``` 
rabbitmqctl add_user test testing
```

### set tag

> set_user_tags {username} {tag ...}  
```
rabbitmqctl set_user_tags test administrator
```

### access control  

> set_permissions [-p vhost] {user} {conf} {write} {read}  
```
rabbitmqctl set_permissions -p '/' test ".*" ".*" ".*"
```
## more
更多命令查看：`rabbitmqctl --help`  

## Web management 

```
rabbitmq-plugins enable rabbitmq-management
```

chrome -> hostname:15672
----

[Back to Summary](/README.md)
