#!/bin/bash


source functions.sh

green "Hello World"

J="yes"
O="yes"

read -p "Install Oracle Java? Press Enter to confirm. [$J]" J
read -p "Install Oracle? Press Enter to confirm.[$O]" O


if [ "$J" = "yes" ]; then
    green "Java installed"
fi

if [ "$O" = "yes" ]; then
    green "Oracle installed"
fi

yellow "done"
