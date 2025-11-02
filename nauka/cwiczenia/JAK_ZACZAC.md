# 🚀 Jak zacząć naukę?

## 📌 Kroki startowe

### 1. Otwórz pierwsze ćwiczenie
```powershell
code nauka\cwiczenia\cwiczenie_01_zmienne.pas
```

### 2. Przeczytaj całą treść komentarza na górze pliku
- Zobacz CEL
- Przeczytaj ZADANIE
- Sprawdź WSKAZÓWKI

### 3. Odkomentuj kod i uzupełnij
Znajdź linie z `// TODO:` i:
1. Usuń `//` z początku linii
2. Uzupełnij brakujące części (tam gdzie są komentarze)

### 4. Kompiluj i testuj
```powershell
cd nauka\cwiczenia
fpc -Mdelphi cwiczenie_01_zmienne.pas
.\cwiczenie_01_zmienne.exe
```

### 5. Zapisz postęp w Git
```powershell
git add cwiczenie_01_zmienne.pas
git commit -m "Ukończono ćwiczenie 1: Zmienne i typy danych"
```

### 6. Zaznacz w README.md
Otwórz `nauka\cwiczenia\README.md` i zmień:
```markdown
- [ ] `cwiczenie_01_zmienne.pas` - Deklaracje i typy danych
```
na:
```markdown
- [x] `cwiczenie_01_zmienne.pas` - Deklaracje i typy danych ✅
```

---

## 📚 Harmonogram nauki (proponowany)

### **Tydzień 1** (Dzień 1-7)
| Dzień | Ćwiczenia | Czas | Co robisz? |
|-------|-----------|------|------------|
| 1 | Ćw. 1-2 | 2h | Zmienne, operatory |
| 2 | Ćw. 3-4 | 2h | If/case, pętle |
| 3 | Ćw. 5-6 | 2h | Tablice, stringi |
| 4 | Powtórka | 1h | Przejrzyj kod z dni 1-3 |
| 5 | Ćw. 7-8 | 2h | Procedury, parametry |
| 6 | Ćw. 9 | 1h | Zasięg zmiennych |
| 7 | Ćw. 10 | 3h | **MINI PROJEKT** 🎯 |

**Po tygodniu 1:** Będziesz potrafił pisać programy konsolowe z funkcjami!

### **Tydzień 2** (Dzień 8-14)
Przejdź do ćwiczeń 11-17 (rekordy, pliki, wyjątki)

---

## 💡 Wskazówki dla efektywnej nauki

### ✅ DOBRZE
- Najpierw próbuj sam
- Kompiluj po każdej małej zmianie
- Testuj różne przypadki (też błędne dane!)
- Commituj po każdym ukończonym ćwiczeniu
- Rób notatki gdy coś cię zaskoczy

### ❌ UNIKAJ
- Kopiowania kodu bez zrozumienia
- Zaglądania do rozwiązań od razu
- Robienia wszystkich ćwiczeń na raz
- Pomijania testowania programu

---

## 🆘 Co zrobić gdy utkniesz?

### Poziom 1: Wskazówki w pliku
Przeczytaj sekcję `WSKAZÓWKI:` w komentarzu na górze pliku

### Poziom 2: PASCAL_OD_PODSTAW.md
```powershell
code nauka\PASCAL_OD_PODSTAW.md
```
Znajdź odpowiedni rozdział (Ctrl+F)

### Poziom 3: Przykład z projekty/
Sprawdź `projekty\Kalkulator.pas` - działający kod

### Poziom 4: Rozwiązanie
```powershell
code nauka\cwiczenia\ROZWIAZANIA_1-2.md
```

---

## 📊 Śledzenie postępu

### W terminalu:
```powershell
# Ile ćwiczeń ukończone?
git log --oneline --grep="Ukończono ćwiczenie"

# Ostatnie zmiany
git log -5 --oneline
```

### W pliku README.md:
Otwórz `nauka\cwiczenia\README.md` i zobacz swoje checkboxy

---

## 🎯 Cel tygodnia 1-2

Po ukończeniu ćwiczeń 1-10 będziesz potrafił:
- ✅ Deklarować zmienne wszystkich podstawowych typów
- ✅ Używać operatorów arytmetycznych i logicznych
- ✅ Tworzyć warunki (if, case)
- ✅ Pisać pętle (for, while, repeat)
- ✅ Pracować z tablicami
- ✅ Manipulować stringami
- ✅ Tworzyć procedury i funkcje
- ✅ Rozumieć parametry (value, var, const, out)
- ✅ Znać zasięg zmiennych
- ✅ **Napisać działający kalkulator z menu i historią!** 🏆

---

## 🚀 Zacznij TERAZ!

```powershell
# Otwórz pierwsze ćwiczenie
code nauka\cwiczenia\cwiczenie_01_zmienne.pas

# Otwórz terminal w VS Code (Ctrl+`)
# Kompiluj gdy będziesz gotowy:
cd nauka\cwiczenia
fpc -Mdelphi cwiczenie_01_zmienne.pas
```

**Powodzenia! 💪 Pamiętaj: praktyka czyni mistrza!**
