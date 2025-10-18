#!/bin/bash

<<COMMENT_BLOCK
  1. Draws basic tui
  2. provides option for various operations.
    a) Setup a Project
    b) Pulling Updates
    c) Config
    d) exit
  3. Keeps running step2 until exits

COMMENT_BLOCK

if [ -x "${HOME}/GCM/scripts/library.sh" ]; then
  . "${HOME}/GCM/scripts/library.sh"
fi

main-menu() {

  clear
  echo
  echo -e "\t\t\t Git Control Manager \n"
  echo -e "\t1. Setup a Project"
  echo -e "\t2. Pull Updates"
  echo -e "\t3. Manage Config"
  echo -e "\t4. Exit\n\n"

  echo -en "\t\t Enter Option: "
  read -n 2 option
  echo -E
}

while [ 1 ]; do

  main-menu

  case ${option} in
    1)
      if [[ -x "${HOME}/GCM/main/setup.sh" ]]; then
        "${HOME}/GCM/main/setup.sh"
      else
        # error 'Error message' 'errro code'
        error 'msg' "${?}"
      fi
      break;;
    2)
      if [[ -x "${HOME}/GCM/main/run-update.sh" ]]; then
        "${HOME}/GCM/main/run-update.sh"
      else
        # error 'Error message' 'errro code'
        error 'msg' "${?}"
      fi
      break;;
    3)
      if [[ -x "${HOME}/GCM/main/config-manager.sh" ]]; then

        "${HOME}/GCM/main/config-manager.sh"

      else

        # error 'Error message' 'errro code'
        error 'msg' "${?}"
      fi


      break;;
    4)

      exit 24
      ;;

    *)
      # warning 'Error Message' 'where occurred'
      warning 'Unknown value provided' "$(basename ${0}): undefined module accessed"
      clear
      break;;
  esac

done


# Main-menu Operated Successfully
exit 0
