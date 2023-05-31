#!/bin/bash

source printer.sh

# set OpenWeatherMap API key, write your own API key here
apikey=$(cat apikey.txt)
API_KEY=$apikey

# prompt user to enter a location
read -p "Enter a location: " location

# call OpenWeatherMap API and retrieve weather forecast data
forecast_data=$(curl -s "http://api.openweathermap.org/data/2.5/forecast?q=${location}&appid=${API_KEY}")

# extract relevant weather information from JSON response using grep and cut
dates=$(echo "$forecast_data" | grep -o '"dt":[0-9]*' | cut -d ":" -f 2)
temperature=$(echo "$forecast_data" | grep -o '"temp":[^,]*' | cut -d ":" -f 2)
description=$(echo "$forecast_data" | grep -o '"description":"[^"]*"' | cut -d ":" -f 2 | tr -d '"')
humidity=$(echo "$forecast_data" | grep -o '"humidity":[^,]*' | cut -d ":" -f 2 | tr -d '}')
wind_speed=$(echo "$forecast_data" | grep -o '"speed":[^,]*' | cut -d ":" -f 2)
clouds=$(echo "$forecast_data" | grep -o '"all":[^,]*' | cut -d ":" -f 2 | tr -d '}')

# Function to convert Unix timestamp to readable date
convert_unix_to_date() {
    local timestamp=$1
    local formatted_date=$(date -r "$timestamp" +"%Y-%m-%d %H:%M:%S")
    echo "$formatted_date"
}

# Convert Unix timestamps to readable date format
formatted_dates=""
for curr_date in $dates; do
    if [[ $curr_date =~ ^[0-9]+$ ]]; then
        if [[ $curr_date -gt 9999999999 ]]; then
            curr_date=$(expr $curr_date / 1000)
        fi
        formatted_date=$(convert_unix_to_date "$curr_date")
        formatted_dates+="$formatted_date "
    else
        echo "Invalid timestamp: $curr_date"
    fi
done

# convert temperature from Kelvin to Celsius
temperature=$(echo "scale=2; ${temperature} - 273.15" | bc)

echo "Weather forecast for $location"
echo "Dates: $formatted_dates"
