#!/bin/bash

###################################
# Installs github cli tool for Mac
# Author: github.com/sosaeio
# Date: Oct 28, 2023
###################################

if [ $(which gh | grep -o gh > /dev/null && echo 1 || echo 0) -eq 1 ]; then
	echo -e '\033[0;32m' $(perl -e 'print "\xE2\x9C\x94"') Github cli tool already installed in $(whereis gh | awk '{ print $2 }') ... '\033[0m'
else 
	echo -e '\033[0;33m' Installing Github cli tool ... '\033[0m'
	curl -OJL https://go.dev/dl/go1.21.3.darwin-arm64.pkg && sudo installer -pkg go1.21.3.darwin-arm64.pkg -target /usr/local/ && rm go1.21.3.darwin-arm64.pkg
	[ -d "$HOME/opt/cli" ] && rm -rf $HOME/opt/cli ; git clone https://github.com/cli/cli.git $HOME/opt/cli  && make -C $HOME/opt/cli && export PATH=$PATH:$HOME/opt/cli/bin
	echo -e '\033[0;32m' $(perl -e 'print "\xE2\x9C\x94"') Installation Completed '\033[0m' 
fi
