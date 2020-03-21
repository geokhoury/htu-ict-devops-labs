#!/bin/bash

today=$(/bin/date +%Y-%m-%d)
time=$(/bin/date +%T)

echo "Today is $today."
echo "The time is $time."
echo "Hello, $USER! You are in $PWD."