<<<<<<< HEAD
apt install figlet
apt install variety
=======
apt-get install metasploit-framework
apt-get install figlet
apt-get install variety

>>>>>>> 6a3f943b6ffad6c50a9491c40572fc719a905e29
#powershell empire
echo "Detecting Powershell Empire..."
if [ ! -d "/opt/Empire" ]; then
git clone https://github.com/EmpireProject/Empire.git /opt/Empire
else
echo "Installed!!"
fi

echo "Detecting CrackMap Exec..."
if [ ! -d "/opt/CrackMapExec" ]; then
git clone https://github.com/byt3bl33d3r/CrackMapExec.git /opt/CrackMapExec
else
echo "Installed!!"
fi


