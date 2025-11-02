program Cwiczenie01Zmienne;

{*******************************************************************************
  ĆWICZENIE 1: Zmienne i typy danych
  
  CEL:
  - Zrozumieć jak deklarować zmienne
  - Poznać podstawowe typy danych (Integer, Real, String, Boolean)
  - Nauczyć się przypisywać wartości
  - Wyświetlać wyniki na ekranie
  
  ZADANIE:
  Napisz program, który:
  1. Zadeklaruje zmienne różnych typów
  2. Przypisze im wartości
  3. Wyświetli informacje o Tobie (imię, wiek, wzrost, czy lubisz programować)
  
  WSKAZÓWKI:
  - String dla tekstu: imie: String;
  - Integer dla liczb całkowitych: wiek: Integer;
  - Real dla liczb zmiennoprzecinkowych: wzrost: Real;
  - Boolean dla prawda/fałsz: lubeProgramowac: Boolean;
  - WriteLn() do wyświetlania
  
  PRZYKŁAD WYNIKU:
  === MOJE DANE ===
  Imię: Tomasz
  Wiek: 25 lat
  Wzrost: 180.5 cm
  Lubię programować: TRUE
*******************************************************************************}

{$mode delphi}
{$codepage utf8}

uses
  SysUtils
  {$IFDEF WINDOWS}, Windows{$ENDIF};

var
  // TODO: Zadeklaruj zmienne tutaj
  // imie: String;
  // wiek: Integer;
  // wzrost: Real;
  // lubeProgramowac: Boolean;

begin
  // Ustawienie kodowania UTF-8 dla polskich znaków
  {$IFDEF WINDOWS}
  SetConsoleOutputCP(CP_UTF8);
  SetConsoleCP(CP_UTF8);
  {$ENDIF}

  WriteLn('=== MOJE DANE ===');
  WriteLn();
  
  // TODO: Przypisz wartości do zmiennych
  // imie := 'Twoje imię';
  // wiek := 25;
  // wzrost := 180.5;
  // lubeProgramowac := True;
  
  // TODO: Wyświetl dane
  // WriteLn('Imię: ', imie);
  // WriteLn('Wiek: ', wiek, ' lat');
  // WriteLn('Wzrost: ', wzrost:0:1, ' cm');
  // WriteLn('Lubię programować: ', lubeProgramowac);
  
  WriteLn();
  WriteLn('Naciśnij ENTER aby zakończyć...');
  ReadLn;
end.
