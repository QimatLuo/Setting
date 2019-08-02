/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# general
brew install \
  bash-completion \
  git \
  gpg \
  grep \
  node@10 \
  tmux \
  vim
brew cask install \
  docker \
  google-chrome \
  keybase

# android
brew tap caskroom/versions
brew cask install \
  adoptopenjdk8 \
  android-sdk \
  vysor
brew install \
  gradle
