program Kalkulator;

{$APPTYPE CONSOLE}
{$CODEPAGE UTF8}

uses
  SysUtils, Math
  {$IFDEF WINDOWS}, Windows{$ENDIF};

type
  TOperacja = (opDodawanie, opOdejmowanie, opMnozenie, opDzielenie, 
               opPotegowanie, opPierwiastek, opSinus, opCosinus, opHistoria, opWyjscie);

var
  Historia: array of string;
  IloscHistorii: Integer = 0;

procedure UstawKodowanie;
begin
  SetConsoleOutputCP(65001);
  SetConsoleCP(65001);
end;

procedure DodajDoHistorii(operacja: string; wynik: Double);
begin
  SetLength(Historia, IloscHistorii + 1);
  Historia[IloscHistorii] := Format('%s = %.4f', [operacja, wynik]);
  Inc(IloscHistorii);
end;

procedure PokazHistorie;
var
  i: Integer;
begin
  WriteLn('');
  WriteLn('=== HISTORIA OBLICZEN ===');
  if IloscHistorii = 0 then
  begin
    WriteLn('Brak historii obliczen.');
  end
  else
  begin
    for i := 0 to IloscHistorii - 1 do
      WriteLn(Format('%d. %s', [i + 1, Historia[i]]));
  end;
  WriteLn('');
end;

procedure PokazMenu;
begin
  WriteLn('');
  WriteLn('+======================================+');
  WriteLn('|        KALKULATOR DELPHI             |');
  WriteLn('+======================================+');
  WriteLn('| 1. [+] Dodawanie                     |');
  WriteLn('| 2. [-] Odejmowanie                   |');
  WriteLn('| 3. [*] Mnozenie                      |');
  WriteLn('| 4. [/] Dzielenie                     |');
  WriteLn('| 5. [^] Potegowanie                   |');
  WriteLn('| 6. [√] Pierwiastek kwadratowy        |');
  WriteLn('| 7. [sin] Sinus (stopnie)             |');
  WriteLn('| 8. [cos] Cosinus (stopnie)           |');
  WriteLn('| 9. [H] Historia obliczen             |');
  WriteLn('| 0. [X] Wyjscie                       |');
  WriteLn('+======================================+');
  Write('Wybierz opcje (0-9): ');
end;

function WczytajLiczbe(komunikat: string): Double;
var
  input: string;
  wynik: Double;
  kod: Integer;
begin
  repeat
    Write(komunikat);
    ReadLn(input);
    Val(input, wynik, kod);
    if kod <> 0 then
      WriteLn('❌ Błąd! Wprowadź poprawną liczbę.');
  until kod = 0;
  Result := wynik;
end;

function WczytajOpcje: TOperacja;
var
  wybor: Integer;
  input: string;
  kod: Integer;
begin
  repeat
    ReadLn(input);
    Val(input, wybor, kod);
    if (kod <> 0) or (wybor < 0) or (wybor > 9) then
      WriteLn('❌ Błąd! Wybierz opcję od 0 do 9.');
  until (kod = 0) and (wybor >= 0) and (wybor <= 9);
  
  // Mapowanie: 1->opDodawanie(0), 2->opOdejmowanie(1), ..., 9->opHistoria(8), 0->opWyjscie(9)
  case wybor of
    1: Result := opDodawanie;
    2: Result := opOdejmowanie;
    3: Result := opMnozenie;
    4: Result := opDzielenie;
    5: Result := opPotegowanie;
    6: Result := opPierwiastek;
    7: Result := opSinus;
    8: Result := opCosinus;
    9: Result := opHistoria;
    0: Result := opWyjscie;
  else
    Result := opWyjscie;
  end;
end;

procedure WykonajOperacje(op: TOperacja);
var
  a, b, wynik: Double;
  operacjaStr: string;
begin
  case op of
    opDodawanie:
    begin
      a := WczytajLiczbe('Podaj pierwszą liczbę: ');
      b := WczytajLiczbe('Podaj drugą liczbę: ');
      wynik := a + b;
      operacjaStr := Format('%.2f + %.2f', [a, b]);
      WriteLn(Format('✅ Wynik: %.4f', [wynik]));
      DodajDoHistorii(operacjaStr, wynik);
    end;
    
    opOdejmowanie:
    begin
      a := WczytajLiczbe('Podaj pierwszą liczbę: ');
      b := WczytajLiczbe('Podaj drugą liczbę: ');
      wynik := a - b;
      operacjaStr := Format('%.2f - %.2f', [a, b]);
      WriteLn(Format('✅ Wynik: %.4f', [wynik]));
      DodajDoHistorii(operacjaStr, wynik);
    end;
    
    opMnozenie:
    begin
      a := WczytajLiczbe('Podaj pierwszą liczbę: ');
      b := WczytajLiczbe('Podaj drugą liczbę: ');
      wynik := a * b;
      operacjaStr := Format('%.2f × %.2f', [a, b]);
      WriteLn(Format('✅ Wynik: %.4f', [wynik]));
      DodajDoHistorii(operacjaStr, wynik);
    end;
    
    opDzielenie:
    begin
      a := WczytajLiczbe('Podaj pierwszą liczbę: ');
      b := WczytajLiczbe('Podaj drugą liczbę: ');
      if b = 0 then
        WriteLn('[BLAD] Nie mozna dzielic przez zero.')
      else
      begin
        wynik := a / b;
        operacjaStr := Format('%.2f / %.2f', [a, b]);
        WriteLn(Format('[OK] Wynik: %.4f', [wynik]));
        DodajDoHistorii(operacjaStr, wynik);
      end;
    end;
    
    opPotegowanie:
    begin
      a := WczytajLiczbe('Podaj podstawę: ');
      b := WczytajLiczbe('Podaj wykładnik: ');
      wynik := Exp(b * Ln(a));
      operacjaStr := Format('%.2f ^ %.2f', [a, b]);
      WriteLn(Format('✅ Wynik: %.4f', [wynik]));
      DodajDoHistorii(operacjaStr, wynik);
    end;
    
    opPierwiastek:
    begin
      a := WczytajLiczbe('Podaj liczbę: ');
      if a < 0 then
        WriteLn('❌ Błąd! Nie można wyciągnąć pierwiastka z liczby ujemnej.')
      else
      begin
        wynik := Sqrt(a);
        operacjaStr := Format('√%.2f', [a]);
        WriteLn(Format('✅ Wynik: %.4f', [wynik]));
        DodajDoHistorii(operacjaStr, wynik);
      end;
    end;
    
    opSinus:
    begin
      a := WczytajLiczbe('Podaj kąt w stopniach: ');
      wynik := Sin(a * Pi / 180);
      operacjaStr := Format('sin(%.2f°)', [a]);
      WriteLn(Format('✅ Wynik: %.4f', [wynik]));
      DodajDoHistorii(operacjaStr, wynik);
    end;
    
    opCosinus:
    begin
      a := WczytajLiczbe('Podaj kąt w stopniach: ');
      wynik := Cos(a * Pi / 180);
      operacjaStr := Format('cos(%.2f°)', [a]);
      WriteLn(Format('✅ Wynik: %.4f', [wynik]));
      DodajDoHistorii(operacjaStr, wynik);
    end;
    
    opHistoria:
    begin
      PokazHistorie;
    end;
  end;
end;

// Program główny
var
  operacja: TOperacja;
  kontynuuj: Boolean;
  
begin
  try
    UstawKodowanie;
    kontynuuj := True;
    
    WriteLn('Witaj w Kalkulatorze Delphi!');
    WriteLn('Zaawansowany kalkulator z historia obliczen');
    
    while kontynuuj do
    begin
      PokazMenu;
      operacja := WczytajOpcje;
      
      if operacja = opWyjscie then
      begin
        kontynuuj := False;
        WriteLn('');
        WriteLn('Dziekuje za korzystanie z kalkulatora!');
        if IloscHistorii > 0 then
          WriteLn(Format('Wykonales %d obliczen.', [IloscHistorii]));
      end
      else
      begin
        WykonajOperacje(operacja);
        WriteLn('');
        Write('Naciśnij Enter aby kontynuować...');
        ReadLn;
      end;
    end;
    
  except
    on E: Exception do
    begin
      WriteLn('💥 Wystąpił błąd: ' + E.Message);
      ReadLn;
    end;
  end;
end.