program Cwiczenie10MiniProjekt;

{*******************************************************************************
  ĆWICZENIE 10: Mini projekt - Kalkulator naukowy (Tydzień 1-2)
  
  CEL:
  - Połączyć wszystkie dotychczasowe umiejętności
  - Stworzyć funkcjonalny program z menu
  - Użyć: zmiennych, operatorów, warunków, pętli, tablic, procedur, funkcji
  
  ZADANIE:
  Napisz prosty kalkulator naukowy, który:
  1. Wyświetla menu z opcjami: +, -, *, /, potęga, pierwiastek, historia
  2. Wykonuje obliczenia
  3. Zapisuje historię ostatnich 10 operacji w tablicy
  4. Pozwala przeglądać historię
  5. Działa w pętli aż do wyboru "0 - Wyjście"
  
  WYMAGANIA:
  - Menu w osobnej procedurze
  - Każda operacja w osobnej funkcji
  - Historia w tablicy globalnej
  - Procedura wyświetlająca historię
  - Obsługa błędów (dzielenie przez 0)
  
  PRZYKŁAD WYNIKU:
  === KALKULATOR NAUKOWY ===
  1. Dodawanie
  2. Odejmowanie
  3. Mnożenie
  4. Dzielenie
  5. Potęga
  6. Pierwiastek
  7. Historia
  0. Wyjście
  Wybór: 1
  
  Liczba a: 5
  Liczba b: 3
  Wynik: 5 + 3 = 8
  
  [Zapisano w historii]
*******************************************************************************}

{$mode delphi}
{$codepage utf8}

uses
  SysUtils, Math
  {$IFDEF WINDOWS}, Windows{$ENDIF};

const
  MAX_HISTORIA = 10;

type
  TOperacja = (opDodawanie, opOdejmowanie, opMnozenie, opDzielenie, opPotega);
  
  TZapisHistorii = record
    operacja: TOperacja;
    a, b: Real;
    wynik: Real;
  end;

var
  historia: array[1..MAX_HISTORIA] of TZapisHistorii;
  liczbaWpisow: Integer;

// TODO: Procedura wyświetlająca menu
procedure WyswietlMenu;
begin
  WriteLn();
  WriteLn('=== KALKULATOR NAUKOWY ===');
  WriteLn('1. Dodawanie');
  WriteLn('2. Odejmowanie');
  WriteLn('3. Mnożenie');
  WriteLn('4. Dzielenie');
  WriteLn('5. Potęga');
  WriteLn('6. Pierwiastek kwadratowy');
  WriteLn('7. Historia');
  WriteLn('0. Wyjście');
  Write('Wybór: ');
end;

// TODO: Funkcje dla operacji matematycznych
function Dodaj(a, b: Real): Real;
begin
  Result := a + b;
end;

function Odejmij(a, b: Real): Real;
begin
  Result := a - b;
end;

// TODO: Dodaj pozostałe funkcje: Pomnoz, Podziel, Potega

// TODO: Procedura dodająca do historii
procedure DodajDoHistorii(op: TOperacja; a, b, wynik: Real);
begin
  if liczbaWpisow < MAX_HISTORIA then
    Inc(liczbaWpisow)
  else
  begin
    // Przesuń historię (usuń najstarszy wpis)
    // for i := 1 to MAX_HISTORIA - 1 do
    //   historia[i] := historia[i + 1];
  end;
  
  // historia[liczbaWpisow].operacja := op;
  // historia[liczbaWpisow].a := a;
  // historia[liczbaWpisow].b := b;
  // historia[liczbaWpisow].wynik := wynik;
end;

// TODO: Procedura wyświetlająca historię
procedure WyswietlHistorie;
var
  i: Integer;
  symbol: String;
begin
  WriteLn();
  WriteLn('=== HISTORIA OBLICZEŃ ===');
  
  if liczbaWpisow = 0 then
  begin
    WriteLn('Brak historii');
    Exit;
  end;
  
  // TODO: Wyświetl wszystkie wpisy z historii
  // for i := 1 to liczbaWpisow do
  // begin
  //   case historia[i].operacja of
  //     opDodawanie: symbol := '+';
  //     opOdejmowanie: symbol := '-';
  //     opMnozenie: symbol := '*';
  //     opDzielenie: symbol := '/';
  //     opPotega: symbol := '^';
  //   end;
  //   
  //   WriteLn(i, '. ', historia[i].a:0:2, ' ', symbol, ' ', 
  //           historia[i].b:0:2, ' = ', historia[i].wynik:0:2);
  // end;
end;

var
  wybor: Integer;
  a, b, wynik: Real;
  dzialaj: Boolean;

begin
  {$IFDEF WINDOWS}
  SetConsoleOutputCP(CP_UTF8);
  SetConsoleCP(CP_UTF8);
  {$ENDIF}

  liczbaWpisow := 0;
  dzialaj := True;
  
  WriteLn('Witaj w Kalkulatorze Naukowym!');
  
  // TODO: Pętla główna programu
  while dzialaj do
  begin
    WyswietlMenu;
    ReadLn(wybor);
    
    case wybor of
      0: begin
           WriteLn('Do widzenia!');
           dzialaj := False;
         end;
         
      1..5: begin
              Write('Liczba a: ');
              ReadLn(a);
              Write('Liczba b: ');
              ReadLn(b);
              
              // TODO: Wykonaj odpowiednią operację
              // case wybor of
              //   1: wynik := Dodaj(a, b);
              //   2: wynik := Odejmij(a, b);
              //   // ... itd
              // end;
              
              // WriteLn('Wynik: ', wynik:0:2);
              // DodajDoHistorii(TOperacja(wybor - 1), a, b, wynik);
            end;
            
      6: begin
           Write('Liczba: ');
           ReadLn(a);
           if a >= 0 then
             WriteLn('Pierwiastek: ', Sqrt(a):0:2)
           else
             WriteLn('BŁĄD: Nie można wyciągnąć pierwiastka z liczby ujemnej!');
         end;
         
      7: WyswietlHistorie;
      
    else
      WriteLn('Nieprawidłowy wybór!');
    end;
  end;
  
  WriteLn();
  WriteLn('Naciśnij ENTER aby zakończyć...');
  ReadLn;
end.
