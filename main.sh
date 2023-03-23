#!/bin/bash

# Source the script that contains the functions
source function.sh

# Source the variables from var.sh
source var.sh

# Define the argument for performCommands
my_var="Hello-world"

# Call performCommands function
performCommands "$my_var"

# Call splitString function
output=$(splitString)

# Call createNewFiles function
createNewFiles

# Call removeFiles function
removeFiles