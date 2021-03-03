#!/bin/bash

#System dependencies
apt-get update -qq
apt-get install -qq -y \
	apt-utils \
	curl \
	xauth \
	unzip \
	software-properties-common \
	libnss3-dev \
	libgconf-2-4 \
	scrot \
	xvfb

dpkg --add-architecture i386
apt-get install -qq -y\
	expect \
	wget \
	libc6-i386 \
	lib32stdc++6 \
	lib32gcc1 \
	lib32ncurses5 \
	lib32z1 \
	python \
	curl \
	libqt5widgets5


