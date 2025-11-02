program Cwiczenie07Procedury;

{*******************************************************************************
  ĆWICZENIE 7: Procedury i funkcje
  
  CEL:
  - Nauczyć się tworzyć własne procedury
  - Zrozumieć różnicę między procedurą a funkcją
  - Przekazywać parametry do procedur/funkcji
  
  ZADANIE:
  Napisz program z procedurami do:
  1. WyswietlMenu - wyświetla menu wyboru
  2. PoleProstokata - funkcja obliczająca pole (a, b: Integer): Integer
  3. ObwodProstokata - funkcja obliczająca obwód
  4. WyswietlWynik - procedura wyświetlająca wynik z ramką
  
  WSKAZÓWKI:
  - procedure NazwaProcedury(parametry);
  - function NazwaFunkcji(parametry): TypZwracany;
  - Result := wartość; (w funkcji)
  
  PRZYKŁAD WYNIKU:
  === KALKULATOR PROSTOKĄTA ===
  1. Oblicz pole
  2. Oblicz obwód
  Wybór: 1
  
  Podaj bok a: 5
  Podaj bok b: 3
  
  ==================
  Pole = 15 cm²
  ==================
*******************************************************************************}

{$mode delphi}
{$codepage utf8}

uses
  SysUtils
  {$IFDEF WINDOWS}, Windows{$ENDIF};

// TODO: Zdefiniuj procedurę WyswietlMenu
// procedure WyswietlMenu;
// begin
//   WriteLn('=== KALKULATOR PROSTOKĄTA ===');
//   WriteLn('1. Oblicz pole');
//   WriteLn('2. Oblicz obwód');
//   Write('Wybór: ');
// end;

// TODO: Zdefiniuj funkcję PoleProstokata
// function PoleProstokata(a, b: Integer): Integer;
// begin
//   Result := a * b;
// end;

// TODO: Zdefiniuj funkcję ObwodProstokata
// function ObwodProstokata(a, b: Integer): Integer;
// begin
//   Result := 2 * (a + b);
// end;

// TODO: Zdefiniuj procedurę WyswietlWynik
// procedure WyswietlWynik(nazwa: String; wartosc: Integer; jednostka: String);
// begin
//   WriteLn();
//   WriteLn('==================');
//   WriteLn(nazwa, ' = ', wartosc, ' ', jednostka);
//   WriteLn('==================');
// end;

var
  wybor, a, b, wynik: Integer;

begin
  {$IFDEF WINDOWS}
  SetConsoleOutputCP(CP_UTF8);
  SetConsoleCP(CP_UTF8);
  {$ENDIF}

  // TODO: Wywołaj WyswietlMenu
  // WyswietlMenu;
  // ReadLn(wybor);
  
  WriteLn();
  Write('Podaj bok a: ');
  ReadLn(a);
  Write('Podaj bok b: ');
  ReadLn(b);
  
  // TODO: Oblicz i wyświetl wynik w zależności od wyboru
  // case wybor of
  //   1: begin
  //        wynik := PoleProstokata(a, b);
  //        WyswietlWynik('Pole', wynik, 'cm²');
  //      end;
  //   2: begin
  //        wynik := ObwodProstokata(a, b);
  //        WyswietlWynik('Obwód', wynik, 'cm');
  //      end;
  // else
  //   WriteLn('Nieprawidłowy wybór!');
  // end;
  
  WriteLn();
  WriteLn('Naciśnij ENTER aby zakończyć...');
  ReadLn;
end.
