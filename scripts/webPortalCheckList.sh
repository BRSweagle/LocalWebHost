#!/usr/bin/env bash

argCustomValidator="sameListValidator"
$(dirname "$0")/checkCustomConfigByMdsValidator.sh $1 $argCustomValidator
retVal=$?

if [ $retVal -ne 0 ]; then
  echo "********** ERROR DESCRIPTION: Your schema and options are not in sync, please correct"
fi
exit $retVal
