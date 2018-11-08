#!/usr/bin/env python
import sys
import httplib
connection = httplib.HTTPConnection("www.google.com")
connection.request("GET", "/index.html")
response = connection.getresponse()
relevant_payload = response.read()
print(relevant_payload)

print(sys.version)
print("Hello")
