#!/bin/bash

#################################
# Installs github cli tool
# Arguments:
# None
# Author: github.com/sosaeio
# Date: Oct 28, 2023
#################################

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color
CM=$(perl -e 'print "\xE2\x9C\x94"') #checkmark
CURRDIR=$PWD

# OS Specific Information
OSTYPE=$(uname -s)
GOFILE="go1.21.3.darwin-arm64.pkg"

# Check if the gh tool has been installed
check_gh=$({ which gh | grep -o gh > /dev/null && echo 1 || echo 0; })

#Check if go is installed
check_go=$(go version | grep "go version" -o > /dev/null && echo 1 || echo 0)

function install_go(){
    if [ $check_go -eq 1 ]; then
       echo -e "${GREEN} $CM go dependency fulfilled ${NC}"
    else
	echo -e "${YELLOW} go dependency unfufilled, installing go ... ${NC}"
	curl -OJL https://go.dev/dl/$GOFILE && sudo installer -pkg $GOFILE -target /usr/local/ && rm $GOFILE
    fi
}


if [ $check_gh -eq 1 ]; then
    echo -e "${GREEN} $CM Github cli tool already installed in $(whereis gh | awk '{ print $2 }') ... ${NC}"
else 
    echo -e "${YELLOW} Installing Github cli tool ... ${NC}"
    if [ "$OSTYPE" == Darwin ]; then
	install_go
	cd $HOME/opt
	git clone https://github.com/cli/cli.git ; cd cli ; make ; export PATH=$PATH:$HOME/opt/cli/bin
	cd $CURRDIR
	echo -e "${GREEN} $CM Installation Completed ${NC}" 
     elif [ "$OSTYPE" == Linux ]; then
	sudo apt install gh
	echo -e "${GREEN} $CM Installation Completed ${NC}" 
    fi
fi
