
#!/bin/bash
#turn off NTP
timedatectl set-ntp 0
#set date [going back in time :)]
date --set 2016-11-02
printf "Date set back to 2016!"
#load burp!
java -jar BurpLoader.jar
#back in time...
timedatectl set-ntp 1
