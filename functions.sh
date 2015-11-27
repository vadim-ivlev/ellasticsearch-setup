#!/bin/bash

# print in color
function green(){
  tput bold
  tput setaf 2
  echo -e $1
  tput sgr0 
}

function red(){
  tput bold
  tput setaf 1
  echo -e $1
  tput sgr0 
}

function yellow(){
  tput bold
  tput setaf 3
  echo -e $1
  tput sgr0 
}


# checks exit code of last command. Lets the user decide what to do next.
function c() {
if [ "$?" -ne  "0" ]; then
  red "\n####################################################\nATTENTION please:  SOMETHING WENT WRONG HERE  !!!!! \n"
  red "   ENTER - to continue \n   Ctrl+C -to interrupt"
  read  O
fi
}


function ask_user_name(){
if [ -z "$USER_NAME" ]  
then
  green "ENTER YOUR USER NAME"
  read -e -p "Press Enter to confirm: " -i "$USER" USER_NAME
fi
}


green "functions.sh loaded"

