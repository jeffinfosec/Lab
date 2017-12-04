#Look for a vuln in Samba; Run Nmap
#set PAYLOAD cmd/unix/reverse_netcat
#python -c 'import pty;pty.spawn("/bin/bash")'
#hint: samba vuln
#tomcat default creds
#linux kernel exploit
#postgres sql vuln (default creds)
#dirbuster the port 80
#enum4linux to enumerate users
#!! | grep 'user:' | cut -d'[' -f2 | cut -d']' -f1 > userlist
# smtp-user-enum -M VRFY -U /usr/share/wordlists/metasploit/unix_users.txt -t 10.11.1.10 > smtp_users
# cat smtp_users | grep exists | cut -d" " -f2 >> users
