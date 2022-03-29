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

Use Lab02 on Pod 5707

1. Launch Mininet
2. Open Lab 2 topology
3. Start the simulation with Run, in the bottom left corner
4. Confirm that Topology is running properly, Shell no.1 terminal
with containernet> prompt

5. Launch vscode from Start Menu
6. Open browser navigate to our repository
7. Open basic-functional, click "RAW" and then copy and paste the code
to replace basic.p4 in vscode.
8. Press CTRL + S to save the new changes.

9. Compile the P4 code, type p4c basic.p4 in vscode terminal to get
the basic.json configuration file.

10. Push the basic.json file to the switch, type push_to_switch basic.json s1
11. Navigate to the switch and confirm the file is there using ls.

12. Configure the interfaces.
13. Type: simple_switch -i 0@s1-eth0 -i 1@s1-eth1 --nanolog ipc:///tmp/bm-log.ipc basic.json&
14. Press ENTER two times.

15. Add entries to the match action table
16. Type: simple_switch_CLI < ~/lab2/rules.cmd

17. Display the switchlogs with ./nanomsg_client.py on s1

Ready for testing!

Send messages with: ./send.py 10.0.0.2 HelloWorld
Receive messages on host with ./recv.py

Read registers with syntax:
register_read <register_name> <index>

In order to use this syntax you must be in RuntimeCmd enviroment!
Type simple_switch_CLI to enter.

If you messed up with mininet topology and need a restart: sudo mn -c
