#!/bin/bash

alias="h"
# change to same alias as the .bashrc script
jump_home=false
stay_dir=false
n="1"

print_help() {
  echo "Usage: $alias [-g] -[s] [-n num]"
  echo "-g: fzf globally"
  echo "-s: stay in current directory afterwards"
  echo "-n num: open file at this line number"
  echo "-?: prints usage of $alias"
}

while getopts "gs?n:" o; do
  case ${o} in 
    g) 
      jump_home=true
      ;;
    s) 
      stay_dir=true
      ;;
    n) 
      n=${OPTARG}
      ;;
    ?)
      print_help
      return
      ;;
    esac
done

shift $((OPTIND-1))
OPTIND=1

original=$(pwd)

if $jump_home; then
  cd ~
fi

full=$(fzf)
dir=$(dirname "$full")
name=$(basename "$full")

if $stay_dir; then
  hx +$n "$full"
else 
  z "$dir"
  hx +$n "$name"
fi

if $jump_home && $stay_dir; then
  z "$original"
fi
