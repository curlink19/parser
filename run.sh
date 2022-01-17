#/bin/bash

chr() {
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}

cd util
./run.sh $2

echo "/////////////////////"
for (( i=1; i<=$2; ++i ))
  do
    let "current = 64 + $i"
    ./get.sh $1 $(chr $current)
    echo "get $(chr $current)"
    g++ -DNUMBER_OF_PROBLEM=$i decoder.cpp
    ./a.out
    echo "/////////////////////"
  done

cd ..
