#!/usr/bin/env python
print("Exercise 2: Odd or Even -")

num = int(raw_input("Enter a number: "))
mod = num % 2

print(mod)

if mod == 1:
	print("You typed in a odd number")
else: 
	print("You typed in an even number")

raw_input("Press Enter to continue...")	
