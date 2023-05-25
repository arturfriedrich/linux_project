#!/bin/bash

print_information() {
    local desc=$1
    local temp=$2
    local hum=$3
    local wind=$4
    local clouds=$5

    # Drawing ASCII art based on the desciption
    case $desc in
        "clear sky")
            echo "  \   /     $desc"
            echo "   .-.      $temp °C"
            echo "― (   ) ―   ↘ $wind km/h"
            echo "   '-'      $hum %"
            echo "  /   \     $clouds %"
        ;;
    esac

}