#!/bin/bash

source printer.sh

# set OpenWeatherMap API key
apikey=$(cat apikey.txt)
API_KEY=$apikey

# prompt user to enter a location
read -p "Enter a location: " location

# call OpenWeatherMap API and retrieve weather data
forecast_data=$(curl -s "http://api.openweathermap.org/data/2.5/forecast?q=${location}&appid=${API_KEY}")

# extract relevant weather information from JSON response using grep and cut
temperature=$(echo "$weather_data" | grep -o '"temp":[^,]*' | cut -d ":" -f 2)
description=$(echo "$weather_data" | grep -o '"description":"[^"]*"' | cut -d ":" -f 2 | tr -d '"')
humidity=$(echo "$weather_data" | grep -o '"humidity":[^,]*' | cut -d ":" -f 2 | tr -d '}')
wind_speed=$(echo "$weather_data" | grep -o '"speed":[^,]*' | cut -d ":" -f 2)
clouds=$(echo "$weather_data" | grep -o '"all":[^,]*' | cut -d ":" -f 2 | tr -d '}')

# convert temperature from Kelvin to Celsius
temperature=$(echo "scale=2; ${temperature} - 273.15" | bc)

echo "Weather information for" $location

print_information "$description" $temperature $humidity, $wind_speed $clouds