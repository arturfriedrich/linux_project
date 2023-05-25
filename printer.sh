#!/bin/bash

print_information() {

    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[0;33m'
    BLUE='\033[0;34m'
    MAGENTA='\033[0;35m'
    CYAN='\033[0;36m'
    NC='\033[0m' # No color

    local desc=$1
    local temp=$2
    local hum=$3
    local wind=$4
    local clouds=$5

    echo $desc

    # Drawing ASCII art based on the desciption
    case $desc in
        "clear sky")
            echo "${YELLOW}   \   /     ${NC} $desc"
            echo "${YELLOW}    .-.      ${NC} $temp ${GREEN}°C${NC}"
            echo "${YELLOW} ― (   ) ―   ${NC} ↘ $wind ${GREEN}km/h${NC}"
            echo "${YELLOW}    '-'      ${NC} $hum ${GREEN}%${NC}"
            echo "${YELLOW}   /   \     ${NC} $clouds ${GREEN}%${NC}"
        ;;

        "broken clouds")
            echo "               $desc"
            echo "      .--.     $temp ${GREEN}°C${NC}"
            echo "   .-(    ).   ↘ $wind ${GREEN}km/h${NC}"
            echo "  (___.__)__)  $hum ${GREEN}%${NC}"
            echo "               $clouds ${GREEN}%${NC}"
        ;;

        "partly cloudy" | "few clouds")
            echo "${YELLOW}     \  /${NC}       $desc"
            echo "${YELLOW}   _ /''${NC}${WHITE}.-.${NC}     $temp ${GREEN}°C${NC}"
            echo "${YELLOW}     \_${NC}${WHITE}(   ).${NC}   ↘ $wind ${GREEN}km/h${NC}"
            echo "${YELLOW}     /${NC}${WHITE}(___(__)${NC}  $hum ${GREEN}%${NC}"
            echo "                $clouds ${GREEN}%${NC}"
        ;;

        "shower rain")
            echo "  _'/''.-.       $desc"
            echo "   ,\_(   ).     $temp ${GREEN}°C${NC}"
            echo "    /(___(__)    ↘ $wind ${GREEN}km/h${NC}"
            echo "      ' ' ' '    $hum ${GREEN}%${NC}"
            echo "     ' ' ' '     $clouds ${GREEN}%${NC}"
        ;;

        "rain")
            echo "      .--.        $desc"
            echo "   .-(    ).      $temp ${GREEN}°C${NC}"
            echo "  (___.__)__)     ↘ $wind ${GREEN}km/h${NC}"
            echo "  ' ' ' ' ' '     $hum ${GREEN}%${NC}"
            echo "   ' ' ' ' '      $clouds ${GREEN}%${NC}"
        ;;

    esac

}