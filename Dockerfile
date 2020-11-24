FROM centos:7
USER root
RUN mkdir -p /home/root/gopackage
ADD go1.7.6.linux-amd64.tar.gz /home/root/
RUN  cd  /home/root
RUN tar -zxvf go1.7.6.linux-amd64.tar.gz

echo "export GOROOT=/home/root/go" >> /etc/profile
echo "export GOPATH=/home/root/gopackage" >> /etc/profile
echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> /etc/profile
source /etc/profile

CMD ["/bin/bash"]