# Pascal/Delphi - Od Podstaw do Experta

## CZĘŚĆ 1: PODSTAWY JĘZYKA

### 1.1 Struktura programu Pascal

```pascal
program NazwaProgramu;  // Nagłówek programu

uses
  SysUtils, Math;  // Importowane jednostki (units)

var
  // Deklaracje zmiennych globalnych
  liczba: Integer;

// Procedury i funkcje

begin
  // Ciało główne programu
  WriteLn('Hello World!');
  ReadLn;
end.  // Kropka kończy program!
```

**Kluczowe elementy:**
- `program` - opcjonalny nagłówek
- `uses` - importowanie bibliotek
- `var` - deklaracja zmiennych
- `begin...end.` - ciało programu (kropka na końcu!)

---

### 1.2 Typy danych podstawowe

```pascal
var
  // LICZBY CAŁKOWITE
  b: Byte;           // 0..255
  w: Word;           // 0..65535
  i: Integer;        // -2147483648..2147483647 (32-bit)
  i64: Int64;        // 64-bit
  
  // LICZBY RZECZYWISTE
  r: Real;           // 6 bajtów
  s: Single;         // 4 bajty (32-bit float)
  d: Double;         // 8 bajtów (64-bit float)
  ext: Extended;     // 10 bajtów (najdokładniejszy)
  
  // ZNAKOWE
  c: Char;           // 1 znak
  str: String;       // Ciąg znaków (dynamiczny)
  ss: ShortString;   // 255 znaków max (legacy)
  
  // LOGICZNE
  flag: Boolean;     // True lub False
  
  // WSKAŹNIKI
  ptr: Pointer;      // Wskaźnik ogólny
  pInt: ^Integer;    // Wskaźnik na Integer
```

**Zakres typów Integer:**
- `ShortInt`: -128..127
- `SmallInt`: -32768..32767
- `LongInt` = `Integer`: -2147483648..2147483647
- `Int64`: -9223372036854775808..9223372036854775807

---

### 1.3 Zmienne - deklaracja i przypisanie

```pascal
var
  // Deklaracja pojedyncza
  wiek: Integer;
  
  // Deklaracja grupowa
  x, y, z: Double;
  
  // Z inicjalizacją (tylko zmienne globalne lub typed const)
  pi: Double = 3.14159;
  nazwa: String = 'Jan';
  
begin
  // Przypisanie
  wiek := 25;
  x := 10.5;
  y := x * 2;
  z := x + y;
  
  WriteLn('Wiek: ', wiek);
  WriteLn('X=', x:0:2, ' Y=', y:0:2, ' Z=', z:0:2);
end.
```

**UWAGA:** 
- Pascal używa `:=` do przypisania (nie `=`)
- `=` służy do porównania

---

### 1.4 Stałe (Constants)

```pascal
const
  // Stałe typowane
  MAX_SIZE = 100;
  PI = 3.14159265;
  NAZWA_FIRMY = 'Moja Firma';
  
  // Typed constants (można modyfikować w kodzie!)
  Licznik: Integer = 0;
  
var
  tablica: array[1..MAX_SIZE] of Integer;
  
begin
  WriteLn('Pi = ', PI:0:5);
  WriteLn('Max: ', MAX_SIZE);
  
  Licznik := Licznik + 1;  // Działa dla typed const
end.
```

**Różnice:**
- `const` - prawdziwe stałe (nie można zmieniać)
- `typed const` - zmienne z wartością początkową

---

### 1.5 Operatory

```pascal
var
  a, b, wynik: Integer;
  x, y: Double;
  flag: Boolean;

begin
  // ARYTMETYCZNE
  a := 10; b := 3;
  wynik := a + b;      // 13 - dodawanie
  wynik := a - b;      // 7  - odejmowanie
  wynik := a * b;      // 30 - mnożenie
  wynik := a div b;    // 3  - dzielenie całkowite
  wynik := a mod b;    // 1  - reszta z dzielenia
  
  x := 10.0; y := 3.0;
  x := x / y;          // 3.333... - dzielenie rzeczywiste
  
  // PORÓWNANIA
  flag := (a = b);     // False - równość
  flag := (a <> b);    // True  - różne
  flag := (a > b);     // True  - większe
  flag := (a < b);     // False - mniejsze
  flag := (a >= b);    // True  - większe lub równe
  flag := (a <= b);    // False - mniejsze lub równe
  
  // LOGICZNE
  flag := True and False;   // False - koniunkcja
  flag := True or False;    // True  - alternatywa
  flag := not True;         // False - negacja
  flag := True xor False;   // True  - exclusive or
  
  // BITOWE
  wynik := 5 and 3;    // 1 (101 AND 011 = 001)
  wynik := 5 or 3;     // 7 (101 OR 011 = 111)
  wynik := 5 xor 3;    // 6 (101 XOR 011 = 110)
  wynik := not 5;      // -6 (inwersja bitów)
  wynik := 5 shl 1;    // 10 (przesunięcie w lewo)
  wynik := 5 shr 1;    // 2  (przesunięcie w prawo)
end.
```

---

### 1.6 Instrukcje warunkowe - IF

```pascal
var
  wiek: Integer;
  haslo: String;

begin
  // IF prosty
  wiek := 18;
  if wiek >= 18 then
    WriteLn('Pełnoletni');
  
  // IF..ELSE
  if wiek >= 18 then
    WriteLn('Pełnoletni')
  else
    WriteLn('Niepełnoletni');
  
  // IF..ELSE IF
  if wiek < 13 then
    WriteLn('Dziecko')
  else if wiek < 18 then
    WriteLn('Nastolatek')
  else if wiek < 65 then
    WriteLn('Dorosły')
  else
    WriteLn('Senior');
  
  // IF z blokiem BEGIN..END (wiele instrukcji)
  haslo := 'admin';
  if haslo = 'admin' then
  begin
    WriteLn('Dostęp przyznany');
    WriteLn('Witaj, administratorze!');
  end
  else
  begin
    WriteLn('Błędne hasło');
    WriteLn('Spróbuj ponownie');
  end;
  
  // IF zagnieżdżony
  if wiek >= 18 then
  begin
    if haslo = 'admin' then
      WriteLn('Dostęp pełny')
    else
      WriteLn('Dostęp ograniczony');
  end;
end.
```

**UWAGA:**
- Jeśli tylko jedna instrukcja po `then`/`else` - nie trzeba `begin..end`
- Wiele instrukcji - MUSISZ użyć `begin..end`
- Średnik PRZED `else` jest BŁĘDEM!

---

### 1.7 Instrukcja CASE

```pascal
var
  dzien: Integer;
  ocena: Char;

begin
  // CASE z Integer
  dzien := 3;
  case dzien of
    1: WriteLn('Poniedziałek');
    2: WriteLn('Wtorek');
    3: WriteLn('Środa');
    4: WriteLn('Czwartek');
    5: WriteLn('Piątek');
    6, 7: WriteLn('Weekend!');  // Wiele wartości
  else
    WriteLn('Nieprawidłowy dzień');
  end;
  
  // CASE z zakresami
  case dzien of
    1..5: WriteLn('Dzień roboczy');
    6..7: WriteLn('Weekend');
  else
    WriteLn('Błąd');
  end;
  
  // CASE z Char
  ocena := 'B';
  case ocena of
    'A': WriteLn('Celujący');
    'B': WriteLn('Bardzo dobry');
    'C': WriteLn('Dobry');
    'D': WriteLn('Dostateczny');
    'E': WriteLn('Dopuszczający');
    'F': WriteLn('Niedostateczny');
  else
    WriteLn('Nieznana ocena');
  end;
  
  // CASE z blokami
  case dzien of
    1: begin
         WriteLn('Poniedziałek');
         WriteLn('Początek tygodnia');
       end;
    5: begin
         WriteLn('Piątek');
         WriteLn('Koniec tygodnia');
       end;
  end;
end.
```

---

### 1.8 Pętla FOR

```pascal
var
  i, suma: Integer;

begin
  // FOR rosnąco
  for i := 1 to 10 do
    WriteLn('i = ', i);
  
  // FOR malejąco
  for i := 10 downto 1 do
    WriteLn('i = ', i);
  
  // FOR z BEGIN..END
  suma := 0;
  for i := 1 to 100 do
  begin
    suma := suma + i;
    WriteLn('Suma po ', i, ' = ', suma);
  end;
  WriteLn('Suma 1..100 = ', suma);
  
  // FOR zagnieżdżone (tabliczka mnożenia)
  for i := 1 to 10 do
  begin
    for j := 1 to 10 do
      Write(i * j:4);  // :4 = szerokość pola
    WriteLn;
  end;
end.
```

**UWAGA:**
- Zmienna pętli (i) NIE MOŻE być modyfikowana w pętli!
- Po pętli wartość zmiennej jest niezdefiniowana

---

### 1.9 Pętla WHILE

```pascal
var
  i, suma: Integer;
  haslo: String;

begin
  // WHILE podstawowy
  i := 1;
  while i <= 10 do
  begin
    WriteLn('i = ', i);
    Inc(i);  // i := i + 1
  end;
  
  // WHILE z warunkiem logicznym
  suma := 0;
  i := 1;
  while suma < 100 do
  begin
    suma := suma + i;
    Inc(i);
  end;
  WriteLn('Suma = ', suma);
  
  // WHILE z przerwaniem (break)
  i := 1;
  while True do
  begin
    WriteLn('i = ', i);
    Inc(i);
    if i > 10 then
      Break;  // Wyjście z pętli
  end;
  
  // WHILE z continue
  i := 0;
  while i < 10 do
  begin
    Inc(i);
    if i mod 2 = 0 then
      Continue;  // Pomiń resztę, kolejna iteracja
    WriteLn('Nieparzyste: ', i);
  end;
  
  // Przykład praktyczny - powtarzaj aż poprawne
  haslo := '';
  while haslo <> 'admin' do
  begin
    Write('Podaj hasło: ');
    ReadLn(haslo);
    if haslo <> 'admin' then
      WriteLn('Błędne hasło!');
  end;
  WriteLn('Zalogowano!');
end.
```

