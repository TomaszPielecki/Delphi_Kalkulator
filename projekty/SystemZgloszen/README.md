# 🛒 System Zgłoszeń Zakupowych - Firma Mielewczyk

## 📋 Opis projektu

System do zarządzania zgłoszeniami zakupowymi dla firm produkcyjnych (branża drobiarska).

**Przykład:** Firma Mielewczyk (Gowino koło Kartuz) - produkcja drobiarska.

### Funkcjonalności:
- ✅ Zgłaszanie potrzeb zakupowych przez pracowników (krzesła, buty, laptop, długopisy, itp.)
- ✅ Przypisanie zgłoszenia do działu (Produkcja, Magazyn, Jakość, IT, Administracja)
- ✅ Zakupowiec widzi wszystkie zgłoszenia
- ✅ Zmiana statusu: Przyjęte → W realizacji → Zamówione → Dostarczone
- ✅ Powiadomienia email (opcjonalne)
- ✅ Historia zamówień
- ✅ Baza danych SQLite w sieci lokalnej (LAN)
- ✅ **GUI wizualne** (Lazarus LCL) - NIE konsola!
- ✅ System logowania użytkowników (konta dla działów)

## 🗄️ Struktura bazy danych

### Tabela: `uzytkownicy`
```sql
CREATE TABLE uzytkownicy (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    login TEXT UNIQUE NOT NULL,
    haslo TEXT NOT NULL,  -- w produkcji: zahashowane!
    imie_nazwisko TEXT NOT NULL,
    dzial TEXT NOT NULL,  -- Produkcja, Magazyn, Jakość, IT, Administracja, Zakupy
    email TEXT,
    rola TEXT CHECK(rola IN ('Pracownik', 'Zakupowiec', 'Admin')),
    aktywny INTEGER DEFAULT 1
);
```

### Tabela: `zgloszenia`
```sql
CREATE TABLE zgloszenia (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    numer_zgloszenia TEXT UNIQUE NOT NULL,
    uzytkownik_id INTEGER NOT NULL,
    dzial TEXT NOT NULL,
    nazwa_artykulu TEXT NOT NULL,
    ilosc INTEGER DEFAULT 1,
    opis TEXT,
    link_allegro TEXT,
    cena_szacunkowa REAL,
    priorytet TEXT CHECK(priorytet IN ('Niski', 'Normalny', 'Pilne', 'Bardzo pilne')),
    status TEXT CHECK(status IN ('Nowe', 'Przyjęte', 'W realizacji', 'Zamówione', 'Dostarczone', 'Anulowane')),
    data_zgloszenia TEXT NOT NULL,
    data_modyfikacji TEXT,
    zakupowiec_id INTEGER,
    uwagi_zakupowca TEXT,
    FOREIGN KEY (uzytkownik_id) REFERENCES uzytkownicy(id),
    FOREIGN KEY (zakupowiec_id) REFERENCES uzytkownicy(id)
);
```

### Tabela: `historia`
```sql
CREATE TABLE historia (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    zgloszenie_id INTEGER NOT NULL,
    data_zmiany TEXT NOT NULL,
    opis_zmiany TEXT NOT NULL,
    uzytkownik TEXT,
    FOREIGN KEY (zgloszenie_id) REFERENCES zgloszenia(id)
);
```

## 🚀 Jak uruchomić?

### Opcja A: Wersja konsolowa (obecna - do nauki)
```powershell
cd projekty\SystemZgloszen
fpc -Mdelphi SystemZgloszen.pas
.\SystemZgloszen.exe
```

### Opcja B: Wersja GUI (Lazarus - ZALECANA dla firmy!)

**Krok 1:** Otwórz Lazarus IDE
```powershell
# Uruchom Lazarus
C:\lazarus\lazarus.exe
```

**Krok 2:** Utwórz nowy projekt
- `Project` → `New Project` → `Application`
- Zapisz jako `SystemZgloszenGUI.lpi` w folderze `projekty\SystemZgloszen\`

**Krok 3:** Dodaj formularze:
- Formularz logowania
- Formularz główny z listą zgłoszeń
- Formularz nowego zgłoszenia

**Krok 4:** Skompiluj (F9) i uruchom!

### 3. Konfiguracja sieciowa:

**Na serwerze/komputerze głównym:**
```
Utwórz folder udostępniony:
\\SERWER\Firma\Zgloszenia\
Skopiuj: zgloszenia.db
```

**W programie (config.ini):**
```ini
[Database]
Path=\\SERWER\Firma\Zgloszenia\zgloszenia.db

