#!/usr/bin/env bash

acceptedList="#e9e9e9"
argCustomValidator="colorValidator"
$(dirname "$0")/checkCustomConfigByMdsValidator.sh $1 $argCustomValidator
retVal=$?

if [ $retVal -ne 0 ]; then
  echo "********** ERROR DESCRIPTION: Your Body Background Color is wrong, please correct it to an accepted value: "$acceptedList
fi
exit $retVal
