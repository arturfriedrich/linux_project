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
    local date=$6

    # Drawing ASCII art based on the desciption
    case $desc in
        "clear sky")
            echo $date
            echo "${YELLOW}   \   /     ${NC} $desc"
            echo "${YELLOW}    .-.      ${NC} $temp ${GREEN}°C${NC}"
            echo "${YELLOW} ― (   ) ―   ${NC} ↘ $wind ${GREEN}km/h${NC}"
            echo "${YELLOW}    '-'      ${NC} $hum ${GREEN}%${NC}"
            echo "${YELLOW}   /   \     ${NC} $clouds ${GREEN}%${NC}"
            echo ""
        ;;

        "broken clouds")
            echo $date
            echo "               $desc"
            echo "      .--.     $temp ${GREEN}°C${NC}"
            echo "   .-(    ).   ↘ $wind ${GREEN}km/h${NC}"
            echo "  (___.__)__)  $hum ${GREEN}%${NC}"
            echo "               $clouds ${GREEN}%${NC}"
            echo ""
        ;;

        "partly cloudy" | "few clouds" | "overcast clouds" | "scattered clouds")
            echo $date
            echo "${YELLOW}     \  /${NC}       $desc"
            echo "${YELLOW}   _ /''${NC}${WHITE}.-.${NC}     $temp ${GREEN}°C${NC}"
            echo "${YELLOW}     \_${NC}${WHITE}(   ).${NC}   ↘ $wind ${GREEN}km/h${NC}"
            echo "${YELLOW}     /${NC}${WHITE}(___(__)${NC}  $hum ${GREEN}%${NC}"
            echo "                $clouds ${GREEN}%${NC}"
            echo ""
        ;;

        "shower rain")
            echo $date
            echo "${YELLOW}  _'/''${NC}.-.       $desc"
            echo "${YELLOW}   ,\_${NC}(   ).     $temp ${GREEN}°C${NC}"
            echo "${YELLOW}    /${NC}(___(__)    ↘ $wind ${GREEN}km/h${NC}"
            echo "${BLUE}      ' ' ' '${NC}    $hum ${GREEN}%${NC}"
            echo "${BLUE}     ' ' ' '${NC}     $clouds ${GREEN}%${NC}"
            echo ""
        ;;

        "rain" | "light rain")
            echo $date
            echo "      .--.      $desc"
            echo "   .-(    ).    $temp ${GREEN}°C${NC}"
            echo "  (___.__)__)   ↘ $wind ${GREEN}km/h${NC}"
            echo "${BLUE}  ' ' ' ' ' '${NC}   $hum ${GREEN}%${NC}"
            echo "${BLUE}   ' ' ' ' '${NC}    $clouds ${GREEN}%${NC}"
            echo ""
        ;;

        *)
            echo $date
            echo "${YELLOW}             ${NC} $desc"
            echo "${YELLOW}             ${NC} $temp ${GREEN}°C${NC}"
            echo "${YELLOW}             ${NC} ↘ $wind ${GREEN}km/h${NC}"
            echo "${YELLOW}             ${NC} $hum ${GREEN}%${NC}"
            echo "${YELLOW}             ${NC} $clouds ${GREEN}%${NC}"
            echo ""

    esac

}