#!bin/bash

echo "Configurating interfaces..."
simple_switch -i 0@s1-eth0 -i 1@s1-eth1 --nanolog ipc:///tmp/bm-log.ipc basic.json &
echo "Complete!"

echo "Populating tables with forwarding rules..."
simple_switch_CLI < ~/lab2/rules.cmd
sleep 3

echo "Replacing runtime_CLI.py with modified run time..."
sleep 3

echo "Downloading additional files..."

wget https://raw.githubusercontent.com/SUPERYELLOWBEAVER87/P4-Packet-Monitoring/main/register_formatter.py 
wget https://raw.githubusercontent.com/SUPERYELLOWBEAVER87/P4-Packet-Monitoring/main/register_read.cmd 

sleep 3
echo "Replacing current runtime_CLI.py with modified runtime..."
wget https://raw.githubusercontent.com/SUPERYELLOWBEAVER87/P4-Packet-Monitoring/main/runtime_CLI.py
cp -f /usr/local/lib/python3.5/site-packages/runtime_CLI.py runtime_CLI.py

echo "Cleaning up..."
rm runtime_CLI.py

echo "Complete!"
