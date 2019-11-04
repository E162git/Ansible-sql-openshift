FROM ansible/centos7-ansible:stable
MAINTAINER devops satish.example@123.com

WORKDIR /home/centos

ADD ./hosts /etc/ansible/hosts
ADD ./ansible.cfg /etc/ansible/ansible.cfg
ADD ./mysql.yml /home/centos/mysql.yml

RUN yum install sshpass -y

RUN  echo "passwordAuthentication yes"  >> /etc/ssh/sshd_config
RUN  echo "PermitRootlogin yes"  >> /etc/ssh/sshd_config


RUN ansible-playbook /home/centos/mysql.yml

ENTRYPOINT service mysql start && /bin/bash
