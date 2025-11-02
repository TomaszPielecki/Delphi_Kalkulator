program ManagerKontaktow;

{$APPTYPE CONSOLE}
{$CODEPAGE UTF8}

uses
  SysUtils, Classes, Windows;

type
  TKontakt = record
    ID: Integer;
    Imie: string;
    Nazwisko: string;
    Telefon: string;
    Email: string;
    Miasto: string;
  end;
  
  TListaKontaktow = array of TKontakt;

var
  Kontakty: TListaKontaktow;
  IloscKontaktow: Integer = 0;
  NastepneID: Integer = 1;
  NazwaPliku: string = 'kontakty.txt';

procedure UstawKodowanie;
begin
  SetConsoleOutputCP(65001);
  SetConsoleCP(65001);
end;

procedure PokazMenu;
begin
  WriteLn('');
  WriteLn('+=========================================+');
  WriteLn('|         MANAGER KONTAKTOW               |');
  WriteLn('+=========================================+');
  WriteLn('| 1. [+] Dodaj kontakt                    |');
  WriteLn('| 2. [L] Lista wszystkich kontaktow       |');
  WriteLn('| 3. [S] Szukaj kontaktu                  |');
  WriteLn('| 4. [E] Edytuj kontakt                   |');
  WriteLn('| 5. [D] Usun kontakt                     |');
  WriteLn('| 6. [F] Zapisz do pliku                  |');
  WriteLn('| 7. [O] Wczytaj z pliku                  |');
  WriteLn('| 8. [I] Statystyki                       |');
  WriteLn('| 0. [X] Wyjscie                          |');
  WriteLn('+=========================================+');
  Write('Wybierz opcje (0-8): ');
end;

function WczytajString(komunikat: string): string;
var
  wynik: string;
begin
  Write(komunikat);
  ReadLn(wynik);
  Result := Trim(wynik);
end;

function WczytajLiczbe(komunikat: string): Integer;
var
  input: string;
  wynik: Integer;
  kod: Integer;
begin
  repeat
    Write(komunikat);
    ReadLn(input);
    Val(input, wynik, kod);
    if kod <> 0 then
      WriteLn('[BLAD] Wprowadz poprawna liczbe.');
  until kod = 0;
  Result := wynik;
end;

procedure DodajKontakt;
var
  kontakt: TKontakt;
begin
  WriteLn('');
  WriteLn('=== DODAWANIE NOWEGO KONTAKTU ===');
  
  kontakt.ID := NastepneID;
  Inc(NastepneID);
  
  kontakt.Imie := WczytajString('Imie: ');
  kontakt.Nazwisko := WczytajString('Nazwisko: ');
  kontakt.Telefon := WczytajString('Telefon: ');
  kontakt.Email := WczytajString('Email: ');
  kontakt.Miasto := WczytajString('Miasto: ');
  
  // Dodaj do tablicy
  SetLength(Kontakty, IloscKontaktow + 1);
  Kontakty[IloscKontaktow] := kontakt;
  Inc(IloscKontaktow);
  
  WriteLn(Format('[OK] Kontakt %s %s zostal dodany z ID: %d', 
    [kontakt.Imie, kontakt.Nazwisko, kontakt.ID]));
end;

procedure PokazKontakt(kontakt: TKontakt);
begin
  WriteLn(Format('ID: %d | %s %s', [kontakt.ID, kontakt.Imie, kontakt.Nazwisko]));
  WriteLn(Format('  Tel: %s | Email: %s', [kontakt.Telefon, kontakt.Email]));
  WriteLn(Format('  Miasto: %s', [kontakt.Miasto]));
  WriteLn('---');
end;

procedure ListujKontakty;
var
  i: Integer;
