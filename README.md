# P4-Packet-Monitoring
The goal of this is to use the capability of P4 devices to monitor and track flows, and collect corresponding statistics. 
 
 Monitoring devices such as Netflow collect active IP network traffic as it flowsi n or out of an interface. While Netflow and other legacy protocols provide visibility and help 
 identifying network problems, they are not granular (resolution is typically in order of seconds) and are subject to proprietary implementations.
 
 Use P4 and collect the following statistics. 
 Source and Destination IP addresses
 Source and Destination transport-layer ports
 Amount of unidirectional traffic (bytes)
 Start Time
 End Time
 Rate (bits per second)
 
 
PROJECT COMPLETE, STEPS TO REPLICATE PACKET MONITOR

Use Lab02 on a pod that has internet to download github files.

Launch Mininet Lab 2 topology. Run it and ensure you have no errors. Use sudo mn -c in a terminal to clean the topology if needed.

Navigate to this github repo on the VM. Copy the link to the RAW version of the setup.sh script.

Launch a terminal in Mininet topology on s1.

Install wget using: apt-get install wget
When it asks you for confirmation type Y and click Enter.

Download the setup.sh script and run it using: wget https://raw.githubusercontent.com/SUPERYELLOWBEAVER87/P4-Packet-Monitoring/main/runtime_CLI.py

If you use the command 'ls' you should now see the script in your directory.
Run it with bash: bash setup.sh

Your enviroment is now setup to use the packet monitoring P4 script.
