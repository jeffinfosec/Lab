#!/bin/bash

echo "Author: Jeffrey Li"
echo "Killing programs that could interfere WiFi cracking..."

airmon-ng check kill

echo "Switching to monitoring mode..."

airmon-ng start wlan1 

airodump-ng wlan0mon
