# 🎓 Rozwiązania Ćwiczeń - Tydzień 1-2

## ⚠️ WAŻNE!
**Nie zaglądaj do rozwiązań zanim sam nie spróbujesz!**

Proces nauki:
1. ✅ Przeczytaj cel ćwiczenia
2. ✅ Spróbuj samodzielnie
3. ✅ Sprawdź kompilację: `fpc -Mdelphi nazwapliku.pas`
4. ✅ Testuj program
5. ❓ Jeśli utkniesz - przeczytaj wskazówki w pliku .pas
6. 🔓 Ostatnia deska ratunku - sprawdź rozwiązanie poniżej

---

## Ćwiczenie 1: Zmienne i typy danych

### Rozwiązanie kompletne:

```pascal
var
  imie: String;
  wiek: Integer;
  wzrost: Real;
  lubeProgramowac: Boolean;

begin
  imie := 'Tomasz';
  wiek := 25;
  wzrost := 180.5;
  lubeProgramowac := True;
  
  WriteLn('Imię: ', imie);
  WriteLn('Wiek: ', wiek, ' lat');
  WriteLn('Wzrost: ', wzrost:0:1, ' cm');
  WriteLn('Lubię programować: ', lubeProgramowac);
end.
```

### Kluczowe punkty:
- `:=` operator przypisania (nie `=`)
- `wzrost:0:1` formatowanie: szerokość 0 (automatyczna), 1 miejsce po przecinku
- Boolean wyświetla się jako TRUE/FALSE

---

## Ćwiczenie 2: Operatory

### Rozwiązanie kompletne:

```pascal
var
  a, b: Integer;
  wynikDzielenia: Real;

begin
  Write('Podaj pierwszą liczbę: ');
  ReadLn(a);
  Write('Podaj drugą liczbę: ');
  ReadLn(b);
  
  WriteLn(a, ' + ', b, ' = ', a + b);
  WriteLn(a, ' - ', b, ' = ', a - b);
  WriteLn(a, ' * ', b, ' = ', a * b);
  
  wynikDzielenia := a / b;
  WriteLn(a, ' / ', b, ' = ', wynikDzielenia:0:2);
  
  WriteLn(a, ' div ', b, ' = ', a div b);
  WriteLn(a, ' mod ', b, ' = ', a mod b);
  WriteLn('Czy ', a, ' > ', b, '? ', a > b);
end.
```

### Kluczowe punkty:
- `/` zwraca Real (3.33)
- `div` zwraca Integer (3)
- `mod` zwraca resztę (1)
- Operatory porównania zwracają Boolean

---

## Ćwiczenie 3: If i Case

### Rozwiązanie kompletne:

```pascal
case ocena of
  1: opisOceny := 'niedostateczny';
  2: opisOceny := 'dopuszczający';
  3: opisOceny := 'dostateczny';
  4: opisOceny := 'dobry';
  5: opisOceny := 'bardzo dobry';
  6: opisOceny := 'celujący';
else
  opisOceny := 'nieprawidłowa ocena';
end;

WriteLn('Ocena: ', opisOceny);

if ocena >= 2 then
  WriteLn('Status: To jest ocena pozytywna! ✓')
else
  WriteLn('Status: Niestety, to ocena negatywna ✗');
```

### Kluczowe punkty:
- `case` dla wielu konkretnych wartości
- `else` w case - opcjonalna klauzula domyślna
- `if-then-else` dla warunków logicznych

---

## Ćwiczenie 4: Pętle

### Rozwiązanie kompletne:

```pascal
// FOR
for i := 1 to 10 do
begin
  WriteLn('5 x ', i, ' = ', 5 * i);
end;

// WHILE
suma := 0;
i := 1;
while i <= 10 do
begin
  suma := suma + i;
  Inc(i);
end;
WriteLn('Suma = ', suma);

// REPEAT-UNTIL
suma := 0;
repeat
  Write('Podaj liczbę: ');
  ReadLn(liczba);
  if liczba <> 0 then
    suma := suma + liczba;
until liczba = 0;
WriteLn('Suma wszystkich: ', suma);
```

### Kluczowe punkty:
- `for` - znana liczba iteracji
- `while` - warunek na początku (może się nie wykonać)
- `repeat-until` - warunek na końcu (wykona się minimum raz)
- `Inc(i)` = `i := i + 1`

---

## Ćwiczenie 5: Tablice

### Rozwiązanie kompletne:

```pascal
// Pobieranie
for i := 1 to ILE_OCEN do
begin
  Write('Podaj ocenę ', i, ': ');
  ReadLn(oceny[i]);
end;

// Wyświetlanie
Write('Oceny: ');
for i := 1 to ILE_OCEN do
begin
  Write(oceny[i]);
  if i < ILE_OCEN then
    Write(', ');
end;
WriteLn();

// Suma
suma := 0;
for i := 1 to ILE_OCEN do
  suma := suma + oceny[i];

// Średnia
srednia := suma / ILE_OCEN;
WriteLn('Średnia: ', srednia:0:2);

// Min i Max
minimum := oceny[1];
maksimum := oceny[1];
for i := 2 to ILE_OCEN do
begin
  if oceny[i] < minimum then
    minimum := oceny[i];
  if oceny[i] > maksimum then
    maksimum := oceny[i];
end;
```

