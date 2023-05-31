#!/bin/bash

source printer.sh
source current_weather.sh
source forecast.sh

# set OpenWeatherMap API key, write your own API key here
apikey=$(cat apikey.txt)
API_KEY=$apikey

# prompt user to enter a location
read -p "Enter a location: " location

read -p "Do you want to display the current weather or the forecast for 5 days: (c/f) " display_mode

if [ "$display_mode" = "c" ]; then
    get_weather_information "$location"
elif [ "$display_mode" = "f" ]; then
    get_weather_forecast "$location"
else
    echo "Invalid input!"
fi
