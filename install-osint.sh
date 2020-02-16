#!/usr/bin/bash

# Fix problems of directories
here="`dirname "$0"`"
cd "$here"
# colors
orange='\e[93m'
yellow='\e[93m'
green='\e[92m'
red='\e[91m'
end='\e[0m'
bgred='\e[41m'
bold='\e[1m'
bwhite='\e[1;97m'
# Status
correct="[\e[1m\e[92;1m ✔ $end]"
incorrect="[\e[1m\e[91;1m ✘ $end]"

_install_pip(){
  run="$1 install $2 --user"
  echo -e "Run: $orange$run$end"
  eval "$run" && echo -e "$correct Installed(s): $2" || echo -e "$incorrect Error in install of: $2" 
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


_install_pip 'pip3' 'cython'
# Operative-framework
_run 'go get github.com/graniet/operative-framework'
# Install D4N155
_install_git 'https://github.com/OWASP/D4N155.git'
_install_pip 'pip3' '-r /workspace/D4N155/requirements.txt'
# Install Sherlock
_install_git 'https://github.com/sherlock-project/sherlock.git'
_install_pip 'pip3' '-r /workspace/sherlock/requirements.txt'
# Install PhoneInfoga
_install_git 'https://github.com/sundowndev/PhoneInfoga'
_install_pip 'pip3' '-r /workspace/PhoneInfoga/requirements.txt'
_run 'mv /workspace/PhoneInfoga/config.example.py /workspace/PhoneInfoga/config.py'
# Install Karma'
_install_pip 'pip3' 'git+https://github.com/decoxviii/karma.git --upgrade'
# Install SE Toolkit 
_install_git 'https://github.com/trustedsec/social-engineer-toolkit.git'
_install_pip 'pip3' '-r /workspace/social-engineer-toolkit/requirements.txt'
# Install Recon-ng
_install_git 'https://github.com/lanmaster53/recon-ng.git'
_install_pip 'pip3' '-r /workspace/recon-ng/REQUIREMENTS'
# Install OpenVas
_install_git 'https://github.com/greenbone/openvas.git'
# Install The Harvester
_install_git 'https://github.com/laramies/theHarvester.git'
_install_pip 'pip3' '-r /workspace/theHarvester/requirements/base.txt'
# Install Cr3dOv3r
_install_git 'https://github.com/D4Vinci/Cr3dOv3r.git'
_install_pip 'pip3' '-r /workspace/Cr3dOv3r/requirements.txt'
# Install DNSRecon
_install_git 'https://github.com/darkoperator/dnsrecon.git'
_install_pip 'pip2' '-r /workspace/dnsrecon/requirements.txt'
# Install Buster
_install_git 'https://github.com/sham00n/buster.git'
_install_pip 'pip3' 'numpy'
_run "cd /workspace/buster;python3 setup.py install;cd $here"
# Install Whois
_run 'apk add whois nmap'
# Install osrframework
_install_pip 'pip3' 'osrframework'
_run 'wget https://raw.githubusercontent.com/i3visio/osrframework/master/config/general.cfg -O ~/.config/OSRFramework/default/general.cfg'
_run 'wget https://github.com/i3visio/osrframework/blob/master/config/browser.cfg -O /root/.config/OSRFramework/default/browser.cfg'
# Install InstagramOsint
_install_git 'https://github.com/sc1341/InstagramOSINT.git'
_install_pip 'pip3' '-r /workspace/InstagramOSINT/requirements.txt'
# Install Datasploit
_install_git 'https://github.com/dvopsway/datasploit.git'
_install_pip 'pip2' '--force-reinstall -r /workspace/datasploit/requirements.txt'
# Install Cloudfail
_install_git 'https://github.com/m0rtem/CloudFail.git'
_install_pip 'pip3' '-r /workspace/CloudFail/requirements.txt'
# Install WAFW00f
_install_git 'https://github.com/EnableSecurity/wafw00f.git'
_run "cd /workspace/wafw00f;python3 setup.py install;cd $here"

# Install editor
_run 'apk add vim'

# Banner
banner="

\t\t ~$bwhite TOOLS $end~
\t$bwhite Operative-framework$end: operative framework is a OSINT investigation framework
\t$bwhite D4N155$end: Intelligent and dynamic wordlist using OSINT
\t$bwhite Sherlock$end: Find usernames across social networks
\t$bwhite PhoneInfoga$end: Advanced information gathering & OSINT tool for phone numbers
\t$bwhite Karma$end: Find leaked emails with your passwords
\t$bwhite Recon-ng$end: Recon-ng is a full-featured Web Reconnaissance framework written in Python
\t$bwhite SE Toolkit$end: The Social-Engineer Toolkit
\t$bwhite OpenVas$end: Open Vulnerability Assessment Scanner 
\t$bwhite The Harvester$end: E-mails, subdomains and names Harvester - OSINT
\t$bwhite Whois$end: Get whois data
\t$bwhite osrframework$end: Open Sources Research Framework
\t$bwhite R3dOv3r$end: Know the dangers of credential reuse attacks
\t$bwhite Buster$end: Find emails of a person and return info associated with them
\t$bwhite InstagramOsint$end: An Instagram Open Source Intelligence Tool 
\t$bwhite Datasploit$end: A tool to perform various OSINT techniques
\t$bwhite Cloudfail$end: Utilize misconfigured DNS and old database records to find hidden IP\'s behind the CloudFlare network

"


# bashrc
_run 'wget https://raw.githubusercontent.com/Scorpion-Cyber-Security/vault-bash/master/.bashrc -O .bashrc'
cat .bashrc >> ~/.bashrc
echo -e "printf \"\"\"$banner\"\"\"" >> ~/.bashrc