begin
  WriteLn('');
  WriteLn('=== LISTA KONTAKTOW ===');
  if IloscKontaktow = 0 then
  begin
    WriteLn('Brak kontaktow w bazie.');
  end
  else
  begin
    WriteLn(Format('Znaleziono %d kontaktow:', [IloscKontaktow]));
    WriteLn('');
    for i := 0 to IloscKontaktow - 1 do
      PokazKontakt(Kontakty[i]);
  end;
end;

procedure SzukajKontaktu;
var
  szukany: string;
  i: Integer;
  znaleziono: Boolean;
begin
  WriteLn('');
  WriteLn('=== WYSZUKIWANIE KONTAKTU ===');
  szukany := WczytajString('Wprowadz imie, nazwisko lub telefon: ');
  szukany := LowerCase(szukany);
  
  znaleziono := False;
  WriteLn('');
  WriteLn('Wyniki wyszukiwania:');
  WriteLn('');
  
  for i := 0 to IloscKontaktow - 1 do
  begin
    if (Pos(szukany, LowerCase(Kontakty[i].Imie)) > 0) or
       (Pos(szukany, LowerCase(Kontakty[i].Nazwisko)) > 0) or
       (Pos(szukany, LowerCase(Kontakty[i].Telefon)) > 0) then
    begin
      PokazKontakt(Kontakty[i]);
      znaleziono := True;
    end;
  end;
  
  if not znaleziono then
    WriteLn('Nie znaleziono kontaktow pasujacych do kryteriow.');
end;

function ZnajdzKontaktPoID(id: Integer): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to IloscKontaktow - 1 do
    if Kontakty[i].ID = id then
    begin
      Result := i;
      Break;
    end;
end;

procedure EdytujKontakt;
var
  id: Integer;
  indeks: Integer;
  nowa_wartosc: string;
begin
  WriteLn('');
  WriteLn('=== EDYCJA KONTAKTU ===');
  
  if IloscKontaktow = 0 then
  begin
    WriteLn('Brak kontaktow do edycji.');
    Exit;
  end;
  
  id := WczytajLiczbe('Podaj ID kontaktu do edycji: ');
  indeks := ZnajdzKontaktPoID(id);
  
  if indeks = -1 then
  begin
    WriteLn('[BLAD] Nie znaleziono kontaktu o podanym ID.');
    Exit;
  end;
  
  WriteLn('');
  WriteLn('Aktualny kontakt:');
  PokazKontakt(Kontakty[indeks]);
  
  WriteLn('Wprowadz nowe dane (Enter = bez zmian):');
  
  nowa_wartosc := WczytajString(Format('Imie [%s]: ', [Kontakty[indeks].Imie]));
  if nowa_wartosc <> '' then
    Kontakty[indeks].Imie := nowa_wartosc;
    
  nowa_wartosc := WczytajString(Format('Nazwisko [%s]: ', [Kontakty[indeks].Nazwisko]));
  if nowa_wartosc <> '' then
    Kontakty[indeks].Nazwisko := nowa_wartosc;
    
  nowa_wartosc := WczytajString(Format('Telefon [%s]: ', [Kontakty[indeks].Telefon]));
  if nowa_wartosc <> '' then
    Kontakty[indeks].Telefon := nowa_wartosc;
    
  nowa_wartosc := WczytajString(Format('Email [%s]: ', [Kontakty[indeks].Email]));
  if nowa_wartosc <> '' then
    Kontakty[indeks].Email := nowa_wartosc;
    
  nowa_wartosc := WczytajString(Format('Miasto [%s]: ', [Kontakty[indeks].Miasto]));
  if nowa_wartosc <> '' then
    Kontakty[indeks].Miasto := nowa_wartosc;
  
  WriteLn('[OK] Kontakt zostal zaktualizowany.');
end;

procedure UsunKontakt;
var
  id: Integer;
  indeks: Integer;
  i: Integer;
  potwierdzenie: string;
begin
  WriteLn('');
  WriteLn('=== USUWANIE KONTAKTU ===');
  
  if IloscKontaktow = 0 then
  begin
    WriteLn('Brak kontaktow do usuniecia.');
    Exit;
  end;
  
  id := WczytajLiczbe('Podaj ID kontaktu do usuniecia: ');
  indeks := ZnajdzKontaktPoID(id);
  
  if indeks = -1 then
  begin
    WriteLn('[BLAD] Nie znaleziono kontaktu o podanym ID.');
    Exit;
  end;
  
  WriteLn('');
  WriteLn('Kontakt do usuniecia:');
  PokazKontakt(Kontakty[indeks]);
  
  potwierdzenie := WczytajString('Czy na pewno usunac? (tak/nie): ');
  
  if LowerCase(potwierdzenie) = 'tak' then
  begin
    // Przesuń elementy tablicy
    for i := indeks to IloscKontaktow - 2 do
      Kontakty[i] := Kontakty[i + 1];
    
    Dec(IloscKontaktow);
    SetLength(Kontakty, IloscKontaktow);
    
    WriteLn('[OK] Kontakt zostal usuniety.');
  end
  else
    WriteLn('[INFO] Anulowano usuwanie.');
end;

procedure ZapiszDoPliku;
var
  plik: TextFile;
  i: Integer;
begin
  WriteLn('');
  WriteLn('=== ZAPIS DO PLIKU ===');
  
  try
    AssignFile(plik, NazwaPliku);
    Rewrite(plik);
    
    // Zapisz nagłówek z ilością kontaktów
    WriteLn(plik, IloscKontaktow);
    WriteLn(plik, NastepneID);
    
    // Zapisz każdy kontakt
    for i := 0 to IloscKontaktow - 1 do
    begin
      WriteLn(plik, Kontakty[i].ID);
      WriteLn(plik, Kontakty[i].Imie);
      WriteLn(plik, Kontakty[i].Nazwisko);
      WriteLn(plik, Kontakty[i].Telefon);
      WriteLn(plik, Kontakty[i].Email);
      WriteLn(plik, Kontakty[i].Miasto);
    end;
    
    CloseFile(plik);
    WriteLn(Format('[OK] Zapisano %d kontaktow do pliku: %s', [IloscKontaktow, NazwaPliku]));
    
  except
    on E: Exception do
      WriteLn('[BLAD] Nie mozna zapisac pliku: ' + E.Message);
  end;
end;

procedure WczytajZPliku;
var
  plik: TextFile;
  i: Integer;
begin
  WriteLn('');
  WriteLn('=== WCZYTYWANIE Z PLIKU ===');
  
  if not FileExists(NazwaPliku) then
  begin
    WriteLn(Format('[INFO] Plik %s nie istnieje.', [NazwaPliku]));
    Exit;
  end;
  
  try
    AssignFile(plik, NazwaPliku);
    Reset(plik);
    
    // Wczytaj nagłówek
    ReadLn(plik, IloscKontaktow);
    ReadLn(plik, NastepneID);
    
    // Przygotuj tablicę
    SetLength(Kontakty, IloscKontaktow);
    
    // Wczytaj każdy kontakt
    for i := 0 to IloscKontaktow - 1 do
    begin
      ReadLn(plik, Kontakty[i].ID);
      ReadLn(plik, Kontakty[i].Imie);
      ReadLn(plik, Kontakty[i].Nazwisko);
      ReadLn(plik, Kontakty[i].Telefon);
      ReadLn(plik, Kontakty[i].Email);
      ReadLn(plik, Kontakty[i].Miasto);
    end;
    
    CloseFile(plik);
    WriteLn(Format('[OK] Wczytano %d kontaktow z pliku: %s', [IloscKontaktow, NazwaPliku]));
    
  except
    on E: Exception do
      WriteLn('[BLAD] Nie mozna wczytac pliku: ' + E.Message);
  end;
end;

