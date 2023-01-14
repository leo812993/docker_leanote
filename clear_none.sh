sudo docker ps -a | grep "Exited" | awk '{print $1 }'|xargs sudo docker stop
sudo docker ps -a | grep "dockerleanote_go" | awk '{print $1 }'|xargs sudo docker stop
sudo docker ps -a | grep "Exited" | awk '{print $1 }'|xargs sudo docker rm
sudo docker images|grep none|awk '{print $3 }'|xargs sudo docker rmi
sudo docker image ls |grep "dockerleanote_go" | awk '{print $3 }'|xargs sudo docker rmi

sudo rm -rf data/*
sudo rm -rf gopackage/*
cp -r  leanote-all-master/  gopackage/ 
