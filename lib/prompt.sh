#!/usr/bin/env bash

# Usage: prompt question answer_yes answer_no callback_function
# Will print the text and wait for a user input.
# Then print answer_yes if the user said yes and execute the callback function
# Or print answer_no if the user said no.
prompt() {
  prompt_text=$1;
  prompt_yes=$2;
  prompt_no=$3;
  prompt_callback=$4;

  echo $prompt_text "(Y/n)?"
  read input

  if [ -z "$input" ] || [ $input = "Y" ] || [ $input = "y" ];
  then
    echo $prompt_yes

    # Run the function given as parameter
    $prompt_callback
  else
    echo $prompt_no
    return 1
  fi
}

