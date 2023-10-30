####################################
# Installs github cli tool for Linux
# Author: github.com/sosaeio
# Date: Oct 28, 2023
####################################

if [ $(which gh | grep -o gh > /dev/null && echo 1 || echo 0) -eq 1 ]; then
        echo -e '\033[0;32m' $(perl -e 'print "\xE2\x9C\x94"') Github cli tool already installed in $(whereis gh | awk '{ print $2 }') ... '\033[0m'
else
        echo -e '\033[0;33m' Installing Github cli tool ... '\033[0m'
	sudo apt install gh
        echo -e '\033[0;32m' $(perl -e 'print "\xE2\x9C\x94"') Installation Completed '\033[0m'
fi
