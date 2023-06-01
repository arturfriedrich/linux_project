# Terminál alapú időjárás előrejelző

Ez a projekt a Széchenyi István Egyetem Linux ismeretek (GKNB_MSTM028) tárgy beadandó feladata.

## A program célja

A program célja egy egyszerű és könnyen használható terminál alapú időjárás-előrejelző program létrehozása, amely képes helyadatok alapján megjeleníteni az aktuális és a várható időjárási adatokat. Az adatokat az OpenWeatherMap API segítségével kapja meg a felhasználó. A program lehetővé teszi további beállításokat, mint például a lokáció megváltoztatása, részletesebb adatok kijelzése, megjelenítendő napok száma és mértékegységek beállítása. A program a karakteres rajzok segítségével egyszerűbbé teszi az információk feldolgozását a felhasználó számára.

## Telepítés és használat

1. A program futtatásához használja a `./main.sh` parancsot.
2. Ha először használja a programot, meg kell adnia az API kulcsot, amelyet [itt](https://openweathermap.org/api) generálhat bejelentkezés után.
3. Adjon meg egy várost.
4. Választhat a következő lehetőségek közül: "c" - jelenlegi időjárás, "f" - 5 napos előrejelzés.

## Információk

Az alábbi képen látható, hogy az egyes információk mit jelentenek:

![Információk](https://github.com/arturfriedrich/linux_project/assets/67378210/7f0d13ef-93bb-4156-aa71-b970a1df6af8)

A programot macOS 5.2.12 verzió alatt és Linuxon 5.1.4 verzió alatt teszteltem.

## Fejlesztői dokumentáció

A fejlesztés során a programot komponensekre bontottam a jobb átláthatóság és a fejlesztés megkönnyítése érdekében. A következő fájlok tartalmazzák a különböző részegységeket:

- `main.sh`: Ez a fájl tartalmazza a főbb részeket, például az API kulcs bekérését.
- `current_weather.sh`: Ez a fájl felelős az aktuális időjárás lekérdezéséért.
- `forecast.sh`: Ez a fájl felelős az időjárás előrejelzéséért.
- `printer.sh`: Ez a fájl felelős az időjárás kijelzéséért a konzolon.

Az API kulcs bekérésének példa kódrészlete az `main.sh` fájlban található:

```bash
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
```

Ezután a program bekéri a felhasználótól a város nevét illetve a kiválasztott módot:
```bash
# Prompt user to enter a location
read -p "Enter a location: " location

# Prompt user to choose display mode: current weather (c) or forecast (f)
read -p "Do you want to display the current weather or the forecast for 5 days: (c/f) " display_mode
```

A kiválasztott módnak megfelelőn pedig kijelzi az eredményt a konzolra:
```bash
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
```

A jelenlegi időjárának (current_weather.sh) valamint az időjárás előrejelzésnek (furecast.sh) külön fájlt hoztam létre, mivel nagyban különbözik az API válasza, így egyszerűbb volt ezeket így feldolgozni.
```bash
# Call OpenWeatherMap API and retrieve weather data
weather_data=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=${location}&appid=${API_KEY}")
```

A printer.sh egyszerűen csak kijelzi a kapott értékek alapján az időjárást. Igyekeztem minél több lehetőséget megadni a rajzoknál, viszont lehetnek olyan időjárási körülmények, melyekhez nem tartozik kép, ezt később könnyen pótolni lehet.
