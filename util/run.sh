#/bin/bash

chr() {
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}

# remove files
  cd ..
  for (( i=1; i<=19; ++i ))
    do
      let "current = 96 + $i"
      rm -r $(chr $current)
    done
  cd util
# end of remove

# create files
  cd ..
  for (( i=1; i <= $1; ++i ))
    do
      let "current = 96 + $i"
      name=$(chr $current)
      mkdir $name
      cp util/template.cpp $name/main.cpp
      cp util/test.sh $name/test.sh
      mkdir $name/util
      chmod +x $name/test.sh
      cp util/checker.cpp $name/util/checker.cpp
    done
  cd util
# end of create
