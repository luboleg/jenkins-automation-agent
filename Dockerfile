FROM jenkins/inbound-agent:latest

ARG packer_version=1.5.6

# Switch to root
USER root

# Install Ansible
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" > /etc/apt/sources.list.d/ansible.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
RUN apt update
RUN apt install ansible -y

# Install Packer
RUN wget https://releases.hashicorp.com/packer/${packer_version}/packer_${packer_version}_linux_amd64.zip
RUN unzip packer_${packer_version}_linux_amd64.zip -d /usr/local/bin/

# Switch back to the jenkins user.

USER jenkins