---

### 1.10 Pętla REPEAT..UNTIL

```pascal
var
  i: Integer;
  haslo: String;

begin
  // REPEAT - wykonuje się ZAWSZE przynajmniej raz
  i := 1;
  repeat
    WriteLn('i = ', i);
    Inc(i);
  until i > 10;
  
  // Różnica vs WHILE
  i := 100;
  repeat
    WriteLn('To się wykona raz');  // Wykona się!
  until i > 10;
  
  i := 100;
  while i <= 10 do
  begin
    WriteLn('To się NIE wykona');  // Nie wykona się!
    Inc(i);
  end;
  
  // Przykład - menu
  repeat
    WriteLn('');
    WriteLn('1. Opcja A');
    WriteLn('2. Opcja B');
    WriteLn('0. Wyjście');
    Write('Wybór: ');
    ReadLn(i);
    
    case i of
      1: WriteLn('Wybrano A');
      2: WriteLn('Wybrano B');
      0: WriteLn('Do widzenia!');
    else
      WriteLn('Nieprawidłowy wybór');
    end;
  until i = 0;
end.
```

**Kiedy używać:**
- `FOR` - znana liczba iteracji
- `WHILE` - warunek sprawdzany PRZED
- `REPEAT..UNTIL` - warunek sprawdzany PO (min. 1 iteracja)

---

## CZĘŚĆ 2: TABLICE

### 2.1 Tablice statyczne

```pascal
var
  liczby: array[1..5] of Integer;
  tekst: array[0..9] of Char;
  macierz: array[1..3, 1..3] of Double;  // 2D
  i, j: Integer;

begin
  // Przypisanie
  liczby[1] := 10;
  liczby[2] := 20;
  liczby[3] := 30;
  liczby[4] := 40;
  liczby[5] := 50;
  
  // Odczyt
  WriteLn('Pierwszy: ', liczby[1]);
  WriteLn('Ostatni: ', liczby[5]);
  
  // Iteracja
  for i := 1 to 5 do
    WriteLn('liczby[', i, '] = ', liczby[i]);
  
  // Suma elementów
  suma := 0;
  for i := 1 to 5 do
    suma := suma + liczby[i];
  WriteLn('Suma: ', suma);
  
  // Tablica 2D (macierz)
  for i := 1 to 3 do
    for j := 1 to 3 do
      macierz[i,j] := i * j;
  
  // Wyświetlenie macierzy
  for i := 1 to 3 do
  begin
    for j := 1 to 3 do
      Write(macierz[i,j]:6:2);
    WriteLn;
  end;
end.
```

---

### 2.2 Tablice dynamiczne

```pascal
var
  tab: array of Integer;  // Dynamiczna
  i, n: Integer;

begin
  // Ustalenie rozmiaru
  n := 10;
  SetLength(tab, n);  // Indeksy 0..9
  
  // Wypełnienie
  for i := 0 to n-1 do
    tab[i] := i * 10;
  
  // Odczyt
  for i := 0 to High(tab) do  // High() = max indeks
    WriteLn('tab[', i, '] = ', tab[i]);
  
  // Zmiana rozmiaru
  SetLength(tab, 20);  // Teraz 0..19
  
  for i := 10 to 19 do
    tab[i] := i * 2;
  
  WriteLn('Length: ', Length(tab));  // 20
  WriteLn('High: ', High(tab));      // 19
  WriteLn('Low: ', Low(tab));        // 0
  
  // Zwalnianie pamięci
  SetLength(tab, 0);  // lub tab := nil;
end.
```

---

### 2.3 Operacje na tablicach

```pascal
uses
  SysUtils;

var
  tab: array[1..10] of Integer;
  i, min, max, suma: Integer;
  srednia: Double;

begin
  // Wypełnienie losowe
  Randomize;
  for i := 1 to 10 do
    tab[i] := Random(100);  // 0..99
  
  // Wyświetlenie
  Write('Tablica: ');
  for i := 1 to 10 do
    Write(tab[i], ' ');
  WriteLn;
  
  // Minimum
  min := tab[1];
  for i := 2 to 10 do
    if tab[i] < min then
      min := tab[i];
  WriteLn('Min: ', min);
  
  // Maximum
  max := tab[1];
  for i := 2 to 10 do
    if tab[i] > max then
      max := tab[i];
  WriteLn('Max: ', max);
  
  // Suma i średnia
  suma := 0;
  for i := 1 to 10 do
    suma := suma + tab[i];
  srednia := suma / 10;
  WriteLn('Suma: ', suma);
  WriteLn('Średnia: ', srednia:0:2);
  
  // Wyszukiwanie
  szukana := 50;
  znaleziono := False;
  for i := 1 to 10 do
    if tab[i] = szukana then
    begin
      WriteLn('Znaleziono ', szukana, ' na pozycji ', i);
      znaleziono := True;
      Break;
    end;
  if not znaleziono then
    WriteLn('Nie znaleziono');
end.
```

---

### 2.4 Sortowanie tablicy (bubble sort)

```pascal
procedure BubbleSort(var tab: array of Integer);
var
  i, j, temp, n: Integer;
begin
  n := Length(tab);
  for i := 0 to n-2 do
    for j := 0 to n-2-i do
      if tab[j] > tab[j+1] then
      begin
        // Zamiana
        temp := tab[j];
        tab[j] := tab[j+1];
        tab[j+1] := temp;
      end;
end;

var
  liczby: array of Integer;
  i: Integer;

begin
  // Inicjalizacja
  SetLength(liczby, 10);
  Randomize;
  for i := 0 to 9 do
    liczby[i] := Random(100);
  
  // Przed sortowaniem
  Write('Przed: ');
  for i := 0 to 9 do
    Write(liczby[i], ' ');
  WriteLn;
  
  // Sortowanie
  BubbleSort(liczby);
  
  // Po sortowaniu
  Write('Po: ');
  for i := 0 to 9 do
    Write(liczby[i], ' ');
  WriteLn;
end.
```

---

## CZĘŚĆ 3: PROCEDURY I FUNKCJE

### 3.1 Procedury (procedures)

```pascal
// Procedura bez parametrów
procedure Powitanie;
begin
  WriteLn('====================');
  WriteLn('  Witaj w programie!');
  WriteLn('====================');
end;

// Procedura z parametrami
procedure PowitajOsobe(imie: String; wiek: Integer);
begin
  WriteLn('Cześć, ', imie, '!');
  WriteLn('Masz ', wiek, ' lat.');
end;

// Procedura z parametrami przez referencję (var)
procedure Zamien(var a, b: Integer);
var
  temp: Integer;
begin
  temp := a;
  a := b;
  b := temp;
end;

var
  x, y: Integer;

begin
  Powitanie;
  
  PowitajOsobe('Jan', 25);
  PowitajOsobe('Anna', 30);
  
  x := 10;
  y := 20;
  WriteLn('Przed: x=', x, ' y=', y);
  Zamien(x, y);
  WriteLn('Po: x=', x, ' y=', y);  // x=20 y=10
end.
```

**Parametry:**
- Bez `var` - przekazanie przez WARTOŚĆ (kopia)
- Z `var` - przekazanie przez REFERENCJĘ (modyfikacja oryginału)

---

### 3.2 Funkcje (functions)

```pascal
// Funkcja zwraca wartość
function Dodaj(a, b: Integer): Integer;
begin
  Result := a + b;  // Lub: Dodaj := a + b;
end;

function Potega(podstawa, wykladnik: Integer): Int64;
var
  i: Integer;
begin
  Result := 1;
  for i := 1 to wykladnik do
    Result := Result * podstawa;
end;

function CzyParzysta(n: Integer): Boolean;
begin
  Result := (n mod 2 = 0);
end;

// Funkcja z wieloma parametrami
function ObwodProstokata(a, b: Double): Double;
begin
  Result := 2 * (a + b);
end;

function PoleProstokata(a, b: Double): Double;
begin
  Result := a * b;
end;

var
  wynik: Integer;
  pole: Double;

begin
  wynik := Dodaj(5, 3);
  WriteLn('5 + 3 = ', wynik);
  
  wynik := Potega(2, 10);
  WriteLn('2^10 = ', wynik);
  
  if CzyParzysta(10) then
    WriteLn('10 jest parzyste')
  else
    WriteLn('10 jest nieparzyste');
  
  pole := PoleProstokata(5.5, 3.2);
  WriteLn('Pole: ', pole:0:2);
end.
```

---

### 3.3 Funkcje rekurencyjne

```pascal
// Silnia
function Silnia(n: Integer): Int64;
begin
  if n <= 1 then
    Result := 1
  else
    Result := n * Silnia(n - 1);
end;

// Fibonacci
function Fibonacci(n: Integer): Int64;
begin
  if n <= 1 then
    Result := n
  else
    Result := Fibonacci(n-1) + Fibonacci(n-2);
end;

// NWD (największy wspólny dzielnik)
function NWD(a, b: Integer): Integer;
begin
  if b = 0 then
    Result := a
  else
    Result := NWD(b, a mod b);
end;

var
  i: Integer;

begin
  // Silnie
  for i := 1 to 10 do
    WriteLn(i, '! = ', Silnia(i));
  
  // Fibonacci
  Write('Fibonacci: ');
  for i := 0 to 15 do
    Write(Fibonacci(i), ' ');
  WriteLn;
  
  // NWD
  WriteLn('NWD(48, 18) = ', NWD(48, 18));  // 6
end.
```

---

### 3.4 Przeciążanie funkcji (overload)

```pascal
function Dodaj(a, b: Integer): Integer; overload;
begin
  Result := a + b;
end;

function Dodaj(a, b: Double): Double; overload;
begin
  Result := a + b;
end;

function Dodaj(a, b, c: Integer): Integer; overload;
begin
  Result := a + b + c;
end;

begin
  WriteLn(Dodaj(5, 3));          // Integer
  WriteLn(Dodaj(5.5, 3.2):0:2);  // Double
  WriteLn(Dodaj(1, 2, 3));       // 3 parametry
end.
```

---

## CZĘŚĆ 4: STRING - OPERACJE NA TEKŚCIE

### 4.1 Podstawowe operacje

```pascal
var
  s, s2: String;
  i: Integer;

begin
  // Tworzenie
  s := 'Hello World';
  
  // Długość
  WriteLn('Długość: ', Length(s));  // 11
  
  // Konkatenacja (łączenie)
  s2 := 'Pascal';
  s := s + ' ' + s2;  // 'Hello World Pascal'
  
  // Dostęp do znaków (indeks od 1!)
  WriteLn('Pierwszy znak: ', s[1]);  // 'H'
  WriteLn('Ostatni znak: ', s[Length(s)]);
  
  // Modyfikacja znaku
  s[1] := 'h';  // 'hello World Pascal'
  
  // Porównanie
  if s = 'hello' then WriteLn('Równe');
  if s <> 'hello' then WriteLn('Różne');
  
  // Wielkość liter (uses SysUtils)
  WriteLn(UpperCase(s));    // HELLO WORLD PASCAL
  WriteLn(LowerCase(s));    // hello world pascal
  WriteLn(UpCase('a'));     // 'A' (jeden znak)
end.
```

---

### 4.2 Funkcje String (SysUtils)

```pascal
uses
  SysUtils;

var
  s: String;
  i, pozycja: Integer;

begin
  s := '  Hello World  ';
  
  // Usuwanie białych znaków
  WriteLn('[', Trim(s), ']');        // 'Hello World'
  WriteLn('[', TrimLeft(s), ']');    // 'Hello World  '
  WriteLn('[', TrimRight(s), ']');   // '  Hello World'
  
  // Wyszukiwanie
  pozycja := Pos('World', s);  // Pozycja pierwszego wystąpienia
  WriteLn('Pozycja "World": ', pozycja);  // 9
  
  if Pos('Pascal', s) > 0 then
    WriteLn('Znaleziono Pascal')
  else
    WriteLn('Nie znaleziono');
  
  // Substring
  s := 'Hello World';
  WriteLn(Copy(s, 1, 5));     // 'Hello' (od poz 1, 5 znaków)
  WriteLn(Copy(s, 7, 5));     // 'World'
  
  // Usuwanie
  Delete(s, 1, 6);  // Usuwa od poz 1, 6 znaków
  WriteLn(s);       // 'World'
  
  // Wstawianie
  s := 'World';
  Insert('Hello ', s, 1);  // Wstaw na pozycję 1
  WriteLn(s);  // 'Hello World'
  
  // Zamiana
  s := 'Hello World';
  s := StringReplace(s, 'World', 'Pascal', []);
  WriteLn(s);  // 'Hello Pascal'
  
  // Zamiana wszystkich wystąpień
  s := 'aaa bbb aaa ccc aaa';
  s := StringReplace(s, 'aaa', 'xxx', [rfReplaceAll]);
  WriteLn(s);  // 'xxx bbb xxx ccc xxx'
end.
```

---

### 4.3 Konwersje String

```pascal
uses
  SysUtils;

var
  s: String;
  i: Integer;
  d: Double;
  kod: Integer;

begin
  // Integer -> String
  i := 123;
  s := IntToStr(i);
  WriteLn('String: ', s);
  
  // String -> Integer
  s := '456';
  i := StrToInt(s);
  WriteLn('Integer: ', i);
  
  // String -> Integer (bezpieczne)
  s := 'abc';
  if TryStrToInt(s, i) then
    WriteLn('Konwersja OK: ', i)
  else
    WriteLn('Błąd konwersji');
  
  // Double -> String
  d := 3.14159;
  s := FloatToStr(d);
  WriteLn('Float jako String: ', s);
  
  s := Format('%.2f', [d]);  // Format z 2 miejscami
  WriteLn('Formatted: ', s);  // '3.14'
  
  // String -> Double
  s := '3.14';
  d := StrToFloat(s);
  WriteLn('Double: ', d:0:4);
  
  // Format - zaawansowany
  s := Format('Imię: %s, Wiek: %d, Wzrost: %.2f', 
              ['Jan', 25, 1.78]);
  WriteLn(s);
  
  // Val - stara metoda (legacy)
  Val('123', i, kod);
  if kod = 0 then
    WriteLn('Val OK: ', i)
  else
    WriteLn('Val błąd na pozycji: ', kod);
end.
```

---

### 4.4 Dzielenie String (Split)

```pascal
uses
  SysUtils, StrUtils;

var
  s: String;
  parts: TStringArray;  // array of string
  i: Integer;

begin
  // Split przez separator
  s := 'Jan,Anna,Piotr,Maria';
  parts := SplitString(s, ',');
  
  for i := 0 to High(parts) do
    WriteLn('Część ', i, ': ', parts[i]);
  
  // Alternatywa - własna funkcja split
  s := 'jeden dwa trzy cztery';
  i := 1;
  repeat
    pozycja := Pos(' ', s);
    if pozycja > 0 then
    begin
      czesc := Copy(s, 1, pozycja - 1);
      WriteLn('Słowo ', i, ': ', czesc);
      Delete(s, 1, pozycja);
      Inc(i);
    end;
  until pozycja = 0;
  if s <> '' then
    WriteLn('Słowo ', i, ': ', s);
end.
```

---

## CZĘŚĆ 5: ZAAWANSOWANE TYPY DANYCH

### 5.1 Rekordy (Records)

```pascal
type
  TOsoba = record
    Imie: String;
    Nazwisko: String;
    Wiek: Integer;
    Wzrost: Double;
  end;

var
  osoba: TOsoba;
  ludzie: array[1..3] of TOsoba;
  i: Integer;

begin
  // Przypisanie
  osoba.Imie := 'Jan';
  osoba.Nazwisko := 'Kowalski';
  osoba.Wiek := 30;
  osoba.Wzrost := 1.80;
  
  // Odczyt
  WriteLn(osoba.Imie, ' ', osoba.Nazwisko);
  WriteLn('Wiek: ', osoba.Wiek);
  
  // Tablica rekordów
  ludzie[1].Imie := 'Anna';
  ludzie[1].Wiek := 25;
  
  ludzie[2].Imie := 'Piotr';
  ludzie[2].Wiek := 35;
  
  ludzie[3].Imie := 'Maria';
  ludzie[3].Wiek := 28;
  
  // Iteracja
  for i := 1 to 3 do
    WriteLn(ludzie[i].Imie, ' - ', ludzie[i].Wiek, ' lat');
  
  // With - skrót
  with osoba do
  begin
    Imie := 'Tomasz';
    Nazwisko := 'Nowak';
    Wiek := 40;
    WriteLn(Imie, ' ', Nazwisko, ' ma ', Wiek, ' lat');
  end;
end.
```

---

### 5.2 Enumeracje (Enumerated Types)

```pascal
type
  TDzienTygodnia = (Poniedzialek, Wtorek, Sroda, Czwartek, 
                     Piatek, Sobota, Niedziela);
  
  TKolor = (Czerwony, Zielony, Niebieski, Zolty, Czarny);

var
  dzien: TDzienTygodnia;
  kolor: TKolor;

begin
  // Przypisanie
  dzien := Sroda;
  
  // Porównanie
  if dzien = Sroda then
    WriteLn('Dziś jest środa');
  
  // Case
  case dzien of
    Poniedzialek..Piatek: WriteLn('Dzień roboczy');
    Sobota, Niedziela: WriteLn('Weekend');
  end;
  
  // Iteracja przez wszystkie wartości
  for dzien := Poniedzialek to Niedziela do
  begin
    Write(Ord(dzien), ' ');  // 0 1 2 3 4 5 6
    case dzien of
      Poniedzialek: WriteLn('Pn');
      Wtorek: WriteLn('Wt');
      Sroda: WriteLn('Śr');
      // ...
    end;
  end;
  
  // Succ/Pred - następny/poprzedni
  dzien := Sroda;
  WriteLn('Następny: ', Ord(Succ(dzien)));  // Czwartek
  WriteLn('Poprzedni: ', Ord(Pred(dzien))); // Wtorek
end.
```

---

### 5.3 Zbiory (Sets)

