import subprocess, sys
import os
script_folder = os.path.dirname(__file__)
parent_directory = os.path.abspath(os.path.join(script_folder, os.pardir))
sys.path.append(parent_directory)
# Projects = list, scripts = dictionary
from files import *

args = sys.argv

types = ['project', 'script']

web_folder = args[1]
type_script = None
name_script = None
folder = web_folder if type_script == "project" else script_folder

if len(args) == 2:
    print(
    "\n"
    "[Run-Init V0.1]\n",
    "\n",
    "command: init [type] [name]\n",
    "example: init script config",
    "\n",
    "type: project"
    )
    for project in projects:
        print(" - ", project)
    print("\n")
    print("type: script")
    for key in scripts:
        print(" - ", key)
        print("     ", scripts[key])
    sys.exit()
    
elif len(args) == 3:
    print("Missing arguments: init [type] [name]")
    sys.exit()

type_script = args[2]
name_script = args[3]

def run_program():

    if type_script == 'script':
        
        if name_script not in scripts:
            print('Unknown type. List of valid types:')
            for key in scripts:
                print(key, '->', scripts[key])
            sys.exit()

        command = "Powershell.exe -executionpolicy remotesigned -File " + folder + '\\' + name_script + ".ps1"
        os.system(command)
    
    elif type_script == 'project':
        subprocess.call(['C:\\scripts\\src\\call_project.bat', name_script, web_folder])

run_program()