### Kluczowe punkty:
- Indeksowanie od 1 (lub dowolnego)
- `array[1..5]` - rozmiar stały
- Iteracja przez `for i := 1 to ILE_OCEN`

---

## Ćwiczenie 6: String

### Rozwiązanie kompletne:

```pascal
WriteLn('Długość: ', Length(tekst), ' znaków');
WriteLn('Wielkie litery: ', UpperCase(tekst));
WriteLn('Małe litery: ', LowerCase(tekst));

pozycja := Pos('Pascal', tekst);
if pozycja > 0 then
  WriteLn('Czy zawiera "Pascal"? TAK (pozycja ', pozycja, ')')
else
  WriteLn('Czy zawiera "Pascal"? NIE');
```

### Kluczowe punkty:
- `Length(str)` - długość
- `UpperCase/LowerCase` - konwersja wielkości liter
- `Pos(szukany, gdzie)` - zwraca pozycję (1-based) lub 0

---

## Ćwiczenie 7: Procedury i funkcje

### Rozwiązanie kompletne:

```pascal
procedure WyswietlMenu;
begin
  WriteLn('=== KALKULATOR PROSTOKĄTA ===');
  WriteLn('1. Oblicz pole');
  WriteLn('2. Oblicz obwód');
  Write('Wybór: ');
end;

function PoleProstokata(a, b: Integer): Integer;
begin
  Result := a * b;
end;

function ObwodProstokata(a, b: Integer): Integer;
begin
  Result := 2 * (a + b);
end;

procedure WyswietlWynik(nazwa: String; wartosc: Integer; jednostka: String);
begin
  WriteLn();
  WriteLn('==================');
  WriteLn(nazwa, ' = ', wartosc, ' ', jednostka);
  WriteLn('==================');
end;

// Wywołania
WyswietlMenu;
ReadLn(wybor);

case wybor of
  1: begin
       wynik := PoleProstokata(a, b);
       WyswietlWynik('Pole', wynik, 'cm²');
     end;
  2: begin
       wynik := ObwodProstokata(a, b);
       WyswietlWynik('Obwód', wynik, 'cm');
     end;
end;
```

### Kluczowe punkty:
- `procedure` - nie zwraca wartości
- `function` - zwraca wartość przez `Result`
- Deklaracja przed `begin` głównym

---

## Ćwiczenie 8: Parametry

### Rozwiązanie kompletne:

```pascal
procedure ZamienWartosci(var a, b: Integer);
var
  temp: Integer;
begin
  temp := a;
  a := b;
  b := temp;
end;

procedure PodzielZReszta(dzielna, dzielnik: Integer; var iloraz, reszta: Integer);
begin
  iloraz := dzielna div dzielnik;
  reszta := dzielna mod dzielnik;
end;

procedure AnalizujLiczbe(liczba: Integer; var jestParzysta: Boolean; out kwadrat: Integer);
begin
  jestParzysta := (liczba mod 2 = 0);
  kwadrat := liczba * liczba;
end;
```

### Kluczowe punkty:
- **Bez modyfikatora** - kopia (zmiana nie wpływa na oryginał)
- **var** - referencja (zmiana modyfikuje oryginał, wejście/wyjście)
- **out** - tylko wyjście (nie trzeba inicjować przed wywołaniem)
- **const** - tylko odczyt (optymalizacja)

---

## Ćwiczenie 9: Zasięg zmiennych

### Rozwiązanie kompletne:

```pascal
var
  zmiennaGlobalna: Integer;
  licznik: Integer;

function PokazZakres: Integer;
var
  zmiennaLokalna: Integer;
begin
  zmiennaLokalna := 50;
  WriteLn('W funkcji (lokalna): ', zmiennaLokalna);
  Result := zmiennaLokalna;
end;

procedure InkrementujLicznik;
begin
  Inc(licznik);
  WriteLn('Wywołanie ', licznik, ': licznik = ', licznik);
end;

begin
  zmiennaGlobalna := 100;
  WriteLn('Zmienna globalna: ', zmiennaGlobalna);
  
  PokazZakres;
  
  WriteLn('Po powrocie (globalna): ', zmiennaGlobalna);
  
  licznik := 0;
  InkrementujLicznik;
  InkrementujLicznik;
  InkrementujLicznik;
end.
```

### Kluczowe punkty:
- **Globalne** - widoczne wszędzie
- **Lokalne** - tylko w procedurze/funkcji
- **Przesłanianie** - lokalna o tej samej nazwie "kryje" globalną

---

## 🏆 Ćwiczenie 10: Mini projekt - sprawdź sam!

To jest projekt podsumowujący. Spróbuj sam ukończyć przed zaglądnięciem do rozwiązania!

**Checkpoints:**
- [ ] Menu działa
- [ ] Wszystkie operacje matematyczne działają
- [ ] Historia zapisuje operacje
- [ ] Historia wyświetla 10 ostatnich operacji
- [ ] Program działa w pętli do wyboru "0"
- [ ] Obsługa dzielenia przez 0

Powodzenia! 💪
