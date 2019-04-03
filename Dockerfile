FROM centos:7
MAINTAINER sridhar
#ENTRYPOINT ["/opt"]
RUN yum install wget -y
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz"
RUN mv jdk-8u201-linux-x64.tar.gz /opt
RUN tar -xzf /opt/jdk-8u201-linux-x64.tar.gz -C /opt
RUN rm -rf /opt/jdk-8u201-linux-x64.tar.gz
ENV JAVA_HOME=/opt/jdk1.8.0_201 
ENV PATH=$PATH:/opt/jdk1.8.0_201/bin

RUN wget  http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.17/bin/apache-tomcat-9.0.17.tar.gz 
Run mv apache-tomcat-9.0.17.tar.gz /opt
RUN tar -xzf /opt/apache-tomcat-9.0.17.tar.gz -C /opt 
RUN rm -rf /opt/apache-tomcat-9.0.17.tar.gz
ENV CATALINA_HOME=/opt/apache-tomcat-9.0.17
ENV PATH=$PATH:/opt/apache-tomcat-9.0.17/bin 
CMD ["catalina.sh", "run"]
EXPOSE 8080
#RUN wget https://www.oracle.com/webfolder/technetwork/tutorials/obe/fmw/wls/12c/03-DeployApps/files/benefits.war
#RUN mv benefits.war /opt/apache-tomcat-9.0.17/webapps
RUN cd /opt/apache-tomcat-9.0.17/webapps && wget https://www.oracle.com/webfolder/technetwork/tutorials/obe/fmw/wls/12c/03-DeployApps/files/benefits.war
