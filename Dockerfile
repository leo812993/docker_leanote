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
COPY mongodb-linux-x86_64-3.0.1.tgz /home/root/
RUN cd /home/root && tar -zxvf  /home/root/mongodb-linux-x86_64-3.0.1.tgz
RUN rm /home/root/mongodb-linux-x86_64-3.0.1.tgz
RUN echo "export PATH=$PATH:/home/root/mongodb-linux-x86_64-3.0.1/bin" >> /root/.bashrc
RUN source /root/.bashrc
RUN mkdir /home/root/data
COPY ./start.sh /
RUN chmod +x /start.sh
#ENTRYPOINT ["sh","/start.sh"]
CMD ["/bin/sh","/start.sh"]



