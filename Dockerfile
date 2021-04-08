FROM tensorflow/tensorflow:2.4.0-gpu

RUN apt-get update
RUN mkdir /var/run/sshd
RUN apt-get install -y openssh-server vim

RUN echo 'root:root' |chpasswd
RUN sed -ri 's/^.*PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/.*UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config


EXPOSE 22

ENTRYPOINT service ssh restart && bash