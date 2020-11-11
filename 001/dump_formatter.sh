#!/bin/bash -ue

dump_file=$1

skip_header=1
row_size=3

cnt=0
cnt_line=0

while read line
do
    cnt=`expr $cnt + 1`
    if [ ${cnt} -le ${skip_header} ] ;then
        continue
    fi
    cnt_line=`expr $cnt_line + 1`
    rem=$((cnt_line % row_size))
    echo "LINE $cnt $cnt_line: $line"
done < ${dump_file}
