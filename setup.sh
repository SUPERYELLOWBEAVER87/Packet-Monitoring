#!bin/bash

echo -e "\nConfigurating interfaces...\n"
simple_switch -i 0@s1-eth0 -i 1@s1-eth1 --nanolog ipc:///tmp/bm-log.ipc basic.json &
echo "Complete!"

sleep 5

echo -e "\nPopulating tables with forwarding rules...\n"
simple_switch_CLI < ~/lab2/rules.cmd
sleep 5

echo -e "\nReplacing runtime_CLI.py with modified run time...\n"
sleep 5

echo -e "\nDownloading additional files...\n"

wget https://raw.githubusercontent.com/SUPERYELLOWBEAVER87/P4-Packet-Monitoring/main/register_formatter.py 
wget https://raw.githubusercontent.com/SUPERYELLOWBEAVER87/P4-Packet-Monitoring/main/register_read.cmd 

echo "Replacing current runtime_CLI.py with modified runtime..."
sleep 5

wget https://raw.githubusercontent.com/SUPERYELLOWBEAVER87/P4-Packet-Monitoring/main/runtime_CLI.py
sleep 3
cp -f /usr/local/lib/python3.5/site-packages/runtime_CLI.py runtime_CLI.py

echo "Cleaning up..."
rm runtime_CLI.py

echo "Complete!"
