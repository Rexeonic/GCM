#!/bin/bash

<<COMMENT_BLOCK


COMMENT_BLOCK


login () {

  # This command isn't working
  dialog --form "Setup Repository" 12 40 4 \
         "Username: " --default-item "$(sed -n '1p' "${HOME}/gcm/.controller")" 1 1 \
         "Email: " --default-item "$(sed -n '2p' "${HOME}/gcm/.controller")" 3 12 15 \
         --clear 1>&3
}


# Call login
login

# Login Completed successfully
exit 0
