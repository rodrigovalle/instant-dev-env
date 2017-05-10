#!/bin/bash

printf "host=github.com\nprotocol=https\n\n" | git credential-osxkeychain erase
git config --unset-all user.name
git config --unset-all user.email

echo "remember to:"
echo " - delete any open repositories"
echo " - log out of chrome"
