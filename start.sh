#!/bin/bash
source /root/.bashrc
if [ ! -f /home/root/gopackage/installed.txt ]; then 
 touch /home/root/gopackage/installed.txt
 chmod -R 777 /home/root/data
 chmod -R 777 /home/root/gopackage
 source /root/.bashrc & go install github.com/revel/cmd/revel
 sleep 10
 mongod --dbpath /home/root/data &
 sleep 10
 mongorestore -h localhost -d leanote --dir /home/root/gopackage/src/github.com/leanote/leanote/mongodb_backup/leanote_install_data/ 
 mongo leanote /create_db_user.js
 sleep 5
 ps -ef | grep "mongod" | grep -v grep | awk '{print $2}' |xargs kill -9
 mongod --bind_ip 0.0.0.0 --port 27017  --dbpath /home/root/data --auth &
 echo "restart mongod"
else
  mongod --bind_ip 0.0.0.0 --port 27017 --dbpath /home/root/data --auth &
fi
sleep 10
revel run github.com/leanote/leanote








