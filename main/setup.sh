#!/bin/bash

<<COMMENT_BLOCK


COMMENT_BLOCK

if [[ -x "${HOME}/gcm/scripts/library.sh" ]]; then
  . "${HOME}/gcm/scripts/library.sh"
fi

clone() {
  true
}

local_config() {
  true
}

check_config 'user.name' 'user.email'

#while [ 1 ]; do

  # Make a form (this cmd isn't working)
  dialog --form "Setup Repository" 12 40 4 \
    "Username: " --default-item "$(sed -n '1p' "${HOME}/gcm/.controller")" 1 1 \
    "Email: " --default-item "$(sed -n '2p' "${HOME}/gcm/.controller")" 3 12 15 \
         "Token: " 3 12 15 0 \
         --clear

#done
# Project Setted-up Successfully
exit 0
