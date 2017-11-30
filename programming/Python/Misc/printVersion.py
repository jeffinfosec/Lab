# import modules
import os
import sys
import time
import getpass
from colorama import init
from termcolor import cprint
from pyfiglet import figlet_format

# init
init(strip=not sys.stdout.isatty()) 

msg = sys.version

def printPythonVersion():
        print(msg)

printPythonVersion()

os.system("pause")
