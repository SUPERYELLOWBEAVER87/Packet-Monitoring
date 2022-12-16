# P4-Packet-Monitoring

Monitoring devices such as Netflow collect active IP network traffic as it flows in or out
of an interface. While Netflow and other legacy protocols provide visibility and help
identifying network problems, they are not granular (resolution is typically in the order of
seconds) and are subject to proprietary implementations.

#### Workflow of a P4 Program
After compiling a P4 program, two files are generated. A data plane configuration file that implements forwarding logic that includes instructions and resource mappings for the target. Then it generates runtime APIs that are used by the control plane to interact with the data plane. For example adding and removing entries from match-action tables or reading/writing the state of objects. This allows users to manipulate tables and objects.

![image](https://user-images.githubusercontent.com/78384615/208184459-4b776b49-c33e-4daf-9e44-e89725d857b8.png)
 
 #### Simulation Network Topology
 ![image](https://user-images.githubusercontent.com/78384615/207913796-a7a8ed5b-224e-442f-8e1e-8156a3e91c48.png)
 
 #### Match-Action Pipeline, Most of the logic will be implemented in the Ingress:
![image](https://user-images.githubusercontent.com/78384615/208183620-3044829b-28d0-487b-aa11-d8804d611a94.png)
 
 #### Goals.
 The goal of this project is to use the capability of P4 devices to monitor and track flows,
and collect corresponding statistics. Examples of statistics to be collected are

 * Source and Destination IP addresses
 * Source and Destination transport-layer ports
 * Amount of unidirectional traffic (bytes)
 * Start Time
 * End Time
 * Rate (bits per second)
 
PROJECT COMPLETE, STEPS TO REPLICATE PACKET MONITOR

#### STEPS TO RECREATE PACKET MONITORING ENVIROMENT**
Use Lab02 on Pod 5707

1. Navigate to: github.com/superyellowbeaver87
2. Copy the **RAW LINK** of the setup.sh file.
3. Launch Mininet from the desktop
4. Click **RUN** in the bottom left-hand corner.
5. Open up a terminal on the switch.
6. Install wget module on the switch, using the following command: apt-get install wget
7. Type **Y** and click Enter when the switch asks you for confirmation.
8. Install the setup script using: wget <**LINK TO SETUP.SH SCRIPT FROM GITHUB**>, use Shift + Insert to paste in Linux.
9. Once download is complete, run the setup script using: bash setup.sh
10. Packet monitoring enviroment is now ready!

## Testing commands:
Send **single packet flows** use: ./send.py on Host 1 and ./recv.py on Host 2.
Send **stream of packets** use: ping 10.0.0.2 on Host 1.

Get the index from the registers: **register_read r_index <INDEX NUMBER>**
Read the index in the switch by using: **bash read.sh**, then type in the index.
 
