FROM ubuntu:18.04

ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt update -y
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y lsb-core
RUN apt-get install -y wget
RUN apt-get install -y chrpath
RUN apt-get install -y texinfo
RUN apt-get install -y python
RUN apt-get install -y vim
RUN apt-get install -y diffstat
RUN apt-get install -y gawk
RUN apt-get install -y git
RUN apt-get install -y repo
RUN apt-get install -y curl

RUN apt-get install -y gcc-multilib
RUN apt-get install -y iputils-ping
RUN apt-get install -y libegl1-mesa
RUN apt-get install -y libgmp-dev
RUN apt-get install -y libmpc-dev
RUN apt-get install -y libsdl1.2-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y pylint3
RUN apt-get install -y python3-git
RUN apt-get install -y python3-jinja2
RUN apt-get install -y python3-pexpect
RUN apt-get install -y python3-pip
RUN apt-get install -y socat
RUN apt-get install -y unzip
RUN apt-get install -y xterm


RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure --frontend=noninteractive locales && update-locale LANG=en_US.UTF-8
RUN echo 'export LC_ALL=en_US.UTF-8' >> /etc/environment


RUN useradd -ms /bin/bash $USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME

RUN echo 'export LC_ALL=en_US.UTF-8' >> /home/$USERNAME/.bashrc


RUN git config --global user.email "choudhariashish@gmail.com"
RUN git config --global user.name "ashish"

RUN mkdir -p ~/.bin
RUN echo 'export LC_ALL=en_US.UTF-8' >> ~/.bashrc
RUN echo 'PATH="/home/dev/.bin:${PATH}"' >> ~/.bashrc
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
RUN chmod a+rx ~/.bin/repo
