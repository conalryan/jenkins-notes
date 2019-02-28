#!/bin/sh

# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html

# if TEST-COMMANDS; then CONSEQUENT-COMMANDS; fi

# Using =
if [ this = this ]; then echo this = this; fi
if [ 'this' = 'this' ]; then echo \'this\' = \'this\'; fi
if [ "this" = "this" ]; then echo \"this = this\"; fi

if [ 23 = 23 ]; then echo 23 = 23; fi
if [ '23' = '23' ]; then echo \'23\' = \'23\'; fi
if [ "23" = "23" ]; then echo \"23 = 23\"; fi

# Using -eq
if [ this -eq this ]; then echo this this; fi # ERROR: ./if.sh: line 17: [: this: integer expression expected
if [ 'this' -eq 'this' ]; then echo \'this\' \'this\'; fi # ERROR: ./if.sh: line 18: [: this: integer expression expected
if [ "this" -eq "this" ]; then echo \"this this\"; fi # ERROR: ./if.sh: line 19: [: this: integer expression expected

if [ 23 -eq 23 ]; then echo 23 23; fi
if [ '23' -eq '23' ]; then echo \'23\' \'23\'; fi
if [ "23" -eq "23" ]; then echo \"23 23\"; fi

if [ 21 = 21 ]; then
  NUM_1=2
  NUM_2=1
fi

echo $NUM_1
echo $NUM_2