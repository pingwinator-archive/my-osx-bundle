#!/bin/sh

# Script directory path
DIR_SCRIPT="$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd)"

# goto home directory
cd ${HOME}

# install xcode command line tools
/usr/bin/xcode-select --install

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# get Xcode's license
/usr/bin/xcodebuild -license

# install packages from homebrew
/usr/local/bin/brew bundle ${DIR_SCRIPT}/files/Brewfile

# change use shell
/usr/bin/sudo /bin/cp -f ./files/shells /etc/shells
/usr/bin/sudo /bin/chmod 644 /etc/shells
/usr/bin/sudo /usr/sbin/chown root:wheel /etc/shells
/usr/bin/chpass -s /usr/local/bin/zsh

# zsh configuration
if [ -e ${HOME}/.zsh ]; then; rm -f ${HOME}/.zsh; fi
if [ -e ${HOME}/.zshrc ]; then; rm -f ${HOME}/.zshrc; fi
/bin/ln -sf ${DIR_SCRIPT}/dotfiles/zsh ${HOME}/.zsh
/bin/ln -sf ${DIR_SCRIPT}/dotfiles/zshrc ${HOME}/.zshrc
if [ ! -e ${HOME}/.zsh/brew_token ]; then
    /usr/bin/openssl enc -d -aes-256-cbc -in ${DIR_SCRIPT}/security/brew_token.pac -out ${HOME}/.zsh/brew_token
    # encrypt command 'openssl enc -e -aes-256-cbc -in brew_token -out brew_token.pac'
fi

# vim configuration
if [ -e ${HOME}/.vim ]; then; rm -f ${HOME}/.vim; fi
if [ -e ${HOME}/.vimrc ]; then; rm -f ${HOME}/.vimrc; fi
/bin/ln -sf ${DIR_SCRIPT}/dotfiles/vim ${HOME}/.vim
/bin/ln -sf ${DIR_SCRIPT}/dotfiles/vimrc ${HOME}/.vimrc

# nvm install
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
exec $SHELL -l
NVM_VERSION=`nvm ls-remote | sed "s/^.*\(v[0-9]*\.[0-9]*\.[0-9]*\).*$/\1/" | tail -1`
nvm install ${NVM_VERSION}
nvm use ${NVM_VERSION}
nvm alias default ${NVM_VERSION}

# npm install
curl http://npmjs.org/install.sh | sh

