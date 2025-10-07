#!/bin/bash

<<COMMENT_BLOCK
  This test script is just for testing purposes.
  No purpose in any of the operator mechanisms
COMMENT_BLOCK

# source library.sh file
if [ -x "${HOME}/gcm/scripts/library.sh" ]; then
  . "${HOME}/gcm/scripts/library.sh"
fi

# check_packages is being checked with different packages
check_packages 'python3.11'


# package manager is being called from check_packages (hence no need)
# still doing checks
package_manager
