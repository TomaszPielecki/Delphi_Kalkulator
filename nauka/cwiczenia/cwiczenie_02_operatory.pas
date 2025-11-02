program Cwiczenie02Operatory;

{*******************************************************************************
  ĆWICZENIE 2: Operatory arytmetyczne i logiczne
  
  CEL:
  - Poznać operatory: +, -, *, /, div, mod
  - Zrozumieć różnicę między / (dzielenie rzeczywiste) a div (dzielenie całkowite)
  - Nauczyć się operatorów logicznych: and, or, not
  - Pracować z wyrażeniami matematycznymi
  
  ZADANIE:
  Napisz kalkulator, który:
  1. Pobierze dwie liczby od użytkownika
  2. Wyświetli wyniki wszystkich operacji arytmetycznych
  3. Sprawdzi, czy pierwsza liczba jest większa od drugiej (True/False)
  
  WSKAZÓWKI:
  - ReadLn(zmienna) do pobierania danych
  - Format(string, [parametry]) do formatowania
  - div - dzielenie całkowite (5 div 2 = 2)
  - mod - reszta z dzielenia (5 mod 2 = 1)
  
  PRZYKŁAD WYNIKU:
  Podaj pierwszą liczbę: 10
  Podaj drugą liczbę: 3
  
  === WYNIKI ===
  10 + 3 = 13
  10 - 3 = 7
  10 * 3 = 30
  10 / 3 = 3.33
  10 div 3 = 3
  10 mod 3 = 1
  Czy 10 > 3? TRUE
*******************************************************************************}

{$mode delphi}
{$codepage utf8}

uses
  SysUtils
  {$IFDEF WINDOWS}, Windows{$ENDIF};

var
  a, b: Integer;
  wynikDzielenia: Real;
  // TODO: Dodaj więcej zmiennych według potrzeb

begin
  {$IFDEF WINDOWS}
  SetConsoleOutputCP(CP_UTF8);
  SetConsoleCP(CP_UTF8);
  {$ENDIF}

  WriteLn('=== KALKULATOR OPERATORÓW ===');
  WriteLn();
  
  // TODO: Pobierz dwie liczby od użytkownika
  Write('Podaj pierwszą liczbę: ');
  // ReadLn(a);
  
  Write('Podaj drugą liczbę: ');
  // ReadLn(b);
  
  WriteLn();
  WriteLn('=== WYNIKI ===');
  
  // TODO: Wykonaj operacje i wyświetl wyniki
  // WriteLn(a, ' + ', b, ' = ', a + b);
  // WriteLn(a, ' - ', b, ' = ', a - b);
  // WriteLn(a, ' * ', b, ' = ', a * b);
  // wynikDzielenia := a / b;
  // WriteLn(a, ' / ', b, ' = ', wynikDzielenia:0:2);
  // WriteLn(a, ' div ', b, ' = ', a div b);
  // WriteLn(a, ' mod ', b, ' = ', a mod b);
  // WriteLn('Czy ', a, ' > ', b, '? ', a > b);
  
  WriteLn();
  WriteLn('Naciśnij ENTER aby zakończyć...');
  ReadLn;
end.
