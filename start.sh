#!/bin/bash
source /root/.bashrc
mongod --dbpath /home/root/data &
tail -f /start.sh
