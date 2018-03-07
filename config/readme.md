#change logon bg on windows 7
C:\Windows\System32\oobe\info\backgrounds
Size must be 256
#setting http proxy
set export http_proxy="USER:PASSWORD@http://104.129.198.34:10090"
#enable auto login on kali linux
edit /gdm3/daemon.conf
apt-get install openssh-server
#remove run level for SSH
update-rc.d -f ssh remove
update-rc.d -f ssh defaults

edit /etc/ssh/sshd_config
PermitRootLogin = Yes
update-rc.d -f ssh enable 2 3 4 5
vi /etc/motd/

#ssh configuraiton
apt-get install openssh-server
edit /etc/ssh/sshd_config
edit /etc/motd

