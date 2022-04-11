#!bin/bash
if [ -f index.cmd ]
then
    rm index.cmd
fi
if [ -z $1 ]
then
    echo -e "Enter register index:\n"
    read index
fi
echo "register_read r_srcAddr $index" >> index.cmd
echo "register_read r_dstAddr $index" >> index.cmd
echo "register_read r_startTime $index" >> index.cmd
echo "register_read r_endTime $index" >> index.cmd
echo "register_read r_totalSize $index" >> index.cmd
echo "register_read r_srcPort $index" >> index.cmd
echo "register_read r_dstPort $index" >> index.cmd
echo "register_read r_duration $index" >> index.cmd
if [ -f register_value ]
then
  rm register_value
fi
simple_switch_CLI < index.cmd
sleep 1
python register_formatter.py

