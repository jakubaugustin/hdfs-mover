#!/bin/bash

sourceFile=$1
targetFile=$(echo $1 | awk -v s=${sourceHdfsDir} -v t=${targetHdfsPath} '{gsub(s, t, $1)}{print $1}')

echo "moving "${sourceFile}" to "${targetFile}

if grep -q ${sourceFile} ${transferSuccessLogFile}
then
	echo "skipping file "${sourceFile}", because it was already transferred"
	exit 1
fi

${sourceSsh} echo hadoop fs -cat ${sourceFile} | hadoop fs -Ddfs.replication=${replicationFactor} -put - ${targetFile}
if [ $? -eq 0 ]
then
        echo ${sourceFile} >> ${transferSuccessLogFile}
else
        echo ${sourceFile} >> ${transferErrorLogFile}
fi
