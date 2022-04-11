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
