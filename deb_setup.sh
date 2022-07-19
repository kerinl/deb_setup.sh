#              ________________________________________________
#             /                                                \
#            |    _________________________________________     |
#            |   |                                         |    |
#            |   |  C:\> _                                 |    |
#            |   |                                         |    |
#            |   |                                         |    |
#            |   |                                         |    |
#            |   |                                         |    |
#            |   |                                         |    |
#            |   |                                         |    |
#            |   |                                         |    |
#            |   |                                         |    |
#            |   |                                         |    |
#            |   |                                         |    |
#            |   |                                         |    |
#            |   |_________________________________________|    |
#            |                                                  |
#             \_________________________________________________/
#                    \___________________________________/
#                 ___________________________________________
#              _-'    .-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.  --- `-_
#           _-'.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.--.  .-.-.`-_
#        _-'.-.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-`__`. .-.-.-.`-_
#     _-'.-.-.-.-. .-----.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-----. .-.-.-.-.`-_
#  _-'.-.-.-.-.-. .---.-. .-------------------------. .-.---. .---.-.-.-.`-_
# :-------------------------------------------------------------------------:
# `---._.-------------------------------------------------------------._.---'
# This is a simple script by Luka Kerin to speed up the initial configuration and software installation of new Debian based distro installation.
# Author: Luka Kerin






############################################################ INSTALLING BRAVE BROWSER ############################################################
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser



############################################################ INSTALLING SIGNAL ############################################################

# NOTE: These instructions only work for 64 bit Debian-based
# Linux distributions such as Ubuntu, Mint etc.

# 1. Install our official public software signing key
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

# 2. Add our repository to your list of repositories
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# 3. Update your package database and install signal
sudo apt update && sudo apt install signal-desktop



############################################################ ADDING ALIASES ############################################################

echo "

### ALIASES ###
alias aptup='sudo apt update && sudo apt upgrade -y'
alias aptupd='sudo apt update'
alias aptupg='sudo apt upgrade -y'
alias ip='ip -c'" >> ~/.bashrc



############################################################ SETTING COLORSCRIPTS ############################################################

sudo apt install suckless-tools git
git clone https://gitlab.com/dwt1/shell-color-scripts.git
sudo mv shell-color-scripts /opt
sudo cp /opt/shell-color-scripts /usr/bin/colorscript
echo "
colorscript -r" >> ~/.bashrc 



############################################################ INSTALLING STARSHIP ############################################################

# bug: how to echo a string that already contains a string
# sh -c "$(curl -fsSL https://starship.rs/install.sh)"
# echo "eval "$(starship init bash)"" >> .bashrc
