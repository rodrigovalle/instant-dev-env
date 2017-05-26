#!/bin/bash
set -e

# clear git credentials
printf "host=github.com\nprotocol=https\n\n" | git credential-osxkeychain erase
git config --unset-all user.name || true
git config --unset-all user.email || true
rm -f ~/.gitconfig

# clear chrome data
if [[ ! $(pgrep 'Google Chrome') ]]; then
  rm -rf ~/Library/Application\ Support/Google/Chrome/Default
else
  echo 'please close chrome'
  exit 1
fi

# list open git repos
echo "remember to close chrome and delete any open repositories:"
git_repos=$(find ~ -type d -name '.vim' -prune -o -name '.git' -print)

for git_repo in $git_repos; do
  fullpath=$(basename $(dirname $git_repo))
  echo " ~/${fullpath#$HOME}"
done