```pascal
type
  TCyfra = 0..9;
  TZbiorCyfr = set of TCyfra;
  
  TDzienTygodnia = (Pn, Wt, Sr, Cz, Pt, So, Nd);
  TDniTygodnia = set of TDzienTygodnia;

var
  cyfry: TZbiorCyfr;
  dniRobocze, weekend, wszystkie: TDniTygodnia;

begin
  // Tworzenie zbioru
  cyfry := [1, 2, 3, 5, 7];  // Liczby pierwsze
  
  // Sprawdzanie przynależności
  if 3 in cyfry then
    WriteLn('3 jest w zbiorze');
  
  if not (4 in cyfry) then
    WriteLn('4 nie jest w zbiorze');
  
  // Operacje na zbiorach
  dniRobocze := [Pn, Wt, Sr, Cz, Pt];
  weekend := [So, Nd];
  
  // Suma zbiorów (union)
  wszystkie := dniRobocze + weekend;
  
  // Różnica zbiorów
  wszystkie := wszystkie - [Sr];  // Usuń środę
  
  // Przecięcie zbiorów (intersection)
  cyfry := [1, 2, 3, 4] * [3, 4, 5, 6];  // [3, 4]
  
  // Puste i pełne zbiory
  cyfry := [];  // Pusty
  cyfry := [0..9];  // Pełny (wszystkie cyfry)
  
  // Przykład praktyczny - znaki dozwolone
  var dozwolone := ['a'..'z', 'A'..'Z', '0'..'9'];
  var znak := 'x';
  if znak in dozwolone then
    WriteLn('Znak dozwolony');
end.
```

---

## CZĘŚĆ 6: WSKAŹNIKI (POINTERS)

### 6.1 Podstawy wskaźników

```pascal
var
  a: Integer;
  p: ^Integer;  // Wskaźnik na Integer
  
begin
  a := 10;
  p := @a;  // @ zwraca adres zmiennej
  
  WriteLn('Wartość a: ', a);
  WriteLn('Adres a: ', IntToHex(PtrUInt(p), 8));
  WriteLn('Wartość przez wskaźnik: ', p^);  // ^ dereferencja
  
  // Modyfikacja przez wskaźnik
  p^ := 20;
  WriteLn('Nowa wartość a: ', a);  // 20
  
  // Wskaźnik nil
  p := nil;
  if p = nil then
    WriteLn('Wskaźnik pusty');
  
  // Sprawdzenie przed użyciem
  if Assigned(p) then
    WriteLn('Wartość: ', p^)
  else
    WriteLn('Wskaźnik nil');
end.
```

---

### 6.2 Dynamiczna alokacja pamięci

```pascal
type
  POsoba = ^TOsoba;
  TOsoba = record
    Imie: String;
    Wiek: Integer;
  end;

var
  p: POsoba;

begin
  // Alokacja
  New(p);
  
  // Użycie
  p^.Imie := 'Jan';
  p^.Wiek := 25;
  WriteLn(p^.Imie, ' ma ', p^.Wiek, ' lat');
  
  // Zwolnienie
  Dispose(p);
  p := nil;
  
  // Alternatywa - GetMem/FreeMem
  GetMem(p, SizeOf(TOsoba));
  p^.Imie := 'Anna';
  p^.Wiek := 30;
  WriteLn(p^.Imie);
  FreeMem(p);
end.
```

---

## CZĘŚĆ 7: OBSŁUGA PLIKÓW

### 7.1 Pliki tekstowe

```pascal
var
  f: TextFile;
  linia: String;
  i: Integer;

begin
  // ZAPIS DO PLIKU
  AssignFile(f, 'dane.txt');
  Rewrite(f);  // Otwórz do zapisu (usuwa zawartość!)
  
  WriteLn(f, 'Pierwsza linia');
  WriteLn(f, 'Druga linia');
  WriteLn(f, 'Trzecia linia');
  
  for i := 1 to 5 do
    WriteLn(f, 'Linia nr ', i);
  
  CloseFile(f);
  WriteLn('Zapisano do pliku');
  
  // ODCZYT Z PLIKU
  AssignFile(f, 'dane.txt');
  Reset(f);  // Otwórz do odczytu
  
  while not Eof(f) do
  begin
    ReadLn(f, linia);
    WriteLn('Odczytano: ', linia);
  end;
  
  CloseFile(f);
  
  // DOPISYWANIE DO PLIKU
  AssignFile(f, 'dane.txt');
  Append(f);  // Otwórz do dopisania na końcu
  
  WriteLn(f, 'Nowa linia na końcu');
  
  CloseFile(f);
end.
```

---

### 7.2 Bezpieczna obsługa plików

```pascal
uses
  SysUtils;

var
  f: TextFile;
  linia: String;

begin
  // Try..Except dla obsługi błędów
  try
    AssignFile(f, 'dane.txt');
    Reset(f);
    
    while not Eof(f) do
    begin
      ReadLn(f, linia);
      WriteLn(linia);
    end;
    
    CloseFile(f);
    
  except
    on E: Exception do
    begin
      WriteLn('Błąd: ', E.Message);
      if TTextRec(f).Mode <> fmClosed then
        CloseFile(f);
    end;
  end;
  
  // Sprawdzenie istnienia pliku
  if FileExists('dane.txt') then
    WriteLn('Plik istnieje')
  else
    WriteLn('Plik nie istnieje');
end.
```

