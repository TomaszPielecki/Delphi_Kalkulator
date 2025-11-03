# 🎯 PLAN IMPLEMENTACJI - System Zakupowy Firma Mielewczyk

## 📌 Odpowiedzi na Twoje pytania:

### 1. **Czy trzeba robić konta użytkowników?**
✅ **TAK** - Każdy pracownik ma swoje konto:
- Login (np. `jan.kowalski`)
- Hasło
- Przypisanie do działu (Magazyn, Produkcja, Jakość, IT, Zakupy)
- Rola (Pracownik lub Zakupowiec)

**Dlaczego?** Bo trzeba wiedzieć kto zgłosił zamówienie!

### 2. **Jak to działa w sieci?**
✅ **Tak, widzą się w sieci!**

```
┌─────────────────────────────────────────────────┐
│         SERWER (np. \\SERWER\Firma\)            │
│                                                 │
│  zgloszenia.db ← JEDNA BAZA DANYCH DLA WSZYSTKICH│
└────────────────┬────────────────────────────────┘
                 │
        ┌────────┴──────────┐
        │                   │
┌───────▼────────┐  ┌───────▼────────┐
│ Komputer 1     │  │ Komputer 2     │
│ (Jan-Magazyn)  │  │ (Ania-Zakupy)  │
│                │  │                │
│ SystemZgloszen │  │ SystemZgloszen │
│     .exe       │  │     .exe       │
└────────────────┘  └────────────────┘
```

**Co się dzieje:**
1. Jan na komputerze 1 tworzy zgłoszenie → zapisuje do `\\SERWER\Firma\zgloszenia.db`
2. Ania na komputerze 2 odświeża listę → czyta z `\\SERWER\Firma\zgloszenia.db`
3. **Widzą te same dane!**

### 3. **Plik EXE - jak zainstalować?**
✅ **Bardzo prosto:**

```powershell
# Krok 1: Skompiluj program
fpc SystemZgloszen.pas

# Krok 2: Skopiuj na każdy komputer
copy SystemZgloszen.exe \\Komputer1\C$\Programy\
copy SystemZgloszen.exe \\Komputer2\C$\Programy\
# itd.

# Krok 3: Utwórz skrót na pulpicie każdego komputera
```

**WAŻNE:** Wszystkie komputery muszą mieć dostęp do tego samego folderu sieciowego!

### 4. **Szata graficzna - konsola czy GUI?**

#### ❌ **KONSOLA (CMD/PowerShell)** - NIE POLECAM dla firmy!
```
=== SYSTEM ZGŁOSZEŃ ===
1. Nowe zgłoszenie
2. Lista
Wybór: _
```
**Wady:** Brzydka, trudna w obsłudze, nie intuicyjna

#### ✅ **GUI (Lazarus)** - ZDECYDOWANIE TAK!
```
┌──────────────────────────────────────┐
│  System Zgłoszeń - Firma Mielewczyk  │
├──────────────────────────────────────┤
│  [+] Nowe   [Odśwież]   [Wyjście]   │
├──────────────────────────────────────┤
│ Nr     │ Artykuł  │ Dział  │ Status │
│ ZGL-01 │ Buty S3  │Magazyn │Nowe    │
│ ZGL-02 │ Laptop   │IT      │W real. │
└──────────────────────────────────────┘
```
**Zalety:** Ładna, intuicyjna, łatwa w obsłudze, przyciski, tabele!

---

## 🚀 ETAPY IMPLEMENTACJI

### **ETAP 1: Wersja konsolowa (do nauki)** ✅ GOTOWE
```
SystemZgloszen.pas - wersja tekstowa
```
**Czas:** Już jest! Możesz testować podstawy.

---

### **ETAP 2: GUI w Lazarus (ZALECANE)** 🎯 DO ZROBIENIA

#### Krok 1: Instalacja Lazarus (jeśli jeszcze nie masz)
```powershell
# Już masz! Sprawdź:
C:\lazarus\lazarus.exe
```

#### Krok 2: Utwórz projekt GUI

**A) Otwórz Lazarus:**
```powershell
cd C:\lazarus
.\lazarus.exe
```

**B) Nowy projekt:**
1. `Project` → `New Project` → `Application`
2. Zapisz jako: `SystemZgloszenGUI.lpi` w `projekty\SystemZgloszen\`

**C) Dodaj formularze:**

##### **Formularz 1: Logowanie** (`uFormLogin.pas`)
```
Komponenty:
- TEdit (login)
- TEdit (hasło, PasswordChar='*')
- TButton (Zaloguj)
- TLabel (komunikaty)
```

##### **Formularz 2: Główne okno** (`uFormMain.pas`)
```
Komponenty:
- TListView (lista zgłoszeń)
- TButton (Nowe zgłoszenie)
- TButton (Odśwież)
- TButton (Szczegóły)
- TStatusBar (zalogowany użytkownik)
```

##### **Formularz 3: Nowe zgłoszenie** (`uFormNowe.pas`)
```
Komponenty:
- TEdit (nazwa artykułu)
- TSpinEdit (ilość)
- TMemo (opis)
- TEdit (link Allegro)
- TEdit (cena)
- TComboBox (priorytet)
- TButton (Wyślij)
- TButton (Anuluj)
```

#### Krok 3: Obsługa bazy danych

**Moduł: `uDatabase.pas`**
```pascal
unit uDatabase;

interface

uses
  SQLite3Conn, SQLDB;

type
  TDatabaseManager = class
  private
    FConnection: TSQLite3Connection;
    FTransaction: TSQLTransaction;
    FQuery: TSQLQuery;
  public
    constructor Create(const DBPath: string);
    destructor Destroy; override;
    
    // Metody
    function Login(username, password: string): Boolean;
    procedure CreateZgloszenie(...);
    function GetZgloszenia: TDataSet;
    procedure UpdateStatus(...);
  end;

