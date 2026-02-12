# FROM ubuntu:latest
# ENV DEBIAN_FRONTEND=noninteractive
# RUN apt-get update && apt-get install apache2 -y
# COPY index.html /var/www/html/index.html
# EXPOSE 80 
# CMD ["apache2ctl", "-D" , "FOREGROUND"]    

#--- stage 1: download and extract Tomcat ---
FROM alpine:latest as downloader
ENV TOMCAT_VERSION=9.0.107
WORKDIR /tmp
RUN apk add --no-cache curl tar && \
    curl -O https://downloads.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz

#--- stage 2: create final image ---
FROM openjdk:11
ENV CATALINA_HOME=/opt/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH
COPY --from=downloader /tmp/apache-tomcat-* $CATALINA_HOME
EXPOSE 8080
CMD ["catalina.sh", "run"]