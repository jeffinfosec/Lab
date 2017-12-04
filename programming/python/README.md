# one line code to spawn up a bash shell
# useful when you don't have a meterpreter shell

python -c 'import pty; pty.spawn("/bin/bash")'
