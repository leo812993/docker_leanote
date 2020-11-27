#!/bin/bash
source /root/.bashrc

touch /home/root/gopackage/install.txt
go install github.com/revel/cmd/revel
mongod --dbpath /home/root/data &
tail -f /start.sh
