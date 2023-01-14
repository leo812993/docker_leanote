FROM centos:7
USER root
VOLUME ["/home/leo/docker_leanote/gopackage", "/home/root/gopackage"]
VOLUME ["/home/leo/docker_leanote/data/data","/home/root/data"]
COPY go1.7.6.linux-amd64.tar.gz /home/root/
RUN cd /home/root && tar -zxvf /home/root/go1.7.6.linux-amd64.tar.gz
RUN rm  /home/root/go1.7.6.linux-amd64.tar.gz
RUN chmod -R 777 /home/root/go
RUN source /root/.bashrc
COPY mongodb-linux-x86_64-rhel70-4.2.23.tgz /home/root/
RUN cd /home/root && tar -zxvf  /home/root/mongodb-linux-x86_64-rhel70-4.2.23.tgz
RUN rm /home/root/mongodb-linux-x86_64-rhel70-4.2.23.tgz
RUN echo "export GOROOT=/home/root/go" >> /root/.bashrc
RUN echo "export GOPATH=/home/root/gopackage" >> /root/.bashrc
RUN /bin/bash -c 'source /root/.bashrc; echo export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:/home/root/mongodb-linux-x86_64-rhel70-4.2.23/bin >> /root/.bashrc'
RUN source /root/.bashrc
COPY ./start.sh /
COPY ./create_db_user.js /
RUN chmod +x /start.sh
ENV TIME_ZONE Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime
#Set port
EXPOSE 9000
#ENTRYPOINT ["sh","/start.sh"]
CMD ["/bin/sh","/start.sh"]
