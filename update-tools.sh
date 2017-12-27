apt-get install metasploit-framework
apt-get install figlet
apt-get install variety

#powershell empire
if [ ! -d "/opt/Empire" ]; then
git clone https://github.com/EmpireProject/Empire.git /opt/Empire
else
echo "Empire installed...."
fi
