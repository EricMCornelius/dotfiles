#!/bin/bash

apt-get install aptitude wget curl zsh htop git

# elasticsearch
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb http://packages.elastic.co/elasticsearch/1.7/debian stable main" > /etc/apt/sources.list.d/elasticsearch-1.7.list

# clang 3.6
wget -qO - http://llvm.org/apt/llvm-snapshot.gpg.key | apt-key add -
echo "deb http://llvm.org/apt/precise/ llvm-toolchain-precise-3.6 main" > /etc/apt/sources.list.d/clang-3.6.list
echo "deb-src http://llvm.org/apt/precise/ llvm-toolchain-precise-3.6 main" >> /etc/apt/sources.list.d/clang-3.6.list

# g++ 4.9
add-apt-repository ppa:ubuntu-toolchain-r/test
add-apt-repository ppa:webupd8team/java

# nginx
add-apt-repository ppa:nginx/stable

apt-get update

apt-get install gcc-4.9 clang-3.6 nginx

apt-get install oracle-java8-installer elasticsearch

# nvm + node + user config
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash
wget https://raw.githubusercontent.com/EricMCornelius/dotfiles/master/.zshrc -O ~/.zshrc
wget https://raw.githubusercontent.com/EricMCornelius/dotfiles/master/.gitconfig -O ~/.gitconfig

apt-get install lvm2

source ~/.nvm/nvm.sh
nvm install iojs
nvm alias default iojs

ufw allow ssh
ufw allow https
ufw default deny incoming
ufw default allow outgoing
ufw enable

chsh -s /usr/bin/zsh `echo $USER`
