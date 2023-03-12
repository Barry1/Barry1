#!/bin/sh
# Current working dir is /share/MD0_DATA/.antivirus/usr/share/clamav
ssh admin@ebelnas /usr/local/bin/freshclam --debug --verbose --user admin
