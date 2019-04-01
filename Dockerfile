FROM centos:7
MAINTAINER sridhar
#ENTRYPOINT ["/opt"]
RUN yum install wget -y
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz"
RUN mv jdk-8u201-linux-x64.tar.gz /opt
RUN tar -xzf /opt/jdk-8u201-linux-x64.tar.gz -C /opt
RUN rm -rf /opt/jdk-8u201-linux-x64.tar.gz
RUN echo "export JAVA_HOME=/opt/jdk1.8.0_201" >> /root/.bash_profile
RUN echo "export PATH=$PATH:/opt/jdk1.8.0_201/bin" >> /root/.bash_profile
#RUN /bin/sh -c "source /root/.bash_profile"
RUN sudo . /root/.bash_profile
