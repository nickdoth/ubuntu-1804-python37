FROM ubuntu:18.04
MAINTAINER Alexa Orrico <alexa.orrico@holbertonschool.com>

RUN apt-get update
RUN apt-get -y upgrade
# curl/wget/git
RUN apt-get install -y curl wget git tar
# vim/emacs
RUN apt-get install -y vim emacs
# C
RUN apt-get install -y build-essential gcc

# Python
RUN apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev
RUN cd /usr/src ; wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz ; tar -xf Python-3.7.3.tar.xz ; cd Python-3.7.3 ; ./configure ; make altinstall

# be sure it's 3.7 and not 3.6
RUN ! ls /usr/local/bin/python3.7 && ls /usr/src/Python-3.7.3/python && cp /usr/src/Python-3.7.3/python /usr/local/bin/python3.7 ; exit 0

# replace python version to have 3.7.3 as default
RUN rm -f /usr/bin/python
RUN rm -f /usr/bin/python3
RUN ln -s /usr/local/bin/python3.7 /usr/bin/python
RUN ln -s /usr/local/bin/python3.7 /usr/bin/python3
RUN ln -s /usr/local/bin/python3.7 /usr/local/bin/python
RUN ln -s /usr/local/bin/python3.7 /usr/local/bin/python3

# create links to pip3.7
RUN ln -s /usr/local/bin/pip3.7 /usr/bin/pip
RUN ln -s /usr/local/bin/pip3.7 /usr/bin/pip3
RUN ln -s /usr/local/bin/pip3.7 /usr/local/bin/pip
RUN ln -s /usr/local/bin/pip3.7 /usr/local/bin/pip3

# Set the locale
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
