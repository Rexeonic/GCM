#!/bin/bash

<<comment_block
    main runner right now.

    ✅ ❌
    step1: perform various checks
    step2: runs operator.sh
    step3: exit

comment_block

# Sourcing library
if [ -f "${HOME}/gcm/scripts/library.sh" ]; then
  . "${HOME}/gcm/scripts/library.sh"
fi
# Sourcing Block



########## Main Script Block ##########

# Initialization Block
loading_ui 'Running gcm by Rexeonic' '0.5' '.'
echo

loading_ui 'Loading Modules' '0.5' '✅'
if [ -x "${HOME}/gcm/main/operator.sh" ]; then

  echo "[32mAll Operators Loaded Successfully[0m"
fi
# Initialization ended


# GCM Checks
loading_ui 'Checking Dependencies' '0.5' '✅'
# Perform Checks
check_packages 'git' 'dialog'
if [ "${?}" -ne 0 ]; then

  if [ "${?}" -ne 0 ]; then
    echo "[31mError[0m: [1mgit[0m cann't be installed"
    exit 36
  fi
fi

echo
echo "[43mStatus[0m: [1mAll Systems are initialized properly[0m"
# Checks Ended
echo



# Run the operator.sh script
{
  ( ${HOME}/gcm/main/operator.sh )
}

# Operation Completed (Successfully)
exit 0
