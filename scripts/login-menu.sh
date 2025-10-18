#!/bin/bash

<<COMMENT_BLOCK

  Dialog utility have some bugs in dialog form box.
  Hence be carefully making changes to the form function and the main
  while loop (infinite loop) in this file.
  Every feature is bug-free in the GCM plugin-in 
  by working around the bugs of dialog tool.

COMMENT_BLOCK

# Sourcing functions from library
if [ -x "${HOME}/GCM/scripts/library.sh" ]; then
  . "${HOME}/GCM/scripts/library.sh"
fi
# Source Block End

set_author_identity() {

  local username="${1}"
  local email="${2}"
  local scope="${3}"

  git config --add "${scope:='--local'}" user.name "${username}"
  local error_name=${?}

  git config --add "${scope:='--local'}" user.email "${email}"
  local error_email=${?}

  if [ "${error_email}" -ne 0 ] && [ "${error_name}" -ne 0 ]; then

      echo "[31mOperation Failed[0m"
      error "cann't add configuration: name & email" "${?}, ${error_name}"
  elif [ "${error_email}" -ne 0 ]; then
      error "cann't add configuration {email}" "${?}"
  elif [ "${error_name}" -ne 0 ]; then
      error "cann't add configuration {name}" "${error_name}"
  elif [ "${error_email}" -eq 0 ] && ["${error_name}" -eq 0 ]; then
      echo 'Account Identity Set'
      return 0
  fi

}

form() {

  exec 3>&1 # mapping fd 3 to STDOUT

  # Enter user and email_id
  local login_info=$(dialog \
                      --ok-label "Next" \
                      --nocancel \
                      --backtitle "Set your account's default identity" \
                      --cursor-off-label  \
                      --keep-window \
                      --form "Please enter your Username and Email" \
                      10 50 0 \
                      "Username: " 1 1 "" 1 12 20 0 \
                      "Email: " 2 1 "" 2 12 20 0 \
                      2>&1 1>&3)

  exec 3>&- # Close fd 3

  username=$( echo "${login_info}" | sed -n '1p' )
  email_id=$( echo "${login_info}" | sed -n '2p' )


}

scope_radiolist() {

  exec 3>&1

  # --nocancel to remove button
  scope=$(dialog \
                       --ok-label "Confirm" \
                       --cancel-label "back" \
                       --cursor-off-label \
                       --clear \
                       --radiolist "Scope" 13 20 4 \
                       2 "global" "off" \
                       3 "local" "on" \
                       2>&1 1>&3)

  local button_clicked=${?}

  exec 3>&-

  case $scope in
    1)
      scope="system"
      break
      ;;
    2)
      scope="global"
      break
      ;;
    3)
      scope="local"
      break
      ;;
    4)
      scope="worktree"
      break
      ;;
  esac

  return ${button_clicked}
}

confirm_yesno() {

  exec 3>&1

  # Confirm writing the configs
  dialog  \
         --clear \
         --yesno "Do you Confirm writing the changes" 5 40 \
         2>&1 1>&3

  local button_clicked=${?}

  exec 3>&-

  return ${button_clicked}

}

while [ 1 ]; do

  # Call Dialog menu
  form
  while [ 1 ]; do

    scope_radiolist
    if [[ "${?}" -eq 0 ]]; then

      confirm_yesno
      if [[ "${?}" -eq 0 ]]; then

        clear
        set_author_identity "${username}" "${email_id}" "--${scope}"
        exit 0  # Author authentication successfully done..
      else
        exit 24  # User exited without saving changes
      fi
    else
      #break 2  # Breaks the outer infinite while loop
      break 1  # Break the inner infinite while loop
    fi
  done
done

clear
