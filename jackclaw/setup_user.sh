#!/bin/bash

DATA=/opt/hib/jackclaw
DEST=$HOME/.frozenbyte/claw

clear
read -p "Create Jack Claw config for '$(whoami)'? (yes/no): "

if [ "$REPLY" = "yes" ]; then
  mkdir -p $DEST
  cd $DEST
  if [ -n "$(ls $DEST)" ]; then
    clear
    echo "It seems you've already some stuff inside $DEST"
    echo "Do you want to: (a) remove them, then copy new ones,"
    echo "                (b) leave them be and exit"
    read -p "Choice: "
    [[ "$REPLY" = "b" ]] && echo -e "\nNo files were created.\n" && exit 0
  fi
  rm -rf $DEST/{config,profiles}
  cp -R $DATA/{config,profiles} $DEST/ || exit 1
  echo -e "\nFiles created under $DEST\n"
else
  echo -e "\nNo files were created.\n"
fi

exit 0