---

## CZĘŚĆ 8: OBSŁUGA WYJĄTKÓW

### 8.1 Try..Except

```pascal
uses
  SysUtils;

var
  a, b, wynik: Integer;
  s: String;

begin
  // Podstawowa obsługa
  try
    a := 10;
    b := 0;
    wynik := a div b;  // Błąd dzielenia przez 0!
  except
    WriteLn('Wystąpił błąd!');
  end;
  
  // Z informacją o błędzie
  try
    s := 'abc';
    wynik := StrToInt(s);  // Błąd konwersji!
  except
    on E: Exception do
      WriteLn('Błąd: ', E.Message);
  end;
  
  // Obsługa konkretnych wyjątków
  try
    wynik := StrToInt('xyz');
  except
    on E: EConvertError do
      WriteLn('Błąd konwersji: ', E.Message);
    on E: Exception do
      WriteLn('Inny błąd: ', E.Message);
  end;
  
  WriteLn('Program działa dalej');
end.
```

---

### 8.2 Try..Finally

```pascal
var
  f: TextFile;
  linia: String;

begin
  // Try..Finally - zawsze wykonuje cleanup
  AssignFile(f, 'dane.txt');
  Reset(f);
  
  try
    while not Eof(f) do
    begin
      ReadLn(f, linia);
      WriteLn(linia);
    end;
  finally
    CloseFile(f);  // ZAWSZE się wykona!
  end;
  
  // Kombinacja Try..Except..Finally
  try
    try
      // Kod który może rzucić wyjątek
      Reset(f);
      ReadLn(f, linia);
    except
      on E: Exception do
        WriteLn('Błąd: ', E.Message);
    end;
  finally
    CloseFile(f);  // Cleanup
  end;
end.
```

---

## CZĘŚĆ 9: KLASY (PODSTAWY OOP)

### 9.1 Definiowanie klasy

```pascal
type
  TOsoba = class
  private
    FImie: String;
    FWiek: Integer;
  public
    constructor Create(AIme: String; AWiek: Integer);
    destructor Destroy; override;
    
    procedure Przedstaw;
    function CzyPelnoletnia: Boolean;
    
    property Imie: String read FImie write FImie;
    property Wiek: Integer read FWiek write FWiek;
  end;

constructor TOsoba.Create(AImie: String; AWiek: Integer);
begin
  inherited Create;
  FImie := AImie;
  FWiek := AWiek;
end;

destructor TOsoba.Destroy;
begin
  // Cleanup
  inherited;
end;

procedure TOsoba.Przedstaw;
begin
  WriteLn('Jestem ', FImie, ', mam ', FWiek, ' lat');
end;

function TOsoba.CzyPelnoletnia: Boolean;
begin
  Result := FWiek >= 18;
end;

var
  osoba: TOsoba;

begin
  osoba := TOsoba.Create('Jan', 25);
  try
    osoba.Przedstaw;
    
    if osoba.CzyPelnoletnia then
      WriteLn('Pełnoletnia');
    
    WriteLn('Imię: ', osoba.Imie);
    osoba.Wiek := 30;
    WriteLn('Nowy wiek: ', osoba.Wiek);
    
  finally
    osoba.Free;  // ZAWSZE zwolnij pamięć!
  end;
end.
```

---

## PODSUMOWANIE - SCHEMAT NAUKI

### Tydzień 1-2: PODSTAWY
1. Składnia, zmienne, typy danych
2. Operatory, instrukcje warunkowe
3. Pętle: for, while, repeat
4. Tablice statyczne i dynamiczne
5. **Projekt:** Kalkulator prosty

### Tydzień 3-4: PROCEDURY I FUNKCJE
1. Procedury bez/z parametrami
2. Funkcje, return values
3. Rekurencja
4. Operacje na String
5. **Projekt:** Kalkulator zaawansowany z historią

### Tydzień 5-6: ZAAWANSOWANE
1. Rekordy, enumeracje, zbiory
2. Wskaźniki i dynamiczna pamięć
3. Obsługa plików
4. Try..Except..Finally
5. **Projekt:** Manager kontaktów z zapisem do pliku

### Tydzień 7-8: OOP
1. Klasy, konstruktory, destruktory
2. Hermetyzacja, properties
3. Dziedziczenie, polimorfizm
4. Interfejsy
5. **Projekt:** System zarządzania biblioteką

---

## NASTĘPNE KROKI

Po opanowaniu podstaw przejdź do:
- **GUI (VCL/FMX)** - tworzenie aplikacji okienkowych
- **Bazy danych** - FireDAC, SQL
- **Wątki** - programowanie wielowątkowe
- **Web** - REST API, HTTP
- **Deployment** - pakowanie aplikacji