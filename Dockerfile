FROM centos:7
USER root
RUN mkdir -p /gopackage
ADD go1.7.6.linux-amd64.tar.gz /
RUN  cd  /
RUN tar -zxvf go1.7.6.linux-amd64.tar.gz


CMD ["/bin/bash"]