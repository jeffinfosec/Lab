#powershell empire
if [ ! -d "/opt/Empire" ]; then
git clone https://github.com/EmpireProject/Empire.git /opt/Empire
else
echo "Empire installed...."
fi
