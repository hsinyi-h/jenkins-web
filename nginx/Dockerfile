FROM nginx

RUN apt update && apt install mariadb-client openssh-server unzip curl python3 -y

RUN useradd -m -s /bin/bash remote_user && \
    echo "remote_user:password" | chpasswd && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY new-key.pub /home/remote_user/.ssh/authorized_keys

RUN chmod 600 /home/remote_user/.ssh/authorized_keys && \
    chown remote_user:remote_user -R /home/remote_user/.ssh

RUN service ssh start


RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && ./aws/install

RUN service nginx start

CMD [ "/usr/sbin/sshd", "-D" ]
