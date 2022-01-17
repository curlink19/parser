#/bin/bash

cd util
g++ -std=c++17 -Wall -Wextra -o checker checker.cpp
echo "builded (for checker)"
cd ..

g++ -std=c++17 -Wall -Wextra -o core main.cpp
echo "builded"

for (( i=1; i<=19; ++i ))
  do
    if [[ -f "in$i" ]]; then
      ./core < in$i > util/current
      echo "test $i: "
      ./util/checker in$i out$i util/current
      current=$?
      if [ "$current" = "0" ]; then
        echo "OK"
      fi
      if [ "$current" = "143" ]; then
        echo "ERROR"
      fi
      if [ "$current" = "144" ]; then
        echo "WA"
      fi
    fi
  done
