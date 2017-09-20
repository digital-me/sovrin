FROM centos:centos7.3.1611

RUN yum install -y \
    # common stuff
        git \
        wget \
        unzip \
    # fmp
        ruby \
        ruby-dev \
        rubygems \
        gcc \
        make

# install fpm
RUN gem install --no-ri --no-rdoc fpm

WORKDIR /root

ADD . /root
