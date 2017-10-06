import sys
import os

from colorama import init

init(strip=not sys.stdout.isatty()) # strip colors if stdout is redirected

from termcolor import cprint 
from pyfiglet import figlet_format

cprint(figlet_format('War Games', font='starwars'),'white', 'on_blue', attrs=['bold'])


os.system("pause")

