#!/bin/bash

# The uploaded user files are always in /submission/user
# and named identically to config.yaml regardless of the uploaded file names.

# The mount directory from config.yaml is in /exercise.
# Append the required support files to test user solution.

# "capture" etc description in https://github.com/apluslms/grading-base
#export ANDROID_HOME=~/Android/Sdk
#export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools
#export LD_LIBRARY_PATH=$ANDROID_HOME/emulator/lib64
#cp $STUDENT/application.apk /home/codegrade/application.apk
#cd

#ls $ANDROID_HOME/platform-tools/
$ANDROID_HOME/platform-tools/adb start-server
#$ANDROID_HOME/platform-tools/adb devices

#xvfb-run emulator64-x86 -avd nexus -netdelay none -netspeed full &
#xvfb-run emulator64-x86 -avd Nexus_10 -netdelay none -netspeed full &

#$ANDROID_HOME/tools/bin/avdmanager list

#$ANDROID_HOME/platform-tools/bin/emulator -list-avds

echo 'tools'
ls $ANDROID_HOME/tools/bin/
./$ANDROID_HOME/tools/bin/emulator -avd Nexus_10 -netdelay none -netspeed full &

server_pid=$!
output=''
while [[ ${output:0:7} != 'stopped' ]]; do
  output=`$ANDROID_HOME/platform-tools/adb shell getprop init.svc.bootanim`
  sleep 1
done


./node_modules/.bin/wdio 
kill $server_pid
wait $server_pid 2>/dev/null
