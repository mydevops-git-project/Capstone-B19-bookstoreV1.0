FROM ubuntu
MAINTAINER saiteja
WORKDIR /opt/java
ADD openjdk-11.0.2_linux-x64_bin.tar.gz .
ENV JAVA_HOME /opt/java/jdk-11.0.2
ENV PATH $PATH:$JAVA_HOME/bin
WORKDIR /opt/tomcat
ADD apache-tomcat-8.5.49.tar.gz .
COPY ILP-0.0.1-20200429.122008-1.war  /opt/tomcat/apache-tomcat-8.5.49/webapps
EXPOSE 8080
CMD ["/opt/tomcat/apache-tomcat-8.5.49/bin/catalina.sh","run"]
