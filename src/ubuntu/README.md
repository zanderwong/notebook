
# Ubuntu Note

@(notebook)[Manual|Markdown]



----------

[TOC]

## Install Ubuntu Gnome
### system image

| Ubuntu Gnome      |     *Link* |   
| :-------- | --------:|
| standard download|*[enter link description here](http://cdimage.ubuntu.com/ubuntu-gnome/releases/16.04.1/release/ubuntu-gnome-16.04.1-desktop-amd64.iso)* |
| BitTorrent download|    *[enter link description here](http://cdimage.ubuntu.com/ubuntu-gnome/releases/16.04.1/release/ubuntu-gnome-16.04.1-desktop-amd64.iso.torrent)* |
|zsync metafile | *[enter link description here](http://cdimage.ubuntu.com/ubuntu-gnome/releases/16.04.1/release/ubuntu-gnome-16.04.1-desktop-amd64.iso.zsync)* |
| file listing | *[enter link description here](http://cdimage.ubuntu.com/ubuntu-gnome/releases/16.04.1/release/ubuntu-gnome-16.04.1-desktop-amd64.list)* |
| contents of live filesystem | *[enter link description here](http://cdimage.ubuntu.com/ubuntu-gnome/releases/16.04.1/release/ubuntu-gnome-16.04.1-desktop-amd64.manifest)* |


>
> #### Other Distribution
| Distribution      |     *Link* |   
| :-------- | --------:|    
| Ubuntu     |    *[enter link description here](http://releases.ubuntu.com/16.04/ubuntu-16.04.1-desktop-amd64.iso.torrent)* |  
| Kubuntu   |   *[enter link description here](http://cdimage.ubuntu.com/kubuntu/releases/16.04.1/release/kubuntu-16.04.1-desktop-amd64.iso.torrent)* |  
| Lubuntu    |   *[enter link description here](http://cdimage.ubuntu.com/lubuntu/releases/16.04.1/release/lubuntu-16.04.1-desktop-amd64.iso.torrent)* |  
| Xubuntu    |   *[enter link description here](http://cdimage.ubuntu.com/xubuntu/releases/16.04.1/release/xubuntu-16.04.1-desktop-amd64.iso.torrent)* |  
|Mythbuntu    |   *[enter link description here](http://cdimage.ubuntu.com/mythbuntu/releases/16.04.1/release/mythbuntu-16.04.1-desktop-amd64.iso.torrent)* |  
| Ubuntu MATE    |   *[enter link description here](http://cdimage.ubuntu.com/ubuntu-mate/releases/16.04.1/release/ubuntu-mate-16.04.1-desktop-amd64.iso.torrent)* |  
| Ubuntu Studio    |   *[enter link description here](http://cdimage.ubuntu.com/ubuntustudio/releases/16.04.1/release/ubuntustudio-16.04.1-dvd-amd64.iso.torrent)* |  



   

## System Settings
### language and input method
![Alt text](/res/ubuntu/Screenshot from 2016-08-13 01-17-19.PNG)


### system login configuration
> Unity：

1. sudo gedit /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

2. greeter-show-manual-login=true              //active root

3. reboot
4. login with root
5. sublime /root/.profile
```
tty -s && mesg n                         //deny root warn
pulseaudio --start --log-target=syslog     //active audio
```
> Gnome：

1. su

2. gedit /etc/pam.d/gdm
```nginx
# auth required pam_succeed_if.so user != root quiet
```
3. gedit /etc/pam.d/gdm-password
```nginx
# auth required pam_succeed_if.so user != root quiet
```

   

### apt repository configuration
#### source list edit    

```nginx
# China Mainland Mirrors
deb http://mirrors.163.com/ubuntu/ xenial main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ xenial-security main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ xenial-updates main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ xenial main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ xenial-security main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ xenial-updates main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ xenial-backports main restricted universe multiverse



# See http://help.ubuntu.com/community/UpgradeNotes for how to upgrade to
# newer versions of the distribution.
deb http://mirrors.sohu.com/ubuntu/ xenial main restricted
# deb-src http://us.archive.ubuntu.com/ubuntu/ xenial main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb http://mirrors.sohu.com/ubuntu/ xenial-updates main restricted
# deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-updates main restricted

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team, and may not be under a free licence. Please satisfy yourself as to
## your rights to use the software. Also, please note that software in
## universe WILL NOT receive any review or updates from the Ubuntu security
## team.
deb http://mirrors.sohu.com/ubuntu/ xenial universe
# deb-src http://us.archive.ubuntu.com/ubuntu/ xenial universe
deb http://mirrors.sohu.com/ubuntu/ xenial-updates universe
# deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-updates universe

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team, and may not be under a free licence. Please satisfy yourself as to
## your rights to use the software. Also, please note that software in
## multiverse WILL NOT receive any review or updates from the Ubuntu
## security team.
deb http://mirrors.sohu.com/ubuntu/ xenial multiverse
# deb-src http://us.archive.ubuntu.com/ubuntu/ xenial multiverse
deb http://mirrors.sohu.com/ubuntu/ xenial-updates multiverse
# deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-updates multiverse

## N.B. software from this repository may not have been tested as
## extensively as that contained in the main release, although it includes
## newer versions of some applications which may provide useful features.
## Also, please note that software in backports WILL NOT receive any review
## or updates from the Ubuntu security team.
deb http://mirrors.sohu.com/ubuntu/ xenial-backports main restricted universe multiverse
# deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse

## Uncomment the following two lines to add software from Canonical's
## 'partner' repository.
## This software is not part of Ubuntu, but is offered by Canonical and the
## respective vendors as a service to Ubuntu users.
deb http://archive.canonical.com/ubuntu xenial partner
deb-src http://archive.canonical.com/ubuntu xenial partner

deb http://mirrors.sohu.com/ubuntu/ xenial-security main restricted
# deb-src http://security.ubuntu.com/ubuntu xenial-security main restricted
deb http://mirrors.sohu.com/ubuntu/ xenial-security universe
# deb-src http://security.ubuntu.com/ubuntu xenial-security universe
deb http://mirrors.sohu.com/ubuntu/ xenial-security multiverse
deb http://mirrors.sohu.com/ubuntu/ xenial-proposed restricted multiverse universe main
# deb-src http://security.ubuntu.com/ubuntu xenial-security multiverse


# deb http://ppa.launchpad.net/noobslab/deepin-sc/ubuntu xenial main
# deb-src http://ppa.launchpad.net/noobslab/deepin-sc/ubuntu xenial main
```   


#### update
```
apt update
```
#### upgrade
```
apt upgrade
```
   
#### apt proxy
[terminal的网络代理](/src/ubuntu/ternimal_proxy.md)  

   

   

    
      

### application install
##### java
```powershell
add-apt-repository ppa:upd8team/java
apt update
apt install oracle-java8-installer
```
##### gradle
```
apt install gradle
```
##### maven
```
apt install maven
```
##### golang
```
apt install golang
```
### theme settings

> Paper
```bash
# add daily builds PPA
sudo add-apt-repository ppa:snwh/pulp
# update repository info
sudo apt-get update
# install icon theme
sudo apt-get install paper-icon-theme
# install gtk theme
sudo apt-get install paper-gtk-theme
# install cursor theme
sudo apt-get install paper-cursor-theme
```
> Docky
```
apt install docky
```
Hide the settings icon
```bash
gconftool-2 --type Boolean --set /apps/docky-2/Docky/Items/DockyItem/ShowDockyItem False
```

   

## Screenshot
![Alt text](/res/ubuntu/Screenshot from 2016-08-13 01-14-20.png)
![Alt text](/res/ubuntu/Screenshot from 2016-08-13 01-17-52.png)


----

[Back to Summary](/README.md)
