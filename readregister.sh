if [ -f register_value ]
then
  rm register_value
fi
simple_switch_CLI < register_read.cmd
sleep 2
python register_formatter.py

