#!/bin/bash

datestr=`date +%Y-%m-%d_%H:%M:%S`
if [ -e ~/.profile ]; then
	mv ~/.profile ~/.profile_$datestr
fi
if [ -e ~/.bash ]; then
	mv ~/.bash ~/.bash_$datestr
fi

cp -R .bash .profile ~
