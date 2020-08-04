#!/bin/bash

usage() {
  echo "usage: $0 <amount of messages>"
}

generate_random_commit() {
	# Create a new empty commit with a the random commit message
	git commit --allow-empty -m $(curl -s http://whatthecommit.com/index.txt)
}

count=

while [ "$1" != "" ]; do
  case $1 in
    -h | --help ) usage
			            exit
									;;
		* )           count=$1
  esac
	shift
done

if [ -z $count ]
then
  usage
	exit
fi

for i in {1..$count}
do 
  generate_random_commit
done
