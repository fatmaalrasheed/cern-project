#!/bin/bash

echo "I am the job, executing a simple sleep for $1."
sleep $1
printenv

