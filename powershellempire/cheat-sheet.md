Version 1.0. 
Created
by Will Schroeder (
@harmj0y
)
and Matt Nelson (
@enigma0x3
)
and released under the Creative Commons v3 "Attribution" License.
Empire
Getting Started
git clone 
https://github.com/PowerShellEmpire/Empire
Run setup:
# ./setup/install.sh
# ./setup/reset.sh
Start Empire [in debug mode]: 
# ./empire [--debug]
Documentation at: 
http://www.PowerShellEmpire.com
Return back to the main Empire menu at any point with  main
exit with  exit 
(or Ctrl+C)
. Go back to the previous 
menu with 
back
. Type 
help
at any point for a list of 
commands and their descriptions.
You can list all agents or listeners from any menu with 
list [agents/listeners]
To manually edit the backend db: # 
sqlitebrowser
./data/empire.db
Empire has a heavy UI focus with 
lots of tab
-
comp
letion.
Logging and Downloads
If 
–
debug specified, info in 
./empire.debug
Each agent that checks in has a complete log of 
tasking/results located in:
./downloads/
AGENTNAME
/agent.log
Downloads/other module output for each agent are also 
stored in 
./
downloads/
AGENTNAME 
/
*
