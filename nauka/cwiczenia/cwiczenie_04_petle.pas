program Cwiczenie04Petle;

{*******************************************************************************
  ĆWICZENIE 4: Pętle (for, while, repeat-until)
  
  CEL:
  - Opanować pętlę for do iteracji
  - Nauczyć się używać while (pętla z warunkiem na początku)
  - Poznać repeat-until (pętla z warunkiem na końcu)
  
  ZADANIE:
  Napisz program, który:
  1. Za pomocą pętli for wyświetli tabliczkę mnożenia (np. dla 5)
  2. Za pomocą while policzy sumę liczb od 1 do 10
  3. Za pomocą repeat-until pobierze liczby od użytkownika aż do wpisania 0
  
  WSKAZÓWKI:
  - for i := 1 to 10 do ...
  - while warunek do ...
  - repeat ... until warunek;
  
  PRZYKŁAD WYNIKU:
  === TABLICZKA MNOŻENIA DLA 5 ===
  5 x 1 = 5
  5 x 2 = 10
  ...
  
  === SUMA 1 DO 10 ===
  Suma = 55
  
  === POBIERANIE LICZB (0 = koniec) ===
  Podaj liczbę: 5
  Podaj liczbę: 10
  Podaj liczbę: 0
  Suma wszystkich: 15
*******************************************************************************}

{$mode delphi}
{$codepage utf8}

uses
  SysUtils
  {$IFDEF WINDOWS}, Windows{$ENDIF};

var
  i, liczba: Integer;
  suma: Integer;

begin
  {$IFDEF WINDOWS}
  SetConsoleOutputCP(CP_UTF8);
  SetConsoleCP(CP_UTF8);
  {$ENDIF}

  // CZĘŚĆ 1: Pętla FOR - tabliczka mnożenia
  WriteLn('=== TABLICZKA MNOŻENIA DLA 5 ===');
  
  // TODO: Użyj pętli for do wyświetlenia tabliczki mnożenia dla 5
  // for i := 1 to 10 do
  // begin
  //   WriteLn('5 x ', i, ' = ', 5 * i);
  // end;
  
  WriteLn();
  
  // CZĘŚĆ 2: Pętla WHILE - suma liczb od 1 do 10
  WriteLn('=== SUMA 1 DO 10 ===');
  suma := 0;
  i := 1;
  
  // TODO: Użyj pętli while do obliczenia sumy
  // while i <= 10 do
  // begin
  //   suma := suma + i;
  //   Inc(i);  // Inc(i) to to samo co i := i + 1
  // end;
  
  // WriteLn('Suma = ', suma);
  WriteLn();
  
  // CZĘŚĆ 3: Pętla REPEAT-UNTIL - pobieranie liczb
  WriteLn('=== POBIERANIE LICZB (0 = koniec) ===');
  suma := 0;
  
  // TODO: Użyj pętli repeat-until do pobierania liczb
  // repeat
  //   Write('Podaj liczbę: ');
  //   ReadLn(liczba);
  //   if liczba <> 0 then
  //     suma := suma + liczba;
  // until liczba = 0;
  
  // WriteLn('Suma wszystkich: ', suma);
  WriteLn();
  
  WriteLn('Naciśnij ENTER aby zakończyć...');
  ReadLn;
end.
