# ----------------------------------------------------------------------------
#
# Package       : registry-url
# Version       : 5.1.0
# Source repo   : https://github.com/sindresorhus/registry-url.git
# Tested on     : rhel 7.6
# Script License: Apache License, Version 2 or later
# Maintainer    : Dipika Joshi <dipika.joshi@ibm.com>
#
# Disclaimer: This script has been tested in non-root mode on given
# ==========  platform using the mentioned version of the package.
#             It may not work as expected with newer versions of the
#             package and/or distribution. In such case, please
#             contact "Maintainer" of this script.
#
# ----------------------------------------------------------------------------
#!/bin/bash

export REGISTRYURL_VERSION="v5.1.0"

yum update -y
yum install -y git curl

# NPM insatllation
curl https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
nvm install v8.9.4
ln -s $HOME/.nvm/versions/node/v8.9.4/bin/node /usr/bin/node
ln -s $HOME/.nvm/versions/node/v8.9.4/bin/npm /usr/bin/npm

git clone https://github.com/sindresorhus/registry-url.git
cd registry-url
git checkout ${REGISTRYURL_VERSION}

npm install
npm test