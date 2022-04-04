if [ -f register_value ]
then
  rm register_value
fi
simple_switch_CLI < index.cmd
sleep 2
python register_formatter.py

