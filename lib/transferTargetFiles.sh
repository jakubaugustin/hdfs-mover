#!/bin/bash

touch ${transferSuccessLogFile}
if [ $? -ne 0 ]
then
	echo "could create log file"
	exit 1
fi
touch ${transferErrorLogFile}
if [ $? -ne 0 ]
then
	echo "could create log file"
	exit 1
fi

cat ${tmpFileListPath} | awk '{print $8}' | xargs -P ${parallelism} -I % bash -c "../lib/pipeToHDFS.sh % || true"