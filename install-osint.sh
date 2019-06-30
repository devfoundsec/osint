#!/usr/bin/bash

# colors
orange='\e[93m'
yellow='\e[93m'
green='\e[92m'
red='\e[91m'
end='\e[0m'
bgred='\e[41m'
# Status
correct="[\e[1m\e[92;1m ✔ $end]"
incorrect="[\e[1m\e[91;1m ✘ $end]"
# Arts
banner="$(cat ./ascii-art)"

echo "$banner" | while read line
  do
    printf "$red$line$end\r"
    sleep 0.01
    echo -e "\e[38;5;202;1m$line$end"
  done

_install_pip(){
  pip_version="$(ls -v /usr/local/bin/pip* | tail -n1 || printf 'pip')"
  run="$pip_version install $1 --user"
  echo -e "Run: $orange$run$end"
  eval "$run" && echo -e "$correct Installed(s): $1" || echo -e "$incorrect Error in install of: $1" 
} 
_install_git(){
  run="git clone $1"
  echo -e "Run: $orange$run$end"
  eval "$run" && echo -e "$correct Installed(s): $1" || echo -e "$incorrect Error in install of: $1" 
}

_install_git 'https://github.com/graniet/operative-framework.git'
_install_pip 'pagodo osrframework'
