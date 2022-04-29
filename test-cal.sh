#!/bin/bash
declare -a num1s=(1 23 5 7 42 18)
declare -a num2s=(3 44 15 26 30 1)
declare -a c=(+ - /)
declare -A results=()
for j in {0..2};do
  c=${c[$j]}
  for i in {0..5}; do
    a=${num1s[$i]}
    b=${num2s[$i]}
    results[$a,$b]=$(($a $c $b))

    if [  $(./cal.sh $a $b $c) -eq ${results[$a,$b]}  ]; then
         echo "Test passed for $c"
    else
      echo "Test failed"
      exit 1
    fi
  done
done
for i in {0..5}; do
  a=${num1s[$i]}
  b=${num2s[$i]}
  results[$a,$b]=$(($a * $b))

  if [ $(./multi.sh $a $b) -eq ${results[$a,$b]} ]; then
    echo "Test passed for *"
  else
    echo "Test failed"
    exit 1
  fi
done
