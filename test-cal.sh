declare -a num1s=(1 23 5 7 42 18)
declare -a num2s=(3 44 15 26 30 1)

declare -A results=()
for i in {0..5}; do
  a=${num1s[$i]}
  b=${num2s[$i]}
  results[$a,$b]=$(($a + $b))
  results2[$a,$b]=$(($a - $b))
  results3[$a,$b]=$(($a / $b))
  results4[$a,$b]=$(($a * $b))
done

for i in {0..5}; do
  a=${num1s[$i]}
  b=${num2s[$i]}
  if [ [ $(./add.sh $a $b ) -eq ${results[$a,$b]}  &&  $(./sub.sh $a $b) -eq ${results2[$a,$b]}  &&  $(./div.sh $a $b) -eq ${results3[$a,$b]}  &&  $(./multi.sh $a $b) -eq ${results4[$a,$b]} ] ]; then
       echo "Test passed"
  else
    echo "Test failed"
    exit 1
  fi
done
