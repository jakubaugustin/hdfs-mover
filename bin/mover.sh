#!/bin/bash

cd "${0%/*}"

#00 set environment
echo "reading environment conf."
source ../conf/environment.sh
#01 scan and snapshot source directories and files
echo "reading snapshopt from source cluster."
../lib/snapshotSourceHdfsPath.sh
#02 create target directory structure
echo "creating directories on target cluster."
../lib/createTargetDirectories.sh
#03 transfer files
echo "creating directories on target cluster."
../lib/transferTargetFiles.sh
