#!/bin/bash -ue

dump_file=$1

skip_header=1
row_size=3

cnt=0
cnt_line=0
line_str="first line"

while read line
do
    cnt=`expr $cnt + 1`
    if [ ${cnt} -le ${skip_header} ] ;then
        continue
    fi
    rem=$((cnt_line % row_size))
    if [ ${rem} -eq 0 ] ; then
        # new line
        echo "${line_str}"
        line_str=${line}
    else
        # append
        line_str="${line_str},${line}"
    fi
    cnt_line=`expr $cnt_line + 1`
    # echo "LINE $cnt $cnt_line: $line"
done < ${dump_file}
echo "${line_str}"
