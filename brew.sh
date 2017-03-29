#!/usr/bin/env bash

# Exit when any of these fail
set -e
set -o pipefail

# Install Homebrew
if ! hash brew  > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# JavaScript dev tools
brew install node
brew install nvm
brew install casperjs
brew install yarn

# Python dev tools
brew install python
brew install python3

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
brew install awscli
brew install ffmpeg
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install jq
brew install mysql
brew install p7zip
brew install postgresql
brew install rename
brew install ruby
brew install rbenv
brew install socat
brew install speedtest_cli
brew install homebrew/php/sqlformat
brew install sqlite
brew install tree
brew install wifi-password
brew install zopfli

# Install Homebrew Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/cask
brew tap caskroom/fonts

# Casks
brew cask install 1password
brew cask install caffeine
brew cask install firefox
brew cask install font-source-code-pro # Adobe monospace fonts
brew cask install hyper
brew cask install iterm2
brew cask install java
brew cask install licecap # gif screen capture
brew cask install macdown # markdown editor
brew cask install namebench # find fastest DNS server
brew cask install ngrok # http tunneling
brew cask install sketch # UI design
brew cask install sketch-toolbox
brew cask install skype
brew cask install slack
brew cask install sonos
brew cask install sourcetree
brew cask install sublime-text
brew cask install vagrant
brew cask install vagrant-manager
brew cask install virtualbox

# Mac App Store
brew install mas

mas install 1020812363 # CopyClip
mas install 668208984 # GIPHY Capture

# Remove outdated versions from the cellar.
brew cleanup
brew prune
brew doctor
brew cask doctor
