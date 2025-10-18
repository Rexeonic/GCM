#!/bin/bash

<<COMMENT_BLOCK


COMMENT_BLOCK

if [[ -x "${HOME}/GCM/scripts/library.sh" ]]; then
  . "${HOME}/GCM/scripts/library.sh"
fi

clone() {
  ( : )
}

local_config() {
  ( : )
}


# refer to scripts/library.sh to see function implementation
check_config 'user.name' 'user.email' # checks for basic Author info


# Project Setted-up Successfully
exit 0
