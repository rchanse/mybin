#!/bin/bash
x="a b c d"
w=`head -1 $x | cut -d: -f3`
echo $w
