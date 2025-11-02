program Cwiczenie06String;

{*******************************************************************************
  ĆWICZENIE 6: Operacje na łańcuchach (String)
  
  CEL:
  - Nauczyć się łączyć stringi (konkatenacja)
  - Używać funkcji Length, UpperCase, LowerCase
  - Wyciągać podciągi (Copy)
  - Szukać fragmentów (Pos)
  
  ZADANIE:
  Napisz program "Analizator tekstu", który:
  1. Pobierze zdanie od użytkownika
  2. Wyświetli długość tekstu
  3. Przekonwertuje na wielkie i małe litery
  4. Sprawdzi, czy zawiera słowo "Pascal"
  
  WSKAZÓWKI:
  - Length(str) - długość stringa
  - UpperCase(str) - wielkie litery
  - LowerCase(str) - małe litery
  - Pos(szukany, gdzie) - pozycja podciągu (0 = nie znaleziono)
  - Copy(str, start, len) - wyciągnij fragment
  
  PRZYKŁAD WYNIKU:
  Wprowadź zdanie: Uczę się języka Pascal!
  
  === ANALIZA TEKSTU ===
  Długość: 24 znaków
  Wielkie litery: UCZĘ SIĘ JĘZYKA PASCAL!
  Małe litery: uczę się języka pascal!
  Czy zawiera "Pascal"? TAK (pozycja 17)
*******************************************************************************}

{$mode delphi}
{$codepage utf8}

uses
  SysUtils
  {$IFDEF WINDOWS}, Windows{$ENDIF};

var
  tekst: String;
  pozycja: Integer;

begin
  {$IFDEF WINDOWS}
  SetConsoleOutputCP(CP_UTF8);
  SetConsoleCP(CP_UTF8);
  {$ENDIF}

  WriteLn('=== ANALIZATOR TEKSTU ===');
  WriteLn();
  
  Write('Wprowadź zdanie: ');
  ReadLn(tekst);
  
  WriteLn();
  WriteLn('=== ANALIZA TEKSTU ===');
  
  // TODO: Wyświetl długość tekstu
  // WriteLn('Długość: ', Length(tekst), ' znaków');
  
  // TODO: Przekonwertuj na wielkie litery
  // WriteLn('Wielkie litery: ', UpperCase(tekst));
  
  // TODO: Przekonwertuj na małe litery
  // WriteLn('Małe litery: ', LowerCase(tekst));
  
  // TODO: Sprawdź, czy zawiera słowo "Pascal"
  // pozycja := Pos('Pascal', tekst);
  // if pozycja > 0 then
  //   WriteLn('Czy zawiera "Pascal"? TAK (pozycja ', pozycja, ')')
  // else
  //   WriteLn('Czy zawiera "Pascal"? NIE');
  
  WriteLn();
  WriteLn('Naciśnij ENTER aby zakończyć...');
  ReadLn;
end.
