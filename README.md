![image](https://user-images.githubusercontent.com/78384615/209057211-685cb1eb-3a5e-4b2a-960e-f2e3bed54965.png)
![image](https://user-images.githubusercontent.com/78384615/209087727-3a8e7614-b271-4159-907e-542c6defa200.png)

## Introduction :wave:
The Cyberinfrastructure Lab at the University of South Carolina is a virtual platform dedicated to cybertraining purposes.
[P4](https://opennetworking.org/p4/) (Programming Protocol-independent Packet Processors) is a novel, open source programming language for network devices. It enables developers to specify how data plane devices, such as switches routers and filters, process packets.

Due to the current shortage of cyber security professionals in the American military[^1], the state-of-the-ark nature of P4, and the virtual equipment and professional tools required to learn the language, UofSC has proposed to address these issues by allowing undergraduate students to conduct research in applied cybersecurity under the guidance of a faculty professor.

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

The V1Model is seperated into several different stages:

`headers` - contains the packet headers and metadata definitions

`parser` - contains the implementation of the programmable parser

`ingress` - contains the ingress control block that includes match-action tables

`egress` - contains the egress control block

`deparser` - contains the code that verifies and computes checksums

![image](https://user-images.githubusercontent.com/78384615/209098259-d8c992c5-2f32-456d-91f2-fff654d22a66.png)

## Code Overview
Ethernet, IPv4, and TCP classes along with metadata structures will be defined in `headers`.

The `parser` block will be parse and ethernet, IPv4, and TCP headers.

The `ingress` block is where the majority of implementation will take place. In order to store data pertaining to the various different flows, `registers` will be used. Their size will correspond to the byte size of the statistic, for example since IP Addresses have a byte size of 32, the registers will also be a byte size of 32 in order to store the data. The size of the registers will be `<655536>`, which will be explained later on.

In order to uniquely identify **flows**, or streams of data that contain the same source/destination IP address, and source/destination port, we must use a hashing algorithm. Luckily, P4 has innate function to hash these values for us, specifically the hashing algorithm, [CRC16](https://github.com/p4lang/tutorials/issues/188). In doing this the function returns a unique value specific to that flow, in other words a `flowID`. This will be used as the primary way to identify and index into registers.

The function will specifically spit out a max value of `<65536>` or `2^16` due to the nature of the hashing algorithm in use. A standard forwarding table will be used, and applied in the `apply` block. Otherwise, the program will compute the hash of the packet entering the network device. If the unique hash value, the `flowID` has already been generated and already exists, then it will amend the start and end time of that flow, as well as the total amount of unidirectional traffic.. Source, destination IP Address and Port stays constant. Otherwise, we can assume that this is a brand new flow. Simply add the data in to the registers and indicate that the flow now exists.

## Workflow of a P4 Program
After compiling a P4 program, two files are generated. A data plane configuration file that implements forwarding logic that includes instructions and resource mappings for the target. Then it generates runtime APIs that are used by the control plane to interact with the data plane. For example adding and removing entries from match-action tables or reading/writing the state of objects. This allows users to manipulate tables and objects.

![image](https://user-images.githubusercontent.com/78384615/208184459-4b776b49-c33e-4daf-9e44-e89725d857b8.png)

### Instructions to replicate

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
 
 [^1]: **Reference**: 1. [J. Lynch, “Inside the Pentagon’s Struggle to Build a Cyber Force,” Fifth Domain publication, October 29, 2018](https://tinyurl.com/yyelqomp)
