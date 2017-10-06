
#!/bin/bash
echo Enter First Number:
read a
echo Enter Second Number:
read b
x=$(expr "$a" + "$b")
echo $a + $b = $x
