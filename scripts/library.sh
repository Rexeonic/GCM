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
    key=`git config --get "${key}"`
    key1=`git config --get "${key1}"`

    # if any 1 or both keys are empty, run login-menu
    if [ -z "${key}" ] || [ -z "${key1}" ] ; then

          echo -n '❌'
          "${HOME}/gcm/scripts/login-menu.sh"

          return ${?}
    else
        	echo -n '✅'
    fi

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


  loading_ui '[1m[32mInstalling missing dependencies[0m' '0.5' '.'

  # While checks if we're at last package provided
  while [[ "${#}" -ne 0 ]]; do

    "${1}" --version &>/dev/null # check if package is installed

    if [ ${?} -ne 0 ]; then # if not installed then

      echo "[37;42mInstalling ${1}[0m"
      sudo "$(package_manager)" install "${1}"

      if [ "${?}" -ne 0 ]; then
        echo "[31mError[0m: [1m${1}[0m cann't be installed"
        echo "[44mTry to manually instally the package [1m${1}[0m"
        exit 36
      fi
    fi

    shift
  done

  return
}

package_manager() {

  # This function checks which distribution user's on 
  # i.e uses either apt, dnf, pkg or yum etc.

  if command -v apt &>/dev/null; then
    echo "apt"
  elif command -v dnf &>/dev/null; then
    echo "dnf"
  elif command -v yum &>/dev/null; then
    echo "yum"
  elif command -v pacman &>/dev/null; then
    echo "pacman"
  else
    warning 'library [package_manager] :' 'package manager cannot be determined'
  fi

  return
}
