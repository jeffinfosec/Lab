
# /bin/bash
timedatectl set-ntp 0
date --set 2016-11-02
java -jar BurpLoader.jar
timedatectl set-ntp 1
