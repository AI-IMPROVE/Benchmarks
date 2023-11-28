#!/bin/bash
  
#########################################################################
### THIS IS A TEMPLATE FILE. SUBSTITUTE #PATH# WITH THE MODEL EXECUTABLE.
#########################################################################

# arg 1 CANDLE_DATA_DIR
# arg 2 CANDLE_CONFIG

CANDLE_PREPROCESSOR="preprocess.py"

if [ $# -lt 1 ] ; then
        echo "Illegal number of parameters"
        echo "CANDLE_DATA_DIR is required"
        exit -1
fi

CANDLE_DATA_DIR=$1 ; shift
export CANDLE_DATA_DIR=$CANDLE_DATA_DIR

if [ $# -eq 0 ] ; then
	CMD="python $CANDLE_PREPROCESSOR"
fi

if [ $# -ge 1 ] ; then
	CANDLE_CONFIG=$1
	
	if [ -f $CANDLE_DATA_DIR/$1 ] ; then
		echo "$1 is a file"
		CONFIG_FILE=$1 ; shift
		CMD="python $CANDLE_PREPROCESSOR --config_file $CONFIG_FILE $@"
	else
		echo "$1 is not a file"
		CMD="python $CANDLE_PREPROCESSOR $@"
	fi
        echo "CMD = $CMD"
fi

# Display runtime arguements
echo "Setting up runtime arguements"

# Set up environmental variables and execute the preprocess python script
echo "Executing command: $CMD"
$CMD

