# Terminál alapú időjárás előrejelző

Ez a projekt a Széchenyi István Egyetem Linux ismeretek (GKNB_MSTM028) tárgyra készült beadandó feladatom.

A feladat célja egy egyszerű feladatot vagy problémát megoldó linux alapú program írása, amivel elsajátíthatjuk a shell programozás, valamint a linux operációs rendszer alapjait.

## A program célja

Egy olyan egyszerű és könnyen használható terminál alapú időjárás-előrejelző program létrehozása, ami képes helyadatok segítségével kijelezni az aktuális és a várható időjárási adatokat. Az adatokat az OpenWeatherMap API segítségével kapja meg felhasználó. Kapcsolók segítségével további beállítások érhetőek el, mint például a lokáció megváltoztatása, részletesebb adatok kijelzése, megjelenítendő napok száma, mértékegységek. Az adatok mellett karakteres rajzok segítik az információk egyszerűbb feldolgozását a felhasználó számára.

## Felhasználói dokumentáció

### Telepítés és használat
1. a programot a ./main.sh parancs segítségével futtathatja
2. amennyiben először használja a programot, meg kell adnia az API kulcsát, amit a [ezen](https://openweathermap.org/api) az oldalon tud generálni bejelentkezés után
3. adjon meg egy várost
4. két lehetőségből választhat: c - jelenlegi időjárás, f - 5 napos előrejelzés

### Információk
A képen látható, hogy melyik információ mit reprezentál:

<img width="600" alt="image" src="https://github.com/arturfriedrich/linux_project/assets/67378210/7f0d13ef-93bb-4156-aa71-b970a1df6af8">

A programot macOS alatt az 5.2.12 verzió alatt teszteltem, linuxon pedig az 5.1.4

## Fejlesztői dokumentáció

A fejlesztés során a cél a komponensekre bontás volt, a jobb átláthatóság és a fejlesztés könnyítésének érdekében, ezért a legtöbb részegységet egy-egy külön fájlba helyeztem.

![image](https://github.com/arturfriedrich/linux_project/assets/67378210/96d212d3-1d67-4f14-9f80-a18b5e1161f2)

A main.sh alapvetően csak a legfontosabb részeknek ad helyet, például az API kulcs bekérésének:
```bash
# Check if the apikey file already exists
if [[ ! -e $api_key_file ]]; then
    # Prompt the user to enter an API key
    read -p "Enter your API key: " api_key

    # Write the API key to the file
    echo "$api_key" > "$api_key_file"

    echo "API key has been saved to $api_key_file."
fi
```
