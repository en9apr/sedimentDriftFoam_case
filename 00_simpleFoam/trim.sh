#!/bin/bash

DIR=`pwd`

LOG_FILE=$DIR/log.sedimentTransportConvergenceFoam
mkdir $DIR/tmps
TMP_DIR=$DIR/tmps

echo $LOG_FILE

awk '/^Time =/{print $3}' $LOG_FILE > $TMP_DIR/time
awk '/^Ratio =/{print $3}' $LOG_FILE > $TMP_DIR/ratio

paste $TMP_DIR/time $TMP_DIR/ratio  > $DIR/convergence.txt

rm -rf $DIR/tmps
