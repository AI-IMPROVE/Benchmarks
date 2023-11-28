#############################################################################################################
### THIS IS A TEMPLATE FILE. SUBSTITUTE '???' ENTRIES WITH THE APPROPRiATE INFORMATION FOR YOUR CONTAINER ###
#############################################################################################################

#!/bin/bash

### Path to your script inside the container that takes in data directory parameter###
CANDLE_PREPROCESS=???#PATH#

if [[ "$#" -ne 1 ]] ; then
    echo "Illegal number of parameters"
    echo "CANDLE_DATA_DIR required"
    exit -1

elif [ $# -ge 2 ] ; then
        CANDLE_DATA_DIR=$1 ; shift

        # if $3 is a file, then set candle_config
        if [ -f $CANDLE_DATA_DIR/$1 ] ; then
                echo "$1 is a file"
                CANDLE_CONFIG=$1 ; shift
                CMD="python ${CANDLE_MODEL} --config_file $CANDLE_CONFIG $@"
                echo "CMD = $CMD $@"

        # else passthrough $@
        else
                echo "$1 is not a file"
                CMD="python ${CANDLE_MODEL} $@"
                echo "CMD = $CMD"

        fi
fi

CANDLE_DATA_DIR=$1

# Command to run your scipt
CMD="??? ${CANDLE_PREPROCESS}"

# Name of your container
echo "using container ???" # Put the name of your container here

# Displaying script parameters
echo "using CANDLE_DATA_DIR ${CANDLE_DATA_DIR}"
echo "using CANDLE_CONFIG ${CANDLE_CONFIG}"
echo "running command ${CMD}"

# Run preprocessing
CANDLE_DATA_DIR=${CANDLE_DATA_DIR} $CMD
