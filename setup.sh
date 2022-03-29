#!bin/bash
import time

simple_switch -i 0@s1-eth0 -i 1@s1-eth1 --nanolog ipc:///tmp/bm-log.ipc basic.json &
time.sleep(3)
simple_switch_CLI < ~/lab2/rules.cmd
