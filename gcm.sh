#!/bin/bash

<<COMMENT_BLOCK
    Main runner right now.
    
    ✅ ❌
    Step1: Perform various checks
    Step2: runs operator.sh
    Step3: Exit

COMMENT_BLOCK


check_config() {

    # Checks if config exists or not

    local key=$1

    git config --get "${key}"
    if [ "${?}" -ne 0 ] ; then
        	echo -n '✅'
    else
        	echo -n '❌'
    fi
    sleep 0.75

}

graphic() {

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
}
    
graphic 'Running gcm by Rexeonic' '0.5' '.'
echo



echo -n 'Performing Checks'
# Perform Checks
check_config 'user.name'
check_config 'user.email'
# Checks Ended
echo

# gives control to Jarvis (i.e operator.sh)
if [[ -n "$(pwd)/main/operator.sh" ]]
then
	. "$(pwd)/main/operator.sh"
fi

# Operation Completed (Successfully)
exit 0
