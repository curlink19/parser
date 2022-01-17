#!/bin/bash

content=$(wget --show-progress codeforces.com/contest/$1/problem/$2 -q -O -)
echo $content > content.html
