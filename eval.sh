#!/bin/bash

foo=10 x=foo
y='$'$x
echo $y
eval y='$'$x
echo $y

a="ls | more"
echo $a
eval $a
