import ipaddress
import sys

if(len(sys.argv) <= 1):
    filename = input("Enter in the name of the register output text file.\n")
else:
    filename = sys.argv[1]

print("\n\nP4 Register Formatter\n")

statistics = ["r_srcAddr", "r_dstAddr", "r_startTime", "r_endTime", "r_totalSize", "r_srcPort", "r_dstPort", "r_duration"]

registerValues = dict.fromkeys(statistics)


with open(filename, 'r') as file:
    for line in file:
        currentline = line.split(",")
        registerName = currentline[0]
        index = currentline[1]
        value = currentline[2]

        if(registerName == "r_srcAddr"):
            registerValues["r_srcAddr"] = ipaddress.ip_address(int(value))
        if(registerName == "r_dstAddr"):
            registerValues["r_dstAddr"] = ipaddress.ip_address(int(value))
        if(registerName == "r_startTime"):
            registerValues["r_startTime"] = int(value) / 1000000
        if(registerName == "r_endTime"):
            registerValues["r_endTime"] = int(value) / 1000000
        if(registerName == "r_totalSize"):
            registerValues["r_totalSize"] = value
        if(registerName == "r_srcPort"):
            registerValues["r_srcPort"] = value
        if(registerName == "r_dstPort"):
            registerValues["r_dstPort"] = value
        if(registerName == "r_duration"):
            duration = int(registerValues["r_endTime"]) - int(registerValues["r_startTime"])
            registerValues["r_duration"] = int(duration)

rate = int(registerValues["r_totalSize"]) / int(registerValues["r_duration"])

print("Statistics Summary for FlowID: "+str(index)+"\n")

print("Source Address: "+str(registerValues["r_srcAddr"]))
print("Destination Address: "+str(registerValues["r_dstAddr"]))
print("Start Time: "+str(registerValues["r_startTime"]) + " seconds")
print("End Time: "+str(registerValues["r_endTime"]) + " seconds")
print("Total Size in Bytes: "+str(registerValues["r_totalSize"]).strip())
print("Source Port: "+str(registerValues["r_srcPort"]).strip())
print("Destination Port: "+str(registerValues["r_dstPort"]).strip())
print("Duration of Flow: "+str(registerValues["r_duration"]).strip()+ " seconds")
print("\nRate: "+str(rate)+" bytes/second")
