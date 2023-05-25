#!/bin/bash

print_information() {
    local desc=$1
    local temp=$2
    local hum=$3
    local wind=$4
    local clouds=$5

    echo $desc

    # Drawing ASCII art based on the desciption
    case $desc in
        "clear sky")
            echo "   \   /     $desc"
            echo "    .-.      $temp °C"
            echo " ― (   ) ―   ↘ $wind km/h"
            echo "    '-'      $hum %"
            echo "   /   \     $clouds %"
        ;;

        "broken clouds")
            echo "               $desc"
            echo "      .--.     $temp °C"
            echo "   .-(    ).   ↘ $wind km/h"
            echo "  (___.__)__)  $hum %"
            echo "               $clouds %"
        ;;

        "partly cloudy")
            echo "     \  /       $desc"
            echo "   _ /''.-.     $temp °C"
            echo "     \_(   ).   ↘ $wind km/h"
            echo "     /(___(__)  $hum %"
            echo "                $clouds %"
        ;;

    esac

}