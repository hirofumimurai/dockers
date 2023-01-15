#!/bin/bash

PWD=$(pwd)

docker run --rm -v ${PWD}:/workdir   paperist/alpine-texlive-ja   /bin/ash -c "platex $1.tex "
docker run --rm -v ${PWD}:/workdir   paperist/alpine-texlive-ja   /bin/ash -c "dvipdfmx $1.dvi"

sleep 1

expect -c "
spawn rm $1.aux
expect rm 
send \"y\r\"
"

echo -e "\n"

expect -c "
spawn rm $1.log
expect rm 
send \"y\r\"
"

echo -e "\n"

expect -c "
spawn rm $1.dvi
expect rm 
send \"y\r\"
"


echo -e "\n"

 exit 0
