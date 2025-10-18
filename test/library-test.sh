#!/bin/bash

<<COMMENT_BLOCK
  This test script is just for testing purposes.
  No purpose in any of the operator mechanisms
COMMENT_BLOCK

# source library.sh file
if [ -x "${HOME}/GCM/scripts/library.sh" ]; then
  . "${HOME}/GCM/scripts/library.sh"
fi

# checks if bash can intrepret the script
bash -n "${HOME}/GCM/scripts/library.sh"

# check_packages is being checked with different packages
check_packages 'python3.11'


# package manager is being called from check_packages (hence no need)
# still doing checks
package_manager