[Email]
EnableNotifications=true
SMTPServer=smtp.firma.pl
SMTPPort=587
```

### 4. Instalacja na stanowiskach:
```
Skopiuj SystemZgloszen.exe na każdy komputer
lub
Utwórz skrót w folderze startowym Windows
```

## 📁 Struktura projektu

```
SystemZgloszen/
├── README.md                    # Ten plik
├── SystemZgloszen.pas          # Wersja konsolowa (do nauki)
├── SystemZgloszenGUI.lpr       # Wersja GUI (Lazarus) - DO UTWORZENIA
├── forms/                       # Formularze GUI (Lazarus)
│   ├── uFormLogin.pas          # Ekran logowania
│   ├── uFormMain.pas           # Główne okno aplikacji
│   ├── uFormNowe.pas           # Nowe zgłoszenie
│   └── uFormSzczegoly.pas      # Szczegóły zgłoszenia
├── units/                       # Moduły pomocnicze
│   ├── uDatabase.pas           # Obsługa bazy danych
│   ├── uTypes.pas              # Typy rekordów
│   └── uAuth.pas               # Autoryzacja użytkowników
├── sqlite/                      # Biblioteka SQLite
│   ├── sqlite3.pas             # Wrapper Pascal dla SQLite
│   └── sqlite3.dll             # Biblioteka SQLite (Windows)
├── config.ini                   # Konfiguracja (ścieżka do bazy)
├── zgloszenia.db               # Baza danych (na serwerze!)
└── dane_testowe.sql            # Przykładowe dane
```

## 🎯 Interfejs użytkownika

### Ekran logowania:
```
┌─────────────────────────────────┐
│   SYSTEM ZGŁOSZEŃ ZAKUPOWYCH   │
│        Firma Mielewczyk         │
├─────────────────────────────────┤
│ Login: [__________________]     │
│ Hasło: [__________________]     │
│                                 │
│        [ ZALOGUJ ]              │
└─────────────────────────────────┘
```

### Widok dla PRACOWNIKA:
- 📝 **Nowe zgłoszenie** (przycisk)
- 📋 **Moje zgłoszenia** (lista)
- 🔍 **Wyszukaj**
- 👤 **Profil**

### Widok dla ZAKUPOWCY:
- 📬 **Nowe zgłoszenia** (lista oczekujących)
- 🛒 **W realizacji** (lista aktywnych)
- ✅ **Zrealizowane** (historia)
- 📊 **Statystyki**
- 🔍 **Wyszukaj**

## 💡 Przykład użycia - Firma Mielewczyk

### Scenariusz 1: Magazynier potrzebuje buty robocze
```
[Jan z Magazynu loguje się]
Login: jan.kowalski
Hasło: ****

[Klika "Nowe zgłoszenie"]
Dział: Magazyn
Artykuł: Buty robocze S3
Ilość: 2 pary
Opis: Rozmiar 43 i 44, czarne, z podnoskiem stalowym
Link: https://allegro.pl/oferta/buty-robocze-s3-12345
Cena: ~150 zł/para
Priorytet: Normalny

[Klika "Wyślij"]
Status: Nowe
```

### Scenariusz 2: Zakupowiec przyjmuje zamówienie
```
[Pani Ania (zakupowiec) loguje się]
Login: anna.zakupy
Hasło: ****

[Widzi nowe zgłoszenie ZGL-2025-042]
Kliknij "Przyjmij" → Status zmienia się na "Przyjęte"
Dodaje uwagę: "Zamówię dzisiaj po południu"

[Po złożeniu zamówienia na Allegro]
Zmienia status: "Zamówione"
Uwaga: "Nr zamówienia Allegro: 987654, dostawa 2 dni"
```

### Scenariusz 3: Dział Jakości potrzebuje długopisy
```
Artykuł: Długopisy niebieskie
Ilość: 50 szt
Opis: Do protokołów jakości
Priorytet: Niski
```

## 📊 Statusy zgłoszeń zakupowych

- **Nowe** 🆕 - Zgłoszenie czeka na akceptację zakupowcy
- **Przyjęte** ✅ - Zakupowiec zaakceptował zgłoszenie
- **W realizacji** 🛒 - Zakupowiec szuka dostawcy/porównuje ceny
- **Zamówione** 📦 - Zamówienie złożone (np. Allegro)
- **Dostarczone** ✔️ - Towar dostarczony do firmy
- **Anulowane** ❌ - Zgłoszenie odrzucone (z uzasadnieniem)

## 🎨 Priorytety zakupów

- **Niski** 🟢 - Można zrealizować w ciągu 2 tygodni (np. długopisy)
- **Normalny** 🟡 - Do realizacji w ciągu tygodnia (np. krzesło biurowe)
- **Pilne** 🟠 - Do realizacji w 2-3 dni (np. buty robocze)
- **Bardzo pilne** 🔴 - Natychmiast! (np. laptop dla IT, część do maszyny produkcyjnej)

## 🔧 Wymagania

- Free Pascal Compiler 3.2.2+
- SQLite3 (biblioteka dołączona)
- Windows/Linux/macOS

## 📝 TODO - Możliwe rozszerzenia

- [ ] Eksport do CSV/PDF
- [ ] GUI w Lazaruse (LCL)
- [ ] Przypisywanie zgłoszeń do techników
- [ ] System powiadomień email
- [ ] Komentarze do zgłoszeń
- [ ] Załączniki (zdjęcia)
- [ ] Dashboard z wykresami

## 📚 Użyte technologie

- **Pascal/Delphi** - Język programowania
- **SQLite3** - Baza danych
- **Free Pascal** - Kompilator

---

**Autor:** Tomasz Pielecki  
**Data:** 3 listopada 2025  
**Licencja:** MIT
