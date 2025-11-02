# 🤝 Przewodnik dla kontrybutorów

Dziękujemy za zainteresowanie projektem Delphi_Kalkulator! 

## 📋 Jak wnieść wkład

### 1. Fork i clone
```bash
# Fork repozytorium na GitHubie (przycisk "Fork")

# Sklonuj swój fork
git clone https://github.com/TWOJ-USERNAME/Delphi_Kalkulator.git
cd Delphi_Kalkulator

# Dodaj upstream
git remote add upstream https://github.com/TomaszPielecki/Delphi_Kalkulator.git
```

### 2. Utwórz branch
```bash
git checkout -b feature/nazwa-funkcji
# lub
git checkout -b fix/nazwa-poprawki
```

### 3. Wprowadź zmiany

**Standardy kodowania:**
- Używaj 2 spacji do indentacji
- Nazwy zmiennych w camelCase (np. `mojaZmienna`)
- Nazwy typów z prefiksem T (np. `TOsoba`)
- Komentarze po polsku lub angielsku
- Procedury/funkcje z opisem w komentarzu

**Przykład:**
```pascal
// Oblicza sumę dwóch liczb
// @param a - pierwsza liczba
// @param b - druga liczba
// @return suma a + b
function Dodaj(a, b: Integer): Integer;
begin
  Result := a + b;
end;
```

### 4. Testuj kod
```bash
# Skompiluj
fpc -Mdelphi -O2 Kalkulator.pas

# Uruchom i przetestuj
.\Kalkulator.exe

# Sprawdź czy nie ma błędów kompilacji
fpc -Mdelphi -Criot Kalkulator.pas
```

### 5. Commit i push
```bash
git add .
git commit -m "Dodano funkcję XYZ"
git push origin feature/nazwa-funkcji
```

### 6. Pull Request
1. Idź na GitHub do swojego forka
2. Kliknij "Compare & pull request"
3. Opisz zmiany szczegółowo
4. Poczekaj na review

## 🐛 Zgłaszanie błędów

Używaj [GitHub Issues](https://github.com/TomaszPielecki/Delphi_Kalkulator/issues).

**Szablon zgłoszenia:**
```markdown
### Opis błędu
Krótki opis co jest nie tak.

### Jak odtworzyć
1. Krok 1
2. Krok 2
3. ...

### Oczekiwane zachowanie
Co powinno się stać.

### Aktualne zachowanie
Co się dzieje.

### Środowisko
- OS: Windows 10
- Kompilator: FPC 3.2.2
- Wersja projektu: 1.0
```

## 💡 Propozycje funkcjonalności

Otwórz [Issue](https://github.com/TomaszPielecki/Delphi_Kalkulator/issues) z tagiem `enhancement`.

## 📝 Dokumentacja

Przy dodawaniu nowych funkcji, aktualizuj:
- `README.md` - główna dokumentacja
- Komentarze w kodzie
- `nauka/PASCAL_OD_PODSTAW.md` - jeśli dodajesz nowe koncepcje

## ✅ Checklist przed PR

- [ ] Kod kompiluje się bez błędów
- [ ] Kod działa poprawnie
- [ ] Dodano komentarze
- [ ] Zaktualizowano dokumentację (jeśli potrzebne)
- [ ] Commit messages są opisowe

## 🎯 Priorytety rozwoju

### High priority:
- Obsługa wyrażeń algebraicznych
- Więcej funkcji matematycznych
- Testy jednostkowe

### Medium priority:
- GUI (VCL/FMX)
- Zapis historii do pliku
- Tryb programisty

### Low priority:
- Konwersja jednostek
- Motywy kolorystyczne
- Plugin system

## 📧 Kontakt

Pytania? Napisz issue lub kontakt przez GitHub.

---

**Dziękujemy za każdy wkład! 🙏**
