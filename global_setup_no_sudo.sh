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

#export AVD_VERSION=25
#export ANDROID_BUILD_TOOLS_VERSION=25.0.3 
#export SDK_VERSION=25.2.3
#export ANDROID_HOME=/usr/local/lib/android/sdk
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

#$ANDROID_HOME/tools/avdmanager list
echo $ANDROID_HOME
#ls $ANDROID_HOME/tools
#echo 'a'
#ls $ANDROID_HOME/tools/bin
$ANDROID_HOME/tools/bin/sdkmanager "system-images;android-25;google_apis;x86_64"
$ANDROID_HOME/tools/bin/avdmanager create avd -n kappa -k "system-images;android-25;google_apis;x86"

#echo y | ${ANDROID_HOME}/tools/android -s create avd --force --name android-$AVD_VERSION \
#  --device "Nexus S" --name "nexus" --abi "google_apis/x86" >/dev/null
#  --device "Nexus S" --name "nexus" --abi "default/x86" --skin WVGA800