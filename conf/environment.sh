#!/bin/bash

export curDate=$(date +'%Y-%m-%d_%H:%M:%S')

#SSH command to launch hadoop fs command
export sourceSsh="ssh edge1.datalab.adastracorp.net "

#HDFS Directory to scan recursively
export sourceHdfsDir="/user/Jakub.Augustin/"
export targetHdfsPath="/tmp/Jakub.Augustin/"

export parallelism=24

#Target replication factor
export replicationFactor=3

#Paths to store scans
export directoryListFile="directory_list"
export fileListFile="file_list"

export tmpDirectoryListPath="../log/"${directoryListFile}".txt"
export tmpFileListPath="../log/"${fileListFile}".txt"

export curDirectoryListPath="../log/"${directoryListFile}"_"${curDate}".txt"
export curFileListPath="../log/"${fileListFile}"_"${curDate}".txt"

export dirCreateSuccessLogFile="../log/dirCreateSuccess.log"
export dirCreateErrorLogFile="../log/dirCreateError.log"

export transferSuccessLogFile="../log/hdfsTransferSuccess.log"
export transferErrorLogFile="../log/hdfsTransferError.log"