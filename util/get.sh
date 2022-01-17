#!/bin/bash

content=$(wget codeforces.com/contest/$1/problem/$2 -q -O -)
echo $content > content.html
