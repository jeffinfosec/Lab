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

