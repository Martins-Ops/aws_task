#!/bin/bash

function performCommands {
    local  my_var="$1"
    # Function to split the hyphen-separated string and create the output file
    function splitString {
        # Split the hyphen-separated string into two separate words and assign the second word to a variable
        local second_word="${my_var#*-}"

        # Concatenate the second word with ".txt" to create the output file name
        local output="${second_word}.txt"

        # Create the output file in the current working directory
        touch "$output"

        # Echo the output variable
        echo "$output"

        # Return a non-error exit code
        return 0
    }

    function createNewFiles {
        # Check if the output file was created successfully
        if [ -f "$output" ]
        then
        # Create three new files with different names, verbosely
            cp -v "$output" "$var1-$output"
            cp -v "$output" "$var2-$output"
            cp -v "$output" "$var3-$output"
        else
            echo "Error: Failed to create output file"
            return 1
        fi
    }

    function removeFiles {
        rm -v "test1-$output"
        echo "Return code of the previous command: $?"
        rm -v "test2-$output"
        echo "Return code of the previous command: $?"
        # Check the return code of previous command
        if [ $? -eq 0 ]
        then
          exit $?
        else
          echo "Error: previous command failed"
        fi
    }

}