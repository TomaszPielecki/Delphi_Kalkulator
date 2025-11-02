program Cwiczenie03IfCase;

{*******************************************************************************
  ĆWICZENIE 3: Instrukcje warunkowe (if-then-else, case)
  
  CEL:
  - Nauczyć się używać instrukcji if-then-else
  - Poznać instrukcję case dla wielu warunków
  - Tworzyć menu wyboru
  
  ZADANIE:
  Napisz program "Klasyfikator oceny", który:
  1. Pobierze ocenę 1-6 od użytkownika
  2. Za pomocą instrukcji case wyświetli słowny opis oceny
  3. Za pomocą if sprawdzi, czy ocena jest pozytywna (≥2)
  
  WSKAZÓWKI:
  - if warunek then akcja else inna_akcja;
  - case zmienna of
      wartość1: akcja1;
      wartość2: akcja2;
    end;
  
  PRZYKŁAD WYNIKU:
  Podaj ocenę (1-6): 5
  
  Ocena: bardzo dobry
  Status: To jest ocena pozytywna! ✓
*******************************************************************************}

{$mode delphi}
{$codepage utf8}

uses
  SysUtils
  {$IFDEF WINDOWS}, Windows{$ENDIF};

var
  ocena: Integer;
  opisOceny: String;

begin
  {$IFDEF WINDOWS}
  SetConsoleOutputCP(CP_UTF8);
  SetConsoleCP(CP_UTF8);
  {$ENDIF}

  WriteLn('=== KLASYFIKATOR OCENY ===');
  WriteLn();
  
  Write('Podaj ocenę (1-6): ');
  ReadLn(ocena);
  
  WriteLn();
  
  // TODO: Użyj instrukcji case do określenia opisu oceny
  // case ocena of
  //   1: opisOceny := 'niedostateczny';
  //   2: opisOceny := 'dopuszczający';
  //   3: opisOceny := 'dostateczny';
  //   4: opisOceny := 'dobry';
  //   5: opisOceny := 'bardzo dobry';
  //   6: opisOceny := 'celujący';
  // else
  //   opisOceny := 'nieprawidłowa ocena';
  // end;
  
  // WriteLn('Ocena: ', opisOceny);
  // WriteLn();
  
  // TODO: Użyj instrukcji if do sprawdzenia, czy ocena jest pozytywna
  // if ocena >= 2 then
  //   WriteLn('Status: To jest ocena pozytywna! ✓')
  // else
  //   WriteLn('Status: Niestety, to ocena negatywna ✗');
  
  WriteLn();
  WriteLn('Naciśnij ENTER aby zakończyć...');
  ReadLn;
end.