implementation
// ... implementacja
end.
```

#### Krok 4: Konfiguracja sieciowa

**Plik: `config.ini`**
```ini
[Database]
Path=\\SERWER\Firma\Zgloszenia\zgloszenia.db

[Application]
Title=System Zgłoszeń Zakupowych
Company=Mielewczyk

[Network]
RefreshInterval=30  ; odświeżanie co 30 sekund
```

**W kodzie:**
```pascal
var
  IniFile: TIniFile;
  DBPath: string;
begin
  IniFile := TIniFile.Create('config.ini');
  try
    DBPath := IniFile.ReadString('Database', 'Path', 'zgloszenia.db');
  finally
    IniFile.Free;
  end;
end;
```

---

## 📊 ARCHITEKTURA ROZWIĄZANIA

```
KOMPUTER KAŻDEGO PRACOWNIKA:
┌────────────────────────────────────┐
│ SystemZgloszen.exe                 │
│  - Formularz logowania             │
│  - Główne okno                     │
│  - Formularze dodawania/edycji     │
└────────────────┬───────────────────┘
                 │ (czyta/zapisuje)
                 ▼
┌────────────────────────────────────┐
│  SERWER: \\SERWER\Firma\Zgloszenia\│
│                                    │
│  zgloszenia.db (SQLite)            │
│   - tabela: uzytkownicy            │
│   - tabela: zgloszenia             │
│   - tabela: historia               │
└────────────────────────────────────┘
```

**BEZPIECZEŃSTWO:**
- Hasła zahashowane (SHA256)
- Uprawnienia Windows do folderu sieciowego
- Backup bazy danych co tydzień

---

## 🎨 MOCKUP GUI (Lazarus)

### Ekran logowania:
```
┌──────────────────────────────────────────┐
│    [LOGO]  Firma Mielewczyk              │
│         System Zgłoszeń Zakupowych       │
├──────────────────────────────────────────┤
│                                          │
│  Login:    [_____________________]       │
│                                          │
│  Hasło:    [_____________________]       │
│                                          │
│              [ ZALOGUJ SIĘ ]             │
│                                          │
│  Status: Połączono z bazą ✓              │
└──────────────────────────────────────────┘
```

### Ekran główny (Pracownik):
```
┌──────────────────────────────────────────────────────────┐
│ System Zgłoszeń Zakupowych                               │
│ Użytkownik: Jan Kowalski (Magazyn)         [Wyloguj]    │
├──────────────────────────────────────────────────────────┤
│ [+ Nowe zgłoszenie]  [Odśwież]  [Szczegóły]             │
├──────────────────────────────────────────────────────────┤
│ Nr zgłoszenia │ Data       │ Artykuł        │ Status     │
├───────────────┼────────────┼────────────────┼───────────┤
│ ZGL-2025-001  │ 01.11.2025 │ Buty S3        │ Nowe      │
│ ZGL-2025-005  │ 03.11.2025 │ Rękawice 10par │ Przyjęte  │
│ ZGL-2025-012  │ 05.11.2025 │ Kask ochronny  │ Zamówione │
└──────────────────────────────────────────────────────────┘
│ Łącznie zgłoszeń: 3                                      │
└──────────────────────────────────────────────────────────┘
```

### Ekran główny (Zakupowiec):
```
┌──────────────────────────────────────────────────────────────────┐
│ System Zgłoszeń Zakupowych                                       │
│ Użytkownik: Anna Nowak (Zakupy)                    [Wyloguj]    │
├──────────────────────────────────────────────────────────────────┤
│ [Odśwież]  [Filtry▼]  [Raport]                                  │
├──────────────────────────────────────────────────────────────────┤
│ Nr     │ Data  │ Dział   │ Artykuł     │ Priorytet │ Status    │
├────────┼───────┼─────────┼─────────────┼───────────┼───────────┤
│ ZGL-01 │01.11  │Magazyn  │Buty S3      │Pilne      │🔴 Nowe   │
│ ZGL-03 │02.11  │Jakość   │Długopisy    │Niski      │✅ Przyjęte│
│ ZGL-07 │05.11  │IT       │Laptop Dell  │B.Pilne    │🛒 W real.│
└──────────────────────────────────────────────────────────────────┘
│ Nowe: 5 | W realizacji: 3 | Zamówione: 2                        │
└──────────────────────────────────────────────────────────────────┘
```

---

## ✅ PODSUMOWANIE ODPOWIEDZI

| Pytanie | Odpowiedź |
|---------|-----------|
| **Konta użytkowników?** | ✅ TAK - każdy pracownik ma login/hasło |
| **Widoczność w sieci?** | ✅ TAK - jedna baza na serwerze, wszyscy widzą |
| **Plik EXE na każdym PC?** | ✅ TAK - kopiujesz .exe na każdy komputer |
| **GUI czy konsola?** | ✅ GUI (Lazarus) - **ZDECYDOWANIE!** |
| **Jak zainstalować?** | Skopiuj .exe + config.ini na każdy PC |

---

## 🎯 NASTĘPNE KROKI

1. **TERAZ:** Testuj wersję konsolową (`SystemZgloszen.pas`)
2. **POTEM:** Naucz się podstaw Lazarusa (GUI)
3. **FINALNIE:** Przenieś logikę z konsoli do GUI

Powiedz mi, czy chcesz:
- A) Najpierw przetestować wersję konsolową?
- B) Od razu zacząć tworzyć GUI w Lazarus?
- C) Zobaczyć szczegółowy tutorial Lazarus?

**Polecam opcję A → potem B** (najpierw zrozum logikę, potem dodaj ładny interfejs!)
