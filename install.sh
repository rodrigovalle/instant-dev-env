#!/bin/bash
#
# instant dev environment:
# just add water!

set -o errexit
rel_path="$(dirname "$0")"


#########
#  Vim  #
#########

# download and install vim-plug
vim_plug="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
curl --fail -L "$vim_plug" --output "$HOME/.vim/autoload/plug.vim" --create-dirs

# install vimrc and run vim-plug installer
cp "$rel_path/vimrc" "$HOME/.vimrc"
vim +PlugInstall +qall


##############
#  Terminal  #
##############

# setup bash_profile
echo 'export EDITOR=vim' >> "$HOME/.bash_profile"
echo 'alias ls="ls -G"' >> "$HOME/.bash_profile"
source "$HOME/.bash_profile"

# add terminal autocomplete
echo "set completion-ignore-case on" >> "$HOME/.inputrc"
echo "set show-all-if-ambiguous on" >> "$HOME/.inputrc"
echo "TAB: menu-complete" >> "$HOME/.inputrc"

# don't show that 'last login' message
touch "$HOME/.hushlogin"


############
#  MacVim  #
############

# install macvim
mvim_dmg="MacVim.dmg"
mvim_latest="https://github.com/macvim-dev/macvim/releases/latest"
mvim_regex="macvim-dev/macvim/releases/download/snapshot-[0-9]*/$mvim_dmg"

mvim_dl="$(curl --silent -L $mvim_latest | egrep --only-matching $mvim_regex)"
curl -L "https://github.com/$mvim_dl" --output "$HOME/$mvim_dmg"

# mount .dmg and copy macvim to applications folder
VOLUME="$(hdiutil attach $HOME/$mvim_dmg | grep Volumes | awk '{print $3}')"
cp -rf "$VOLUME/MacVim.app" /Applications
hdiutil detach "$VOLUME"
rm "$HOME/$mvim_dmg"

# Add mvim to path
echo 'export PATH=$PATH:/Applications/MacVim.app/Contents/bin' >> ~/.bash_profile
source ~/.bash_profile


############
#  iTerm2  #
############

# iTerm2
iterm_zip="iTerm2.zip"
iterm_latest_release="https://www.iterm2.com/downloads/stable/latest"
curl -L "$iterm_latest_release" --output "$HOME/$iterm_zip"
unzip -q "$HOME/$iterm_zip" -d /Applications
rm "$HOME/$iterm_zip"

iterm_gruvbox_url="https://raw.githubusercontent.com/morhetz/gruvbox-contrib/master/iterm2/gruvbox-dark.itermcolors"
curl -L "$iterm_gruvbox_url" --output "$HOME/gruvbox-dark.itermcolors"
