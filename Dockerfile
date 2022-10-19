FROM jenkins/jenkins:lts

USER 0
RUN echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' >> /etc/apt/sources.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 93C4A3FD7BB9C367 && \
    apt-get update && \
    apt-get -y install \
       ansible \
       jq \
       ssh \
       && \
     rm -rf /var/lib/apt/lists/*

COPY plugins.txt /usr/share/jenkins/plugins.txt 

RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt

USER 1000