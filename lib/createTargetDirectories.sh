#!/bin/bash

touch ${dirCreateSuccessLogFile}
if [ $? -ne 0 ]
then
	echo "could create log file"
	exit 1
fi
touch ${dirCreateErrorLogFile}
if [ $? -ne 0 ]
then
	echo "could create log file"
	exit 1
fi

cat ${tmpDirectoryListPath} | awk -v s=${sourceHdfsDir} -v t=${targetHdfsPath} '{gsub(s, t, $8)}{print $8}' | xargs -P${parallelism} -I % bash -c "../lib/createHDFSDir.sh %"