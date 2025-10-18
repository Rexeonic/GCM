#!/bin/bash

<<COMMENT_BLOCK


COMMENT_BLOCK


dialog_form() {

  # --form <text> <height> <width> <form height>
  # <label1> <l_y1> <l_x1> <item 1> <i_y1> <i_x1> <flen1> <ilen1>....
  #
  # flen (length shown for a selected field)
  # ilen (permissible length of the data entered in the field)
  # flen (field length)  if 0 --> can't be altered & contents determine displayed-length
  #                      if -ve --> can't be altered & negated value is displayed-length
  # ilen (input length) if 0 --> set to flen

  local title=${1}

  local label1=${2}
  local label2=${3}
  local label3=${4}

  local options=${NF}

  exec 3>&1 

  local form=$(dialog \
                ${options} \
                --clear \
                --form "${title}" \
                10 50 0 \
                "${label1}"  1 1 "" 1 20 50 0 \
                "${label2}"  2 1 "" 2 20 50 0 \
                "${label3}"  3 1 "" 3 20 50 0 \
                2>&1 1>&3)

  local button_clicked=${?}

  exec 3>&-   # Closing fd 3

  echo ${form}   # To catch data entered in form
  return ${button_clicked}
}

dialog_form 'Example Form' 'remote' 'url' 'upstream' '--nocancel --ok-label "Next" --cursor-off-label'
