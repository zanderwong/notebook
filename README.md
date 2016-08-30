# MYSQL Install and Configuration (winx64)

## Download   
下载MYSQL 5.7.11 zip 安装包
[download](http://mysql.mirrors.pair.com/Downloads/MySQL-5.7/mysql-5.7.14-winx64.zip) 


## Install 
解压到心仪的路径
D:\Program Files\MYSQL

## Configuration
#### create a data directory
> 
数据的存储路径 D:\Program Files\MYSQL\data       
此文件夹后面会有用到      

####  create a configuration file for MYSQL
example: D:\Program Files\MYSQL\my-default.ini 

temple:

```ini
# For advice on how to change settings please see
# http://dev.mysql.com/doc/refman/5.7/en/server-configuration-defaults.html
# *** DO NOT EDIT THIS FILE. It's a template which will be copied to the
# *** default location during install, and will be replaced if you
# *** upgrade to a newer version of MySQL.

[mysqld]

# Remove leading # and set to the amount of RAM for the most important data
# cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%.
# innodb_buffer_pool_size = 128M

# Remove leading # to turn on a very important data integrity option: logging
# changes to the binary log between backups.
# log_bin

# These are commonly set, remove the # and set as required.
# basedir = .....
# datadir = .....
# port = .....
# server_id = .....

#########################
# basedir 为安装文件解压后的目录 ｜ basedir和datadir 可以使用相对路径
# basedir 为根目录
basedir = D:\\Program Files\\MYSQL
# datadir 为用来存放数据的目录
datadir=D:\\Program Files\\MYSQL\\data
# port 为端口号
port=3306
# mar_connections为最大连接数
max_connections=20
character_set_server=utf8
	

# Remove leading # to set options mainly useful for reporting servers.
# The server defaults are faster for transactions and fast SELECTs.
# Adjust sizes as needed, experiment to find the optimal values.
# join_buffer_size = 128M
# sort_buffer_size = 2M
# read_rnd_buffer_size = 2M 

explicit_defaults_for_timestamp=true
sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES
```

##  Initializing the Data Directory
当然，按照mysql官方文档给出的步骤还有一步 Selecting a MySQL Server Type，就是选择用 mysqld 还是 mysqld-debug ｜命令如下
```powershell
mysqld --defaults-file="D:\Program Files\MYSQL\my.ini" --initialize-insecure
```


> 注：
    1. 这个命令很重要，它会初始化 data 目录，在执行此命令前请先把data目录下的所有文件先删除，否则会失败
    2. 可以选择用 --initialize-insecure 或者 --initialize 来初始化，--initialize-insecure 初始化root密码为空，如果用 --initialize来初始化，会产生一个随机密码


执行成功后会在data目录 下看到 mysql，perofrmance_schema，sys目录，同时还会有一些文件


## Install MYSQL service
```powershell
mysqld -install
```
Service successfully installed.

## Start MYSQL service
```powershell
net start mysql
```
The MySQL service is starting.
The MySQL service was started successfully.

到这里，mysql服务就启动好，我们就可以用root进入 
## Hack in MYSQL with root
```powershell
mysql -u root -p
```




如果中途有什么步骤失败，一定要执行 mysql 移除命令，然后删除 data 目录下的所有文件
```powershell
mysqld -remove
```

特别提醒：5.7 和 5.6 不太相同，要自己初始化数据 data 目录，不然启动不会成功




mysql 安装完后可能会用到的语句
```powershell
alter user 'root'@'localhost' identified by '123';
create database victor;
create user 'zander'@'localhost' identified by 'zander@123';
flush privileges;
creaet user 'zanderremote'@'%' identified by 'zanderremote@123';
flush privileges;
grant all on zander.* to 'zander'@'localhost' identified by 'zander@123';
flush privileges;
grant all on victor.* to 'zanderremote'@'%' identified by 'zanderemote@123';
flush privileges;

################################
show variables like 'collation_%';
show variables like 'character_set_%';
set collation_connection=utf8_general_ci;
set character_set_client utf8;
set character_set_connection=utf8;
set character_set_results=utf8;
```


[mysql 配置参数查询](http://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html)

