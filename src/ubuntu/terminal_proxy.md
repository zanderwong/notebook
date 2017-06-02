# terminal的网络代理

terminal设置网络代理，可以通过代理进行apt install


　　

  
  
### 1st：临时使用http代理
> 在使用apt-get之前
```bash
export http_proxy="http://用户名:密码@代理IP:代理端口"
```

　　

  
    
    
### 2nd：持久化http代理
> apt将与其它应用程序一直使用http代理  

```bash
vim ~/.bashrc
```
键入内容:
```bash
http_proxy=http://用户名:密码@代理地址:代理端口
export http_proxy
```

　　

   
     
     

### 3rd：apt独享代理
　　在终端下编辑/etc/apt/apt.conf  
```bash
Acquire::http::Proxy “http://yourproxyaddress:proxyport”;
```
　　

### 4th：Redhat Linux
> 在profile文件中设置相关环境变量  

```bash
vi /etc/profile
```
键入内容:  

```bash
http_proxy=http://用户名:密码@代理服务器地址:端口
```
