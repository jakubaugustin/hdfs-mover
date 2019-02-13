#!/bin/bash

echo "creating directory"$1
hadoop fs -mkdir -p $1
if [ $? -eq 0 ]
then
        echo $1 >> ${dirCreateSuccessLogFile}
else
        echo $1 >> ${dirCreateErrorLogFile}
fi
