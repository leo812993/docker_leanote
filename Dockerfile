FROM centos:7
USER root
RUN mkdir -p /home/root/gopackage
COPY go1.7.6.linux-amd64.tar.gz /home/root/
COPY master.zip  /home/root/
RUN cd /home/root && tar -zxvf /home/root/go1.7.6.linux-amd64.tar.gz
RUN rm  /home/root/go1.7.6.linux-amd64.tar.gz
RUN echo "export GOROOT=/home/root/go" >> /root/.bashrc
RUN echo "export GOPATH=/home/root/gopackage" >> /root/.bashrc
RUN echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:/home/root/go:/home/root/gopackage:/home/root/go/bin" >> /root/.bashrc
RUN yum install -y  unzip
RUN yum install -y zip
RUN cd /home/root && unzip master.zip 
RUN rm  /home/root/master.zip
RUN cp -r /home/root/leanote-all-master/src /home/root/gopackage
RUN rm -rf /home/root/leanote-all-master
RUN chmod -R 777 /home/root/go
RUN source /root/.bashrc
RUN source /root/.bashrc && go install github.com/revel/cmd/revel
COPY ./start.sh /
RUN chmod +x /start.sh
#ENTRYPOINT ["/start.sh"]
CMD ["/bin/bash", "/start.sh"]



