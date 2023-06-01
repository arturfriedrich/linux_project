#!/bin/bash

# Include the necessary scripts
source printer.sh
source current_weather.sh
source forecast.sh

# Set OpenWeatherMap API key, write your own API key here
api_key_file="apikeyfile.txt"

# Check if the apikey file already exists
if [[ ! -e $api_key_file ]]; then
    # Prompt the user to enter an API key
    read -p "Enter your API key: " api_key

    # Write the API key to the file
    echo "$api_key" > "$api_key_file"

    echo "API key has been saved to $api_key_file."
fi

apikey=$(cat apikeyfile.txt)
API_KEY=$apikey

# Prompt user to enter a location
read -p "Enter a location: " location

# Prompt user to choose display mode: current weather (c) or forecast (f)
read -p "Do you want to display the current weather or the forecast for 5 days: (c/f) " display_mode

# Check the value of display_mode and take appropriate action
if [ "$display_mode" = "c" ]; then
    # Display current weather information
    get_weather_information "$location"
elif [ "$display_mode" = "f" ]; then
    # Display weather forecast for 5 days
    get_weather_forecast "$location"
else
    echo "Invalid input!"
fi
