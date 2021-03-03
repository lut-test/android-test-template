#!/bin/bash

#cp test*.js /home/codegrade/
#cp wdio.conf.js /home/codegrade/

#Chmod next sh file(s)
chmod u+x ./run.sh
chmod u+x ./global_setup.sh

#Appium
cd
npm init -y
npm install --silent -y \
	appium

#Webdriver.io
npm install --silent -y --save-dev \
	@wdio/cli \
	chai \
	chai-webdriverio \
	@wdio/appium-service \
	@wdio/local-runner \
	@wdio/mocha-framework
#Android sdk

export AVD_VERSION=25
#export ANDROID_BUILD_TOOLS_VERSION=25.0.3 
#export SDK_VERSION=25.2.3
#export ANDROID_HOME=~/Android/Sdk
#mkdir -p $ANDROID_HOME
#cd $ANDROID_HOME
#wget -q -O tools.zip https://dl.google.com/android/repository/tools_r${SDK_VERSION}-linux.zip > /dev/null && \
#    unzip tools.zip > /dev/null && rm tools.zip > /dev/null && \
#    chmod a+x -R $ANDROID_HOME 
#
#
#echo "updating..."
#echo y | ${ANDROID_HOME}/tools/android -s update sdk -a -u -t platform-tools,build-tools > /dev/null
#
#
#echo "updating again..."
#echo y | ${ANDROID_HOME}/tools/android -s update sdk --all --force --no-ui --filter android-$AVD_VERSION,sys-img-x86-google_apis-$AVD_VERSION > /dev/null 
#
echo "installing image..."
ls ${ANDROID_HOME}
echo y | ${ANDROID_HOME}/tools/android -s create avd --force --name android-$AVD_VERSION --target android-$AVD_VERSION \
  --device "Nexus S" --name "nexus" --abi "google_apis/x86" --skin WVGA800 >/dev/null
#  --device "Nexus S" --name "nexus" --abi "default/x86" --skin WVGA800