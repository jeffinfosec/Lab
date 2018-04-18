#!/usr/bin/env python
print("Setting up a list....")

a = [1,2,4,40,71,80]
num = int(raw_input("Choose a number: "))
new_list = []

for i in a:
	if i < num:
		new_list.append(i)

print new_list

raw_input("Press Enter to continue...")
