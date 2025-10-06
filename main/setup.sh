#!/bin/bash

<<COMMENT_BLOCK


COMMENT_BLOCK

if [[ -x "${HOME}/gcm/scripts/library.sh" ]]; then
  . "${HOME}/gcm/scripts/library.sh"
fi

clone() {
  ( : )
}

local_config() {
  ( : )
}

#check_config 'user.name' 'user.email'

"${HOME}/gcm/scripts/login-menu.sh"
if [ "${?}" -eq 24]; then # user trying to exit
  exit 24
fi
# Project Setted-up Successfully
exit 0
