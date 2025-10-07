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


check_config 'user.name' 'user.email' # checks for basic Author info


# Project Setted-up Successfully
exit 0
