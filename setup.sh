#!bin/bash

echo "Packet Monitoring Setup Script, written by Samuel Dao."
sleep 2 

echo -e "\nDownloading P4 configuration file...\n"
wget https://raw.githubusercontent.com/SUPERYELLOWBEAVER87/P4-Packet-Monitoring/main/basic.json
sleep 5

echo -e "\nConfigurating interfaces...\n"
simple_switch -i 0@s1-eth0 -i 1@s1-eth1 --nanolog ipc:///tmp/bm-log.ipc basic.json &

sleep 5

echo -e "\nPopulating tables with forwarding rules...\n"
simple_switch_CLI < ~/lab2/rules.cmd
sleep 5
echo -e "\nComplete!\n"

echo -e "\nDownloading additional files...\n"

wget https://raw.githubusercontent.com/SUPERYELLOWBEAVER87/P4-Packet-Monitoring/main/readregister.sh
wget https://raw.githubusercontent.com/SUPERYELLOWBEAVER87/P4-Packet-Monitoring/main/register_formatter.py 
wget https://raw.githubusercontent.com/SUPERYELLOWBEAVER87/P4-Packet-Monitoring/main/register_read.cmd 

echo -e "\nReplacing current runtime_CLI.py with modified runtime...\n"
sleep 2

wget https://raw.githubusercontent.com/SUPERYELLOWBEAVER87/P4-Packet-Monitoring/main/runtime_CLI.py
sleep 3
cp -f runtime_CLI.py /usr/local/lib/python3.5/site-packages/runtime_CLI.py

echo "Cleaning up..."
rm -f runtime_CLI.py 

echo -e "\nComplete!\n"
echo -e "Packet monitoring enviroment is ready!\n"
