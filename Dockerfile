FROM centos:7
USER root
RUN mkdir -p /home/root/gopackage
COPY go1.7.6.linux-amd64.tar.gz /home/root/
RUN  cd  /home/root
RUN tar -zxvf /home/root/go1.7.6.linux-amd64.tar.gz
RUN rm  /home/root/go1.7.6.linux-amd64.tar.gz
RUN echo "export GOROOT=/home/root/go" >> /etc/profile
RUN echo "export GOPATH=/home/root/gopackage" >> /etc/profile
RUN echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> /etc/profile
RUN source /etc/profile
RUN tail -f /etc/profile


