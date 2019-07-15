#!/usr/bin/bash

# Fix problems of directories
here=`dirname "$0"`
cd "$here"
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

_install_pip(){
  pip_version="$(ls -v /usr/local/bin/pip* | tail -n1 || printf 'pip')"
  run="$pip_version install $1 --user"
  echo -e "Run: $orange$run$end"
  eval "$run" && echo -e "$correct Installed(s): $1" || echo -e "$incorrect Error in install of: $1" 
} 
_install_git(){
  cd "/workspace"
  run="git clone $1"
  echo -e "Run: $orange$run$end"
  eval "$run" && echo -e "$correct Installed(s): $1" || echo -e "$incorrect Error in install of: $1" 
  cd "$here"
}
_run(){
  echo -e "Run: $orange$1$end"
  eval "$1" && echo -e "$correct $1" || echo -e "$incorrect $1" 
}

# Operative-framework
_run 'go get github.com/graniet/operative-framework'
# Install D4N155
_install_git 'https://github.com/OWASP/D4N155.git'
_install_pip '-r /workspace/D4N155/requirements.txt'
# Install Sherlock
_install_git 'https://github.com/sherlock-project/sherlock.git'
_install_pip '-r /workspace/sherlock/requirements.txt'
# Install PhoneInfoga
_install_git 'https://github.com/sundowndev/PhoneInfoga'
_install_pip '-r /workspace/PhoneInfoga/requirements.txt'
_run 'mv /workspace/PhoneInfoga/config.example.py /workspace/PhoneInfoga/config.py'
# Install Karma
_install_pip 'git+https://github.com/decoxviii/karma.git'
# Install SE Toolkit 
_install_git 'https://github.com/trustedsec/social-engineer-toolkit.git'
_install_pip '-r /workspace/social-engineer-toolkit/requirements.txt'
# Install Recon-ng
_install_git 'https://bitbucket.org/LaNMaSteR53/recon-ng.git'
_install_pip '-r /workspace/recon-ng/REQUIREMENTS'
# Install SE Toolkit 
_install_git 'https://github.com/trustedsec/social-engineer-toolkit.git'
_install_pip '-r /set/requirements.txt'
# Install OpenVas
_install_git 'https://github.com/greenbone/openvas.git'
# Install The Harvester
_install_git 'https://github.com/laramies/theHarvester.git'
_install_git '-r /workspace/theHarvester/requirements.txt' 
# Install Whois
_run 'apt install whois -y'

# Install osrframework
_run "$(ls -v /usr/local/bin/pip2* | head -n1 || printf 'pip') install osrframework --user"

cat ascii-art.sh >> ~/.bashrc

