#!/bin/bash

source printer.sh

# Define function to retrieve weather information
get_weather_information() {
    local location=$1
    local apikey=$2

    # Set OpenWeatherMap API key, write your own API key here
    apikey=$(cat apikeyfile.txt)
    API_KEY=$apikey

    # Call OpenWeatherMap API and retrieve weather data
    weather_data=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=${location}&appid=${API_KEY}")

    # Extract relevant weather information from JSON response using grep and cut
    temperature=$(echo "$weather_data" | grep -o '"temp":[^,]*' | cut -d ":" -f 2)
    description=$(echo "$weather_data" | grep -o '"description":"[^"]*"' | cut -d ":" -f 2 | tr -d '"')
    humidity=$(echo "$weather_data" | grep -o '"humidity":[^,]*' | cut -d ":" -f 2 | tr -d '}')
    wind_speed=$(echo "$weather_data" | grep -o '"speed":[^,]*' | cut -d ":" -f 2)
    clouds=$(echo "$weather_data" | grep -o '"all":[^,]*' | cut -d ":" -f 2 | tr -d '}')

    # Convert temperature from Kelvin to Celsius
    temperature=$(echo "scale=2; ${temperature} - 273.15" | bc)

    # Print weather information
    print_information "$description" $temperature $humidity, $wind_speed $clouds
}