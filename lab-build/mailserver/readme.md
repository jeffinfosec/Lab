 __  __       _ _   ____                           
|  \/  | __ _(_) | / ___|  ___ _ ____   _____ _ __ 
| |\/| |/ _` | | | \___ \ / _ \ '__\ \ / / _ \ '__|
| |  | | (_| | | |  ___) |  __/ |   \ V /  __/ |   
|_|  |_|\__,_|_|_| |____/ \___|_|    \_/ \___|_|   
                                                   
 ____       _               
/ ___|  ___| |_ _   _ _ __  
\___ \ / _ \ __| | | | '_ \ 
 ___) |  __/ |_| |_| | |_) |
|____/ \___|\__|\__,_| .__/ 
                     |_| 
#Postfix = Mail Transfer Agents / SMTP servers
#DoveCot = IMAP/POP3 Server

apt-get install postfix
cat /var/log/mail.log

service postfix status / start

netstat -lntup
telnet localhost 25

apt-get install dovecot-common dovecot-imapd dovecot-pop3d

#apt-get install mutt

x
