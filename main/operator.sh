#!/bin/bash

<<COMMENT_BLOCK


COMMENT_BLOCK

echo 'Loading Menu'

# main loop
while [ 1 ]; do

  if [[ -x "${HOME}/gcm/scripts/main-menu.sh" ]]; then

      "${HOME}/gcm/scripts/main-menu.sh"

      # If user wants to exit, exit the program
      if [ "${?}" -eq 24 ]; then

        exit 0  # Task Completed Successfully

      fi
  else
    echo 'Error ([31mFatal[0m): main-menu.sh not found'
    echo 'Try Loading the script at gcm/scripts'
    exit 63
  fi
done

