![image](https://user-images.githubusercontent.com/78384615/209057211-685cb1eb-3a5e-4b2a-960e-f2e3bed54965.png)
![image](https://user-images.githubusercontent.com/78384615/209087727-3a8e7614-b271-4159-907e-542c6defa200.png)

## Introduction :wave:
The Cyberinfrastructure Lab at the University of South Carolina is a virtual platform dedicated to cybertraining purposes.
[P4](https://opennetworking.org/p4/) (Programming Protocol-independent Packet Processors) is a novel, open source programming language for network devices. It enables developers to specify how data plane devices, such as switches routers and filters, process packets.

Due to the current shortage of cyber security professionals in the American military[^1], as well as the state-of-the-ark nature of P4 and the virtual equipment and professional tools required to learn the language, UofSC has proposed to address these issues by allowing undergraduate students to conduct research in applied cybersecurity under the guidance of a faculty professor.

### My Research Topic: [Implementing a Monitoring Device using a P4 Programmable Switch](http://ce.sc.edu/cyberinfra/docs/onr_projects/spring2022/P4%20monitoring.pdf)
Monitoring devices such as Netflow collect active IP network traffic as it flows in or out of an interface. While Netflow and other legacy protocols provide visibility and help identifying network problems, they are not granular (resolution is typically in the order of seconds) and are subject to proprietary implementations.


The goal of this project is to use the capability of P4 devices to monitor and track flows, and collect corresponding statistics. Examples of statistics to be collected are:
```
- Source IP Address
- Destination IP Address
- Source Port
- Destination Port
- Amount of unidirectional traffic in bytes
- Start time
- End time
- Rate (bps)
```

## Implementation
The research will take over the course of eight weeks from February 1, 2022 - April 22, 2022.

### Workflow of a P4 Program
After compiling a P4 program, two files are generated. A data plane configuration file that implements forwarding logic that includes instructions and resource mappings for the target. Then it generates runtime APIs that are used by the control plane to interact with the data plane. For example adding and removing entries from match-action tables or reading/writing the state of objects. This allows users to manipulate tables and objects.

![image](https://user-images.githubusercontent.com/78384615/208184459-4b776b49-c33e-4daf-9e44-e89725d857b8.png)
 
 ### Simulation Network Topology
 ![image](https://user-images.githubusercontent.com/78384615/207913796-a7a8ed5b-224e-442f-8e1e-8156a3e91c48.png)
 
 ### Match-Action Pipeline, Most of the logic will be implemented in the Ingress:
![image](https://user-images.githubusercontent.com/78384615/208183620-3044829b-28d0-487b-aa11-d8804d611a94.png)
 
 ### Goals
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
 
 [^1]: **Reference**: 1. [J. Lynch, “Inside the Pentagon’s Struggle to Build a Cyber Force,” Fifth Domain publication, October 29, 2018](https://tinyurl.com/yyelqomp)
