#!/bin/bash

<<COMMENT_BLOCK


COMMENT_BLOCK


# Function responsible for basic waiting graphics
loading_ui() {

    local text=$1	# message to be displayed
    local time=$2	# timeout for writing patterns
    local effect=$3	# symbol to be written

    # Makes a Graphic
    echo -n "${text}"   # Displays the messages
    sleep ${time}
    echo -n ${effect}

    sleep ${time}
    echo -n ${effect}

    sleep ${time}
    echo -n ${effect}

    sleep ${time}
    echo

    return
}


check_config() {

    # Checks if config exists or not

    local key=$1
    local key1=$2

    # Test (after testing remove comments)
   # key=`git config --get "${key}"`
   # key1=`git config --get "${key1}"`

    key=''  # after testing, delete this line
    key1='' # after testing, delete this line
    if [ -z "${key}" ] || [ -z "${key1}" ] ; then

          echo -n '❌'
          "${HOME}/gcm/scripts/login-menu.sh"
    else
        	echo -n '✅'
    fi
    sleep 0.75

    return
}

error() {

  local message=$1
  local erroco=$2

  echo "\t\t1mError (code ${2}): [31m${1}[0m\n" >&2
  echo

  exit "${erroco}"
}


warning() {

  local message=$1
  local info=$2
  local warning=`echo -e "\t "${1}" \n "${2}" "` # output to be displayed

  dialog --cursor-off-label --msgbox "${warning}" 8 40 \
         --clear

  #if [[ "${?}" -eq 0 ]]; then
  #
  #  dialog --clear
  #fi

  return
}


check_packages() {

  local packages=${@}


  # While checks if we're at last package provided
  while [[ "${#}" -ne 0 ]]; do

    "${1}" --version &>/dev/null

    if [[ ${?} -ne 0 ]]; then

      echo "Installing ${1}"
      sudo apt install "${1}"

      if [ "${?}" -ne 0 ]; then
        echo "[31mError[0m: [1mgit[0m cann't be installed"
        exit 36
      fi
    fi

    shift
  done

  return
}

