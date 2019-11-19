FROM centos:7

LABEL maintainer="metheney.josh@solute.us"
LABEL app="jenkins-docker"

VOLUME /app
ENTRYPOINT /bin/build.sh

RUN yum -y install java-11-openjdk

ADD build.sh /bin/build.sh