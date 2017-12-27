apt install figlet
apt install variety
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


