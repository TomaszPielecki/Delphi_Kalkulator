program Cwiczenie09Zakres;

{*******************************************************************************
  ĆWICZENIE 9: Zasięg zmiennych (scope)
  
  CEL:
  - Zrozumieć różnicę między zmiennymi globalnymi a lokalnymi
  - Nauczyć się, jak zasięg wpływa na widoczność zmiennych
  - Poznać zmienne lokalne w procedurach/funkcjach
  
  ZADANIE:
  Napisz program demonstrujący:
  1. Zmienną globalną dostępną wszędzie
  2. Zmienne lokalne w funkcjach (niedostępne poza nimi)
  3. Przesłanianie zmiennych (shadowing)
  
  WSKAZÓWKI:
  - Zmienne globalne: deklarowane przed begin głównym
  - Zmienne lokalne: deklarowane w var wewnątrz procedury/funkcji
  - Zmienna lokalna o tej samej nazwie "przesłania" globalną
  
  PRZYKŁAD WYNIKU:
  === DEMONSTRACJA ZASIĘGU ===
  Zmienna globalna: 100
  W funkcji (lokalna): 50
  Po powrocie (globalna): 100
  
  === LICZNIK ===
  Wywołanie 1: licznik = 1
  Wywołanie 2: licznik = 2
  Wywołanie 3: licznik = 3
*******************************************************************************}

{$mode delphi}
{$codepage utf8}

uses
  SysUtils
  {$IFDEF WINDOWS}, Windows{$ENDIF};

var
  zmiennaGlobalna: Integer;  // Dostępna wszędzie
  licznik: Integer;           // Globalny licznik

// TODO: Funkcja pokazująca zmienną lokalną
// function PokazZakres: Integer;
// var
//   zmiennaLokalna: Integer;  // Dostępna tylko w tej funkcji
// begin
//   zmiennaLokalna := 50;
//   WriteLn('W funkcji (lokalna): ', zmiennaLokalna);
//   Result := zmiennaLokalna;
// end;

// TODO: Procedura inkrementująca licznik
// procedure InkrementujLicznik;
// begin
//   Inc(licznik);  // Modyfikuje globalną zmienną
//   WriteLn('Wywołanie ', licznik, ': licznik = ', licznik);
// end;

// TODO: Funkcja pokazująca przesłanianie (shadowing)
// function PrzykladPrzeslaniania: Integer;
// var
//   zmiennaGlobalna: Integer;  // Lokalna o tej samej nazwie!
// begin
//   zmiennaGlobalna := 999;     // To jest LOKALNA zmienna
//   WriteLn('Wewnątrz funkcji (przesłonięta): ', zmiennaGlobalna);
//   Result := zmiennaGlobalna;
// end;

begin
  {$IFDEF WINDOWS}
  SetConsoleOutputCP(CP_UTF8);
  SetConsoleCP(CP_UTF8);
  {$ENDIF}

  WriteLn('=== DEMONSTRACJA ZASIĘGU ===');
  WriteLn();
  
  // CZĘŚĆ 1: Zmienne globalne vs lokalne
  zmiennaGlobalna := 100;
  WriteLn('Zmienna globalna: ', zmiennaGlobalna);
  
  // TODO: Wywołaj PokazZakres
  // PokazZakres;
  
  WriteLn('Po powrocie (globalna): ', zmiennaGlobalna);
  WriteLn();
  
  // CZĘŚĆ 2: Globalny licznik
  WriteLn('=== LICZNIK ===');
  licznik := 0;
  
  // TODO: Wywołaj InkrementujLicznik kilka razy
  // InkrementujLicznik;
  // InkrementujLicznik;
  // InkrementujLicznik;
  
  WriteLn();
  
  // CZĘŚĆ 3: Przesłanianie zmiennych
  WriteLn('=== PRZESŁANIANIE ===');
  zmiennaGlobalna := 100;
  WriteLn('Przed wywołaniem (globalna): ', zmiennaGlobalna);
  
  // TODO: Wywołaj PrzykladPrzeslaniania
  // PrzykladPrzeslaniania;
  
  WriteLn('Po wywołaniu (globalna nie zmieniona): ', zmiennaGlobalna);
  
  WriteLn();
  WriteLn('Naciśnij ENTER aby zakończyć...');
  ReadLn;
end.
