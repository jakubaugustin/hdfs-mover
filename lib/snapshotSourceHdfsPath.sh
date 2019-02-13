#!/bin/bash

#Check path for directory list
echo "-creating directory list file: "${tmpDirectoryListPath}
if [ ! -f ${tmpDirectoryListPath} ]
then
    touch ${tmpDirectoryListPath}
	if [ $? -ne 0 ]
	then
		echo "could not create file!"
		exit 1
	fi
else
	echo "found file "${tmpDirectoryListPath}" it contains: "$(cat ${tmpDirectoryListPath} | wc -l)" lines. Now erasing it."
	echo -n "" > ${tmpDirectoryListPath}
	if [ $? -ne 0 ]
	then
		echo "could not erase file!"
		exit 1
	fi
fi

#Check path for file list
echo "-creating file list file: "${tmpFileListPath}
if [ ! -f ${tmpFileListPath} ]
then
    touch ${tmpFileListPath}
	if [ $? -ne 0 ]
	then
		echo "could not create file!"
		exit 1
	fi
else
	echo "found file "${tmpFileListPath}" it contains: "$(cat ${tmpFileListPath} | wc -l)" lines. Now erasing it."
	echo -n "" > ${tmpFileListPath}
	if [ $? -ne 0 ]
	then
		echo "could not erase file!"
		exit 1
	fi
fi

#Get directories from source
echo "-loading data to directory list file"
${sourceSsh} hadoop fs -ls -R ${sourceHdfsDir} | grep "^d.*" >> ${tmpDirectoryListPath}
if [ $? -ne 0 ]
then
	echo "could not create directory list"
	exit 1
fi
cp ${tmpDirectoryListPath} ${curDirectoryListPath}
echo "created file "${tmpDirectoryListPath}" it contains: "$(cat ${tmpDirectoryListPath} | wc -l)" lines."

#Get files from target
echo "-loading data to file list file"
${sourceSsh} hadoop fs -ls -R ${sourceHdfsDir} | grep "^-.*" >> ${tmpFileListPath}
if [ $? -ne 0 ]
then
	echo "could not create directory list"
	exit 1
fi
cp ${tmpFileListPath} ${curFileListPath}
echo "created file "${tmpFileListPath}" it contains: "$(cat ${tmpFileListPath} | wc -l)" lines."

#Finish happy
exit 0