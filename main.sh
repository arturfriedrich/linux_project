#!/bin/bash

# set OpenWeatherMap API key
API_KEY="627560b1a8d58a1751bb8b9e1ba1cc30"

# prompt user to enter a location
# read -p "Enter a location: " location

# call OpenWeatherMap API and retrieve weather data
weather_data=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=Sopron&appid=${API_KEY}")

# extract relevant weather information from JSON response using grep and cut
temperature=$(echo "$weather_data" | grep -o '"temp":[^,]*' | cut -d ":" -f 2)
description=$(echo "$weather_data" | grep -o '"description":"[^"]*"' | cut -d ":" -f 2 | tr -d '"')
humidity=$(echo "$weather_data" | grep -o '"humidity":[^,]*' | cut -d ":" -f 2)

# convert temperature from Kelvin to Celsius
temperature=$(echo "scale=2; ${temperature} - 273.15" | bc)
echo $temperature

# display weather information to user
if (( $(echo "$temperature > 1" | bc -l) )); then
  echo "Kurva hideg van bassza meg"
else
  echo "Temperature in Sopron: ${temperature} °C"
fi

echo "Description: ${description}"
echo "Humidity: ${humidity}%"