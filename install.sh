#!/bin/sh

# Script directory path
DIR_SCRIPT="$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd)"

# goto home directory
cd ${HOME}

# install xcode command line tools
/usr/bin/xcode-select --install
echo "Installed xcode command line tools ?> "
read INPUT

# install homebrew
if [ ! -e /usr/local/bin/brew ]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

# install packages from homebrew
/usr/local/bin/brew bundle ${DIR_SCRIPT}/files/Brewfile

# change use shell
/usr/bin/sudo /bin/cp -f ${DIR_SCRIPT}/files/shells /etc/shells
/usr/bin/sudo /bin/chmod 644 /etc/shells
/usr/bin/sudo /usr/sbin/chown root:wheel /etc/shells
/usr/bin/chpass -s /usr/local/bin/zsh

# zsh configuration
if [ -e ${HOME}/.zsh ]; then
	rm -f ${HOME}/.zsh
fi
if [ -e ${HOME}/.zshrc ]; then
	rm -f ${HOME}/.zshrc
fi
/bin/ln -sf ${DIR_SCRIPT}/dotfiles/zsh ${HOME}/.zsh
/bin/ln -sf ${DIR_SCRIPT}/dotfiles/zshrc ${HOME}/.zshrc
if [ ! -e ${HOME}/.zsh/brew_token ]; then
    /usr/bin/openssl enc -d -aes-256-cbc -in ${DIR_SCRIPT}/security/brew_token.pac -out ${HOME}/.zsh/brew_token
    # encrypt command 'openssl enc -e -aes-256-cbc -in brew_token -out brew_token.pac'
fi

# vim configuration
if [ -e ${HOME}/.vim ]; then
	rm -f ${HOME}/.vim
fi
if [ -e ${HOME}/.vimrc ]; then
	rm -f ${HOME}/.vimrc
fi
/bin/ln -sf ${DIR_SCRIPT}/dotfiles/vim ${HOME}/.vim
/bin/ln -sf ${DIR_SCRIPT}/dotfiles/vimrc ${HOME}/.vimrc

# nvm install
if [ ! -e ${HOME}/.nvm/nvm.sh ]; then
	curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh
	source ${HOME}/.nvm/nvm.sh
	NVM_VERSION=`nvm ls-remote | sed "s/^.*\(v[0-9]*\.[0-9]*\.[0-9]*\).*$/\1/" | tail -1`
	nvm install ${NVM_VERSION}
	nvm use ${NVM_VERSION}
	nvm alias default ${NVM_VERSION}
fi

# npm install
curl -L http://npmjs.org/install.sh | sh

# 微調整
if [ ! -e ${HOME}/Applications/.localized ]; then
	/bin/cp -f /Applications/.localized ${HOME}/Applications/
fi

defaults write com.apple.finder AppleShowAllFiles TRUE
defaults write com.apple.desktopservices DSDontWriteNetworkStores TRUE
