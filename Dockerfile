FROM jenkins/inbound-agent:latest

# Switch to root
USER root

# Install Ansible
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" > /etc/apt/sources.list.d/ansible.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
RUN apt update
RUN apt install ansible -y

# Install AWS Cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install -i /usr/local/aws-cli -b /usr/local/bin

#Install Gradle

RUN wget  "https://services.gradle.org/distributions/gradle-4.10.2-bin.zip"
RUN unzip gradle-4.10.2-bin.zip
RUN ln -s ./gradle-4.10.2-bin/gradle /usr/local/bin/gradle

# Switch back to the jenkins user.

USER jenkins

