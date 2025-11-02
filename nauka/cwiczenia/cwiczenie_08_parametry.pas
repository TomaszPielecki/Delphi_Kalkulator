program Cwiczenie08Parametry;

{*******************************************************************************
  ĆWICZENIE 8: Parametry (value, var, const, out)
  
  CEL:
  - Zrozumieć różnicę między parametrami przez wartość a przez referencję
  - Nauczyć się używać var (parametr wejściowo-wyjściowy)
  - Poznać out (parametr tylko wyjściowy)
  - Używać const dla parametrów tylko do odczytu
  
  ZADANIE:
  Napisz procedury:
  1. ZamienWartosci(var a, b: Integer) - zamienia miejscami dwie zmienne
  2. PodzielZReszta(dzielna, dzielnik: Integer; var iloraz, reszta: Integer)
  3. AnalizujLiczbe(liczba: Integer; var jestParzysta: Boolean; out kwadrat: Integer)
  
  WSKAZÓWKI:
  - Parametr bez modyfikatora - przez wartość (kopia)
  - var - przez referencję (oryginał, wejście i wyjście)
  - out - tylko wyjście (nie trzeba inicjować przed wywołaniem)
  - const - tylko odczyt (optymalizacja dla dużych struktur)
  
  PRZYKŁAD WYNIKU:
  === ZAMIANA WARTOŚCI ===
  Przed: a=5, b=10
  Po: a=10, b=5
  
  === DZIELENIE Z RESZTĄ ===
  17 div 5 = 3 (reszta 2)
  
  === ANALIZA LICZBY ===
  Liczba: 8
  Parzysta: TAK
  Kwadrat: 64
*******************************************************************************}

{$mode delphi}
{$codepage utf8}

uses
  SysUtils
  {$IFDEF WINDOWS}, Windows{$ENDIF};

// TODO: Procedura zamiany wartości
// procedure ZamienWartosci(var a, b: Integer);
// var
//   temp: Integer;
// begin
//   temp := a;
//   a := b;
//   b := temp;
// end;

// TODO: Procedura dzielenia z resztą
// procedure PodzielZReszta(dzielna, dzielnik: Integer; var iloraz, reszta: Integer);
// begin
//   iloraz := dzielna div dzielnik;
//   reszta := dzielna mod dzielnik;
// end;

// TODO: Procedura analizy liczby
// procedure AnalizujLiczbe(liczba: Integer; var jestParzysta: Boolean; out kwadrat: Integer);
// begin
//   jestParzysta := (liczba mod 2 = 0);
//   kwadrat := liczba * liczba;
// end;

var
  x, y: Integer;
  iloraz, reszta: Integer;
  parzysta: Boolean;
  kwadrat: Integer;

begin
  {$IFDEF WINDOWS}
  SetConsoleOutputCP(CP_UTF8);
  SetConsoleCP(CP_UTF8);
  {$ENDIF}

  // CZĘŚĆ 1: Zamiana wartości
  WriteLn('=== ZAMIANA WARTOŚCI ===');
  x := 5;
  y := 10;
  WriteLn('Przed: a=', x, ', b=', y);
  
  // TODO: Wywołaj ZamienWartosci
  // ZamienWartosci(x, y);
  // WriteLn('Po: a=', x, ', b=', y);
  
  WriteLn();
  
  // CZĘŚĆ 2: Dzielenie z resztą
  WriteLn('=== DZIELENIE Z RESZTĄ ===');
  
  // TODO: Wywołaj PodzielZReszta
  // PodzielZReszta(17, 5, iloraz, reszta);
  // WriteLn('17 div 5 = ', iloraz, ' (reszta ', reszta, ')');
  
  WriteLn();
  
  // CZĘŚĆ 3: Analiza liczby
  WriteLn('=== ANALIZA LICZBY ===');
  x := 8;
  
  // TODO: Wywołaj AnalizujLiczbe
  // AnalizujLiczbe(x, parzysta, kwadrat);
  // WriteLn('Liczba: ', x);
  // if parzysta then
  //   WriteLn('Parzysta: TAK')
  // else
  //   WriteLn('Parzysta: NIE');
  // WriteLn('Kwadrat: ', kwadrat);
  
  WriteLn();
  WriteLn('Naciśnij ENTER aby zakończyć...');
  ReadLn;
end.
