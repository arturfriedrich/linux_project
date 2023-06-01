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

    case $desc in
    "clear sky")
        echo -n $date
        echo ""
        echo -e "${YELLOW}   \   /     ${NC} $desc"
        echo -e "${YELLOW}    .-.      ${NC} $temp ${GREEN}°C${NC}"
        echo -e "${YELLOW} ― (   ) ―   ${NC} ↘ $wind ${GREEN}km/h${NC}"
        echo -e "${YELLOW}    '-'      ${NC} $hum ${GREEN}%${NC}"
        echo -e "${YELLOW}   /   \     ${NC} $clouds ${GREEN}%${NC}"
        echo ""
    ;;

    "broken clouds")
        echo -n $date
        echo ""
        echo -e "               $desc"
        echo -e "      .--.     $temp ${GREEN}°C${NC}"
        echo -e "   .-(    ).   ↘ $wind ${GREEN}km/h${NC}"
        echo -e "  (___.__)__)  $hum ${GREEN}%${NC}"
        echo -e "               $clouds ${GREEN}%${NC}"
        echo ""
    ;;

    "partly cloudy" | "few clouds" | "overcast clouds" | "scattered clouds")
        echo -n $date
        echo ""
        echo -e "${YELLOW}     \  /${NC}       $desc"
        echo -e "${YELLOW}   _ /''${NC}${WHITE}.-.${NC}     $temp ${GREEN}°C${NC}"
        echo -e "${YELLOW}     \_${NC}${WHITE}(   ).${NC}   ↘ $wind ${GREEN}km/h${NC}"
        echo -e "${YELLOW}     /${NC}${WHITE}(___(__)${NC}  $hum ${GREEN}%${NC}"
        echo -e "                $clouds ${GREEN}%${NC}"
        echo ""
    ;;

    "shower rain")
        echo -n $date
        echo ""
        echo -e "${YELLOW}  _'/''${NC}.-.       $desc"
        echo -e "${YELLOW}   ,\_${NC}(   ).     $temp ${GREEN}°C${NC}"
        echo -e "${YELLOW}    /${NC}(___(__)    ↘ $wind ${GREEN}km/h${NC}"
        echo -e "${BLUE}      ' ' ' '${NC}    $hum ${GREEN}%${NC}"
        echo -e "${BLUE}     ' ' ' '${NC}     $clouds ${GREEN}%${NC}"
        echo ""
    ;;

    "rain" | "light rain" | "moderate rain")
        echo -n $date
        echo ""
        echo -e "      .--.      $desc"
        echo -e "   .-(    ).    $temp ${GREEN}°C${NC}"
        echo -e "  (___.__)__)   ↘ $wind ${GREEN}km/h${NC}"
        echo -e "${BLUE}  ' ' ' ' ' '${NC}   $hum ${GREEN}%${NC}"
        echo -e "${BLUE}   ' ' ' ' '${NC}    $clouds ${GREEN}%${NC}"
        echo ""
    ;;

    *)
        echo -n $date
        echo ""
        echo -e "${YELLOW}             ${NC} $desc"
        echo -e "${YELLOW}             ${NC} $temp ${GREEN}°C${NC}"
        echo -e "${YELLOW}             ${NC} ↘ $wind ${GREEN}km/h${NC}"
        echo -e "${YELLOW}             ${NC} $hum ${GREEN}%${NC}"
        echo -e "${YELLOW}             ${NC} $clouds ${GREEN}%${NC}"
        echo ""

    esac
}
