#!/usr/bin/env bash

# to override PREFIX first run: export PREFIX=~/some-directory
# and then this script
if [ -z "${PREFIX}" ]; then
  PREFIX="/usr/local"
fi

echo "Prefix at ${PREFIX}"


# http://stackoverflow.com/questions/1989439/bash-function-to-prompt-for-and-return-input
promptValue() {
 read -p "$1"": " val
 echo $val
}

if [ -z "$pid" ]; then
  pid=$(promptValue "Enter some number")
fi

if [ -z "$pid" ]; then 
  echo "ERROR: No pid set!"
fi


# http://stackoverflow.com/questions/2730766/bash-how-to-invoke-command-and-store-the-result-in-a-variable
location=$(defaults read com.apple.screencapture location;)
echo $location