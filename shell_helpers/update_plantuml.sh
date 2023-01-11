#!/bin/sh
# https://linuxconfig.org/download-file-from-url-on-linux-using-command-line
#sudo curl https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar -o /usr/share/plantuml/plantuml.jar
sudo wget https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar --output-document=/usr/share/plantuml/plantuml.jar
find /home/ebeling/.vscode/extensions/ -name plantuml.jar -exec ln --backup --suffix=orig /usr/share/plantuml/plantuml.jar \{\} \;
