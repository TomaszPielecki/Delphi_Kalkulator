# 🧮 Delphi Calculator - Zaawansowany Kalkulator Konsolowy

![Pascal](https://img.shields.io/badge/Pascal-Object%20Pascal-blue)
![Delphi](https://img.shields.io/badge/Delphi-Compatible-red)
![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-active-success)

Zaawansowany kalkulator konsolowy napisany w Object Pascal/Delphi z pełnym wsparciem UTF-8, historią obliczeń i wieloma funkcjami matematycznymi.

## 📋 Spis treści

- [Funkcjonalności](#-funkcjonalności)
- [Wymagania](#-wymagania)
- [Instalacja](#-instalacja)
- [Kompilacja](#-kompilacja)
- [Użycie](#-użycie)
- [Projekty w repozytorium](#-projekty-w-repozytorium)
- [Nauka Pascal/Delphi](#-nauka-pascaldelphi)
- [TODO](#-todo)
- [Licencja](#-licencja)

## ✨ Funkcjonalności

### Operacje matematyczne:
- ➕ **Dodawanie** - podstawowe operacje arytmetyczne
- ➖ **Odejmowanie** - z obsługą liczb ujemnych
- ✖️ **Mnożenie** - precyzyjne obliczenia
- ➗ **Dzielenie** - z zabezpieczeniem przed dzieleniem przez zero
- 🔢 **Potęgowanie** (x^y) - dowolne wykładniki
- √ **Pierwiastek kwadratowy** - z walidacją liczb ujemnych
- 📐 **Funkcje trygonometryczne**:
  - Sinus (stopnie)
  - Cosinus (stopnie)

### Dodatkowe funkcje:
- 📜 **Historia obliczeń** - przechowuje wszystkie wykonane operacje
- 🔄 **Menu interaktywne** - intuicyjny interfejs użytkownika
- ✅ **Walidacja danych** - sprawdzanie poprawności wprowadzanych wartości
- 🛡️ **Obsługa błędów** - try/except dla stabilności
- 🌍 **Wsparcie UTF-8** - polskie znaki i emotikony

## 🔧 Wymagania

### Kompilacja i uruchomienie:
- **Free Pascal Compiler 3.2.2+** lub **Delphi/RAD Studio**
- System operacyjny: **Windows** (7/8/10/11)
- Terminal z obsługą UTF-8 (PowerShell, Windows Terminal)

### Zalecane środowisko deweloperskie:
- **Visual Studio Code** z rozszerzeniami:
  - Pascal Language Support
  - Delphi Extension Pack
  - FreePascal Toolkit
- **Lazarus IDE** (zawiera Free Pascal)
- **RAD Studio / Delphi Community Edition**

## 📥 Instalacja

### 1. Klonowanie repozytorium
```bash
git clone https://github.com/TomaszPielecki/Delphi_Kalkulator.git
cd Delphi_Kalkulator
```

### 2. Instalacja Free Pascal Compiler (jeśli nie masz)

**Windows:**
```bash
# Pobierz Lazarus (zawiera FPC)
# https://www.lazarus-ide.org/

# Lub użyj skryptu PowerShell (w repo)
powershell -ExecutionPolicy Bypass -File install_lazarus.ps1
```

**Weryfikacja instalacji:**
```bash
fpc -V
```

## 🔨 Kompilacja

### Metoda 1: Free Pascal Compiler (zalecane)
```bash
cd projekty
fpc -Mdelphi -O2 Kalkulator.pas
```

**Opcje kompilacji:**
- `-Mdelphi` - tryb zgodności z Delphi
- `-O2` - optymalizacja poziomu 2
- `-g` - dodaj informacje debug (opcjonalne)

### Metoda 2: Delphi Compiler (dcc32)
```bash
cd projekty
dcc32 Kalkulator.pas
```

### Metoda 3: Lazarus IDE
1. Otwórz Lazarus
2. File → Open → `projekty/Kalkulator.pas`
3. Run → Compile (Ctrl+F9)
4. Run → Run (F9)

### Metoda 4: VS Code (z Free Pascal Toolkit)
1. Otwórz folder w VS Code
2. Otwórz `Kalkulator.pas`
3. Ctrl+Shift+P → "FPC: Compile"
4. Uruchom w terminalu: `.\Kalkulator.exe`

## 🚀 Użycie

### Uruchomienie programu:
```bash
cd projekty
.\Kalkulator.exe
```

### Przykładowa sesja:
```
+======================================+
|        KALKULATOR DELPHI             |
+======================================+
| 1. [+] Dodawanie                     |
| 2. [-] Odejmowanie                   |
| 3. [*] Mnozenie                      |
| 4. [/] Dzielenie                     |
| 5. [^] Potegowanie                   |
| 6. [√] Pierwiastek kwadratowy        |
| 7. [sin] Sinus (stopnie)             |
| 8. [cos] Cosinus (stopnie)           |
| 9. [H] Historia obliczen             |
| 0. [X] Wyjscie                       |
+======================================+
Wybierz opcje (0-9): 1
Podaj pierwszą liczbę: 15
Podaj drugą liczbę: 27
✅ Wynik: 42.0000

=== HISTORIA OBLICZEN ===
1. 15.00 + 27.00 = 42.0000
```

## 📂 Projekty w repozytorium

### 1. `Kalkulator.pas` (główny projekt)
Zaawansowany kalkulator z pełną funkcjonalnością opisaną powyżej.

### 2. `HelloWorld.pas`
Prosty program demonstracyjny - nauka podstaw Pascal:
- Wyświetlanie tekstu
- Wczytywanie danych od użytkownika
- Obsługa wyjątków
- Funkcje daty/czasu

**Kompilacja:**
```bash
fpc HelloWorld.pas && HelloWorld.exe
```

### 3. `ManagerKontaktow.pas`
System zarządzania kontaktami:
- Dodawanie/usuwanie/edycja kontaktów
- Wyszukiwanie po imieniu/nazwisku
- Zapis/odczyt z pliku
- Eksport do CSV

**Kompilacja:**
```bash
fpc ManagerKontaktow.pas && ManagerKontaktow.exe
```

## 📚 Nauka Pascal/Delphi

### Materiał do nauki (w repo):
📖 **`nauka/PASCAL_OD_PODSTAW.md`** - kompleksowy przewodnik (1500+ linii):

**Zawartość:**
1. **Podstawy języka** - składnia, zmienne, typy danych
2. **Operatory** - arytmetyczne, logiczne, bitowe
3. **Instrukcje warunkowe** - if/else, case
4. **Pętle** - for, while, repeat..until
5. **Tablice** - statyczne, dynamiczne, sortowanie
6. **Procedury i funkcje** - parametry, rekurencja, overload
7. **String** - operacje na tekście, konwersje
8. **Typy zaawansowane** - rekordy, enumeracje, zbiory
9. **Wskaźniki** - podstawy, dynamiczna alokacja
10. **Pliki** - zapis, odczyt, bezpieczna obsługa
11. **Wyjątki** - try..except, try..finally
12. **OOP** - klasy, dziedziczenie, properties

**Plan nauki (8 tygodni):**
- Tydzień 1-2: Podstawy + prosty kalkulator
- Tydzień 3-4: Funkcje + kalkulator zaawansowany
- Tydzień 5-6: Zaawansowane typy + manager kontaktów
- Tydzień 7-8: OOP + system biblioteki

### Przydatne linki:
- [Free Pascal Documentation](https://www.freepascal.org/docs.html)
- [Delphi Documentation](https://docwiki.embarcadero.com/)
- [Learn Pascal Tutorial](https://www.tutorialspoint.com/pascal/index.htm)
- [Stack Overflow - Delphi Tag](https://stackoverflow.com/questions/tagged/delphi)

## 🎯 TODO

### Wersja 2.0 (planowane):
- [ ] Dodać więcej funkcji matematycznych (log, exp, tan)
- [ ] Obsługa wyrażeń algebraicznych (np. "2+3*4")
- [ ] Zapis historii do pliku
- [ ] Tryb naukowy z dodatkowymi funkcjami
- [ ] Konwersja jednostek (temperatura, długość, waga)
- [ ] Obsługa liczb binarnych/hex
- [ ] Tryb programisty (operacje bitowe na większych liczbach)
- [ ] Interfejs GUI (VCL/FireMonkey)
- [ ] Testy jednostkowe
- [ ] CI/CD pipeline

### Inne projekty w roadmap:
- [ ] Manager Kontaktów z bazą danych (SQLite)
- [ ] Aplikacja TODO z GUI
- [ ] Prosta gra konsolowa
- [ ] HTTP Client/REST API consumer

## 🛠️ Rozwój projektu

### Struktura projektu:
```
Delphi_Kalkulator/
├── projekty/
│   ├── Kalkulator.pas          # Główny kalkulator
│   ├── HelloWorld.pas          # Hello World demo
│   ├── ManagerKontaktow.pas    # Manager kontaktów
│   └── *.exe                   # Skompilowane pliki
├── nauka/
│   └── PASCAL_OD_PODSTAW.md    # Materiały do nauki
├── check_environment.ps1        # Skrypt sprawdzający środowisko
├── install_lazarus.ps1         # Skrypt instalacji Lazarus
├── INSTALACJA.md               # Instrukcje instalacji
├── VS_CODE_DELPHI.md          # Guide do VS Code
└── README.md                   # Ten plik
```

### Jak wnieść wkład (Contributing):
1. Fork projektu
2. Stwórz branch (`git checkout -b feature/NowaFunkcjonalnosc`)
3. Commit zmian (`git commit -m 'Dodano nową funkcję'`)
4. Push do brancha (`git push origin feature/NowaFunkcjonalnosc`)
5. Otwórz Pull Request

### Zgłaszanie błędów:
Użyj [Issues](https://github.com/TomaszPielecki/Delphi_Kalkulator/issues) na GitHubie.

## 📝 Licencja

Ten projekt jest udostępniony na licencji MIT - szczegóły w pliku [LICENSE](LICENSE).

## 👤 Autor

**Tomasz Pielecki**
- GitHub: [@TomaszPielecki](https://github.com/TomaszPielecki)

## 🙏 Podziękowania

- **Free Pascal Team** - za świetny kompilator
- **Embarcadero** - za Delphi i Object Pascal
- **Lazarus Team** - za IDE
- Społeczność Pascal/Delphi za wsparcie i zasoby

---

⭐ **Jeśli projekt Ci się podoba, zostaw gwiazdkę!** ⭐
