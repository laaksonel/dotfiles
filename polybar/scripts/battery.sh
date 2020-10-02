#!/bin/bash

ACPI=$(acpi -b)
STATUS=$(grep -Po '(?<=: )([a-zA-Z]+)(?=,)' <<< $ACPI)
percent=$(grep -Po '[0-9]?[0-9][0-9]?(?=\%)' <<< $ACPI)

if [[ $STATUS == 'Discharging' ]]
then
  if [ $percent -le 10 ]
  then
    full_text='  '
  elif [ $percent -le 25 ]
  then
    full_text='  '
  elif [ $percent -le 50 ]
  then
    full_text='  '
  elif [ $percent -le 75 ]
  then
    full_text='  '
  elif [ $percent -le 100 ]
  then
    full_text='  '
  fi
else
  full_text='  '
fi

if [ $percent -eq 99 ]
then
  percent=100
fi

echo $full_text $percent'%'

# Set urgent flag below 5% or use orange below 20%
[ ${percent%?} -le 5 ] && exit 33
#[ ${BAT%?} -le 20 ] && echo "#FF8000"

exit 0
