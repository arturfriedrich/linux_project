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

<img width="600" alt="image" src="https://github.com/arturfriedrich/linux_project/assets/67378210/7f0d13ef-93bb-4156-aa71-b970a1df6af8">



macos - bash 5.2.12
linux - 5.1.4
