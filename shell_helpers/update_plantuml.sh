#!/bin/sh
# https://linuxconfig.org/download-file-from-url-on-linux-using-command-line
# https://www.thegeekstuff.com/2012/07/wget-curl/
echo Downloading new version
sudo curl --progress-bar --location https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar --output /usr/share/plantuml/plantuml.jar
# sudo wget https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar --output-document=/usr/share/plantuml/plantuml.jar
echo Hard-linking .vscode-extensions
find /home/ebeling/.vscode/extensions/ -name plantuml.jar -exec ln --backup --suffix=orig /usr/share/plantuml/plantuml.jar \{\} \;
