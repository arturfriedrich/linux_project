#!/bin/bash

source printer.sh

# Set OpenWeatherMap API key, write your own API key here
apikey=$(cat apikey.txt)
API_KEY=$apikey

# Prompt user to enter a location
read -p "Enter a location: " location

# Call OpenWeatherMap API and retrieve weather forecast data
forecast_data=$(curl -s "http://api.openweathermap.org/data/2.5/forecast?q=${location}&appid=${API_KEY}")

# Extract relevant weather information from JSON response using grep and cut
dates=$(echo "$forecast_data" | grep -o '"dt":[0-9]*' | cut -d ":" -f 2 | tr '\n' '|')
temperature=$(echo "$forecast_data" | grep -o '"temp":[^,]*' | cut -d ":" -f 2 | tr '\n' '|')
description=$(echo "$forecast_data" | grep -o '"description":"[^"]*"' | cut -d ":" -f 2 | tr -d '"' | tr '\n' '|')
humidity=$(echo "$forecast_data" | grep -o '"humidity":[^,]*' | cut -d ":" -f 2 | tr -d '}' | tr '\n' '|')
wind_speed=$(echo "$forecast_data" | grep -o '"speed":[^,]*' | cut -d ":" -f 2 | tr -d '}' | tr '\n' '|')
clouds=$(echo "$forecast_data" | grep -o '"all":[^,]*' | cut -d ":" -f 2 | tr -d '}' | tr '\n' '|')

# Function to convert Unix timestamp to readable date
convert_unix_to_date() {
    local timestamp=$1
    local formatted_date=$(date -r "$timestamp" +"%Y-%m-%d %H:%M:%S")
    echo "$formatted_date"
}

IFS='|' read -r -a dates_arr <<< "$dates"
IFS='|' read -r -a temperature_arr <<< "$temperature"
IFS='|' read -r -a description_arr <<< "$description"
IFS='|' read -r -a humidity_arr <<< "$humidity"
IFS='|' read -r -a wind_speed_arr <<< "$wind_speed"
IFS='|' read -r -a clouds_arr <<< "$clouds"

# Convert temperature from Kelvin to Celsius
for ((i = 0; i < ${#temperature_arr[@]}; i++)); do
    temperature_arr[i]=$(echo "scale=2; ${temperature_arr[i]} - 273.15" | bc)
done

# Convert Unix timestamps to readable date format and associate weather information with each date
for ((i = 0; i < ${#dates_arr[@]}; i++)); do
    curr_date="${dates_arr[i]}"
    curr_temp="${temperature_arr[i]}"
    curr_description="${description_arr[i]}"
    curr_humidity="${humidity_arr[i]}"
    curr_wind_speed="${wind_speed_arr[i]}"
    curr_clouds="${clouds_arr[i]}"

    if [[ $curr_date =~ ^[0-9]+$ ]]; then
        if [[ $curr_date -gt 9999999999 ]]; then
            curr_date=$(expr $curr_date / 1000)
        fi
        formatted_date=$(convert_unix_to_date "$curr_date")

    print_information "$curr_description" $curr_temp $curr_humidity, $curr_wind_speed $curr_clouds "$formatted_date"

    else
        echo "Invalid timestamp: $curr_date"
    fi
done

echo "Weather forecast for $location"