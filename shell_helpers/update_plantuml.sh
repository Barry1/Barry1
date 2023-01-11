#!/bin/sh
# https://linuxconfig.org/download-file-from-url-on-linux-using-command-line
# https://www.thegeekstuff.com/2012/07/wget-curl/
# https://daniel.haxx.se/docs/curl-vs-wget.html
timingcheck (){
    echo Running Timing Checks
    echo CURL
    time sh -c 'for _ in _ _ _ _ _ _ _ _ _ _ ; do curl --silent --location https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar > /dev/null ; done'
    echo WGET
    time sh -c 'for _ in _ _ _ _ _ _ _ _ _ _ ; do wget --quiet https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar > /dev/null ; done'
    echo Timing Check End
}
usecurl () {
    sudo curl --progress-bar --location https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar --output /usr/share/plantuml/plantuml.jar
}
usewget () {
    sudo wget https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar --output-document=/usr/share/plantuml/plantuml.jar
}
#timingcheck
echo Downloading new version
usewget
echo Hard-linking .vscode-extensions
find /home/ebeling/.vscode/extensions/ -name plantuml.jar -exec ln --backup --suffix=orig /usr/share/plantuml/plantuml.jar \{\} \;