procedure PokazStatystyki;
var
  i: Integer;
  miastaCount: array of record
    Nazwa: string;
    Ilosc: Integer;
  end;
  j: Integer;
  znaleziono: Boolean;
  najczesciejsze: string;
  maxIlosc: Integer;
begin
  WriteLn('');
  WriteLn('=== STATYSTYKI ===');
  WriteLn(Format('Laczna ilosc kontaktow: %d', [IloscKontaktow]));
  
  if IloscKontaktow = 0 then
    Exit;
    
  WriteLn(Format('Nastepne ID: %d', [NastepneID]));
  
  // Statystyki miast
  SetLength(miastaCount, 0);
  for i := 0 to IloscKontaktow - 1 do
  begin
    if Kontakty[i].Miasto <> '' then
    begin
      znaleziono := False;
      for j := 0 to High(miastaCount) do
      begin
        if LowerCase(miastaCount[j].Nazwa) = LowerCase(Kontakty[i].Miasto) then
        begin
          Inc(miastaCount[j].Ilosc);
          znaleziono := True;
          Break;
        end;
      end;
      
      if not znaleziono then
      begin
        SetLength(miastaCount, Length(miastaCount) + 1);
        miastaCount[High(miastaCount)].Nazwa := Kontakty[i].Miasto;
        miastaCount[High(miastaCount)].Ilosc := 1;
      end;
    end;
  end;
  
  if Length(miastaCount) > 0 then
  begin
    WriteLn('');
    WriteLn('Roklad miast:');
    najczesciejsze := '';
    maxIlosc := 0;
    
    for i := 0 to High(miastaCount) do
    begin
      WriteLn(Format('  %s: %d osob', [miastaCount[i].Nazwa, miastaCount[i].Ilosc]));
      if miastaCount[i].Ilosc > maxIlosc then
      begin
        maxIlosc := miastaCount[i].Ilosc;
        najczesciejsze := miastaCount[i].Nazwa;
      end;
    end;
    
    WriteLn(Format('Najczesciejsze miasto: %s (%d osob)', [najczesciejsze, maxIlosc]));
  end;
end;

// Program główny
var
  wybor: Integer;
  input: string;
  kod: Integer;
  kontynuuj: Boolean;
  
begin
  try
    UstawKodowanie;
    kontynuuj := True;
    
    WriteLn('Witaj w Managerze Kontaktow!');
    WriteLn('System zarzadzania baza kontaktow');
    
    // Spróbuj wczytać dane z pliku przy starcie
    if FileExists(NazwaPliku) then
    begin
      WriteLn(Format('Znaleziono plik: %s', [NazwaPliku]));
      WczytajZPliku;
    end;
    
    while kontynuuj do
    begin
      PokazMenu;
      
      ReadLn(input);
      Val(input, wybor, kod);
      
      if (kod <> 0) or (wybor < 0) or (wybor > 8) then
      begin
        WriteLn('[BLAD] Wybierz opcje od 0 do 8.');
        Continue;
      end;
      
      case wybor of
        1: DodajKontakt;
        2: ListujKontakty;
        3: SzukajKontaktu;
        4: EdytujKontakt;
        5: UsunKontakt;
        6: ZapiszDoPliku;
        7: WczytajZPliku;
        8: PokazStatystyki;
        0: begin
          kontynuuj := False;
          WriteLn('');
          WriteLn('Czy chcesz zapisac zmiany przed wyjsciem? (tak/nie)');
          ReadLn(input);
          if LowerCase(Trim(input)) = 'tak' then
            ZapiszDoPliku;
          WriteLn('Dziekuje za korzystanie z Managera Kontaktow!');
        end;
      end;
      
      if kontynuuj then
      begin
        WriteLn('');
        Write('Nacisnij Enter aby kontynuowac...');
        ReadLn;
      end;
    end;
    
  except
    on E: Exception do
    begin
      WriteLn('[BLAD] Wystapil blad: ' + E.Message);
      ReadLn;
    end;
  end;
end.