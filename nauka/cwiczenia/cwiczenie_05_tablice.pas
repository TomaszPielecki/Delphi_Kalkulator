program Cwiczenie05Tablice;

{*******************************************************************************
  ĆWICZENIE 5: Tablice statyczne i dynamiczne
  
  CEL:
  - Nauczyć się deklarować tablice statyczne
  - Wypełniać tablice danymi
  - Iterować po elementach tablicy
  - Obliczać statystyki (średnia, min, max)
  
  ZADANIE:
  Napisz program "Analiza ocen", który:
  1. Przechowa 5 ocen w tablicy
  2. Wyświetli wszystkie oceny
  3. Obliczy średnią ocen
  4. Znajdzie najniższą i najwyższą ocenę
  
  WSKAZÓWKI:
  - Deklaracja: oceny: array[1..5] of Integer;
  - Dostęp: oceny[1], oceny[2], ...
  - Length(tablica) - rozmiar tablicy
  - Low(tablica), High(tablica) - pierwszy i ostatni indeks
  
  PRZYKŁAD WYNIKU:
  Podaj ocenę 1: 5
  Podaj ocenę 2: 4
  Podaj ocenę 3: 3
  Podaj ocenę 4: 5
  Podaj ocenę 5: 4
  
  === ANALIZA OCEN ===
  Oceny: 5, 4, 3, 5, 4
  Średnia: 4.20
  Najniższa: 3
  Najwyższa: 5
*******************************************************************************}

{$mode delphi}
{$codepage utf8}

uses
  SysUtils
  {$IFDEF WINDOWS}, Windows{$ENDIF};

const
  ILE_OCEN = 5;

var
  oceny: array[1..ILE_OCEN] of Integer;
  i: Integer;
  suma, minimum, maksimum: Integer;
  srednia: Real;

begin
  {$IFDEF WINDOWS}
  SetConsoleOutputCP(CP_UTF8);
  SetConsoleCP(CP_UTF8);
  {$ENDIF}

  WriteLn('=== WPROWADZANIE OCEN ===');
  WriteLn();
  
  // TODO: Pobierz oceny od użytkownika
  // for i := 1 to ILE_OCEN do
  // begin
  //   Write('Podaj ocenę ', i, ': ');
  //   ReadLn(oceny[i]);
  // end;
  
  WriteLn();
  WriteLn('=== ANALIZA OCEN ===');
  
  // TODO: Wyświetl wszystkie oceny
  // Write('Oceny: ');
  // for i := 1 to ILE_OCEN do
  // begin
  //   Write(oceny[i]);
  //   if i < ILE_OCEN then
  //     Write(', ');
  // end;
  // WriteLn();
  
  // TODO: Oblicz sumę
  // suma := 0;
  // for i := 1 to ILE_OCEN do
  //   suma := suma + oceny[i];
  
  // TODO: Oblicz średnią
  // srednia := suma / ILE_OCEN;
  // WriteLn('Średnia: ', srednia:0:2);
  
  // TODO: Znajdź minimum i maksimum
  // minimum := oceny[1];
  // maksimum := oceny[1];
  // for i := 2 to ILE_OCEN do
  // begin
  //   if oceny[i] < minimum then
  //     minimum := oceny[i];
  //   if oceny[i] > maksimum then
  //     maksimum := oceny[i];
  // end;
  
  // WriteLn('Najniższa: ', minimum);
  // WriteLn('Najwyższa: ', maksimum);
  
  WriteLn();
  WriteLn('Naciśnij ENTER aby zakończyć...');
  ReadLn;
end.
