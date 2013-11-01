#!/bin/sh

echo Installing Environment

if [ ! -f ~/.screenrc ]; then
  echo Symlinking .screenrc
  ln -s ${PWD}/screenrc ~/.screenrc
fi

if [ ! -f ~/.gitconfig ]; then
  echo Symlinking .gitconfig
  ln -s ${PWD}/gitconfig ~/.gitconfig
fi

if [ ! -f ~/.gituser ]; then
  echo No .gituser found.  Configure with:
  read -p "name: " name
  read -p "email: " email
  echo "[user]" > ~/.gituser
  echo "\tname = $name" >> ~/.gituser
  echo "\temail = $email" >> ~/.gituser
fi

if [ ! -f ~/.gitignore_global ]; then
  echo Symlinking .gitignore_global
  ln -s ${PWD}/gitignore_global ~/.gitignore_global
fi

echo Done!
