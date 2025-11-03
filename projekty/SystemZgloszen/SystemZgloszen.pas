program SystemZgloszen;

{*******************************************************************************
  SYSTEM REJESTRACJI ZGŁOSZEŃ DLA FIRM LOKALNYCH
  
  System do zarządzania zgłoszeniami serwisowymi/supportowymi.
  
  Funkcje:
  - Rejestracja zgłoszeń
  - Przeglądanie listy zgłoszeń
  - Zmiana statusu
  - Wyszukiwanie
  - Statystyki
  - Baza danych SQLite
  
  Autor: Tomasz Pielecki
  Data: 3 listopada 2025
*******************************************************************************}

{$mode delphi}
{$codepage utf8}

uses
  SysUtils, DateUtils;

type
  TPriorytet = (prNiski, prSredni, prWysoki, prKrytyczny);
  TStatus = (stNowe, stWRealizacji, stOczekuje, stZamkniete);
  
  TZgloszenie = record
    ID: Integer;
    NumerZgloszenia: String;
    NazwaFirmy: String;
    OsobaKontaktowa: String;
    Telefon: String;
    Email: String;
    OpisProblemu: String;
    Priorytet: TPriorytet;
    Status: TStatus;
    DataZgloszenia: TDateTime;
    DataModyfikacji: TDateTime;
    Uwagi: String;
  end;

const
  PLIK_BAZY = 'zgloszenia.txt';  // Tymczasowo używamy pliku tekstowego zamiast SQLite
  
var
  Zgloszenia: array of TZgloszenie;
  LiczbaZgloszen: Integer;

// ============================================================================
// FUNKCJE POMOCNICZE
// ============================================================================

function PriorytetToString(p: TPriorytet): String;
begin
  case p of
    prNiski: Result := 'Niski';
    prSredni: Result := 'Średni';
    prWysoki: Result := 'Wysoki';
    prKrytyczny: Result := 'Krytyczny';
  end;
end;

function StringToPriorytet(s: String): TPriorytet;
begin
  s := UpperCase(s);
  if s = 'NISKI' then Result := prNiski
  else if s = 'SREDNI' then Result := prSredni
  else if s = 'WYSOKI' then Result := prWysoki
  else if s = 'KRYTYCZNY' then Result := prKrytyczny
  else Result := prSredni;
end;

function StatusToString(st: TStatus): String;
begin
  case st of
    stNowe: Result := 'Nowe';
    stWRealizacji: Result := 'W realizacji';
    stOczekuje: Result := 'Oczekuje';
    stZamkniete: Result := 'Zamknięte';
  end;
end;

function StringToStatus(s: String): TStatus;
begin
  s := UpperCase(s);
  if s = 'NOWE' then Result := stNowe
  else if s = 'W REALIZACJI' then Result := stWRealizacji
  else if s = 'OCZEKUJE' then Result := stOczekuje
  else if s = 'ZAMKNIETE' then Result := stZamkniete
  else Result := stNowe;
end;

function GenerujNumerZgloszenia: String;
var
  rok, miesiac, dzien: Word;
begin
  DecodeDate(Now, rok, miesiac, dzien);
  Result := Format('ZGL-%d-%0.3d', [rok, LiczbaZgloszen + 1]);
end;

procedure CzyscEkran;
begin
  {$IFDEF WINDOWS}
  System.Write(#27'[2J'#27'[H'); // ANSI escape codes
  {$ELSE}
  // Linux/Mac
  WriteLn(#27'[2J'#27'[H');
  {$ENDIF}
end;

procedure Czekaj;
begin
  WriteLn();
  WriteLn('Naciśnij ENTER aby kontynuować...');
  ReadLn;
end;

// ============================================================================
// ZARZĄDZANIE DANYMI (FAKE DATABASE - PLIK TEKSTOWY)
// ============================================================================

procedure ZapiszDoPliku;
var
  f: TextFile;
  i: Integer;
begin
  AssignFile(f, PLIK_BAZY);
  Rewrite(f);
  
  WriteLn(f, LiczbaZgloszen);
  
  for i := 0 to LiczbaZgloszen - 1 do
  begin
    with Zgloszenia[i] do
    begin
      WriteLn(f, ID);
      WriteLn(f, NumerZgloszenia);
      WriteLn(f, NazwaFirmy);
      WriteLn(f, OsobaKontaktowa);
      WriteLn(f, Telefon);
      WriteLn(f, Email);
      WriteLn(f, OpisProblemu);
      WriteLn(f, Ord(Priorytet));
      WriteLn(f, Ord(Status));
      WriteLn(f, DateTimeToStr(DataZgloszenia));
      WriteLn(f, DateTimeToStr(DataModyfikacji));
      WriteLn(f, Uwagi);
    end;
  end;
  
  CloseFile(f);
end;

procedure WczytajZPliku;
var
  f: TextFile;
  i, temp: Integer;
  tempDate: String;
begin
  if not FileExists(PLIK_BAZY) then
  begin
    LiczbaZgloszen := 0;
    SetLength(Zgloszenia, 0);
    Exit;
  end;
  
  AssignFile(f, PLIK_BAZY);
  Reset(f);
  
  ReadLn(f, LiczbaZgloszen);
  SetLength(Zgloszenia, LiczbaZgloszen);
  
  for i := 0 to LiczbaZgloszen - 1 do
  begin
    with Zgloszenia[i] do
    begin
      ReadLn(f, ID);
      ReadLn(f, NumerZgloszenia);
      ReadLn(f, NazwaFirmy);
      ReadLn(f, OsobaKontaktowa);
      ReadLn(f, Telefon);
      ReadLn(f, Email);
      ReadLn(f, OpisProblemu);
      ReadLn(f, temp);
      Priorytet := TPriorytet(temp);
      ReadLn(f, temp);
      Status := TStatus(temp);
      ReadLn(f, tempDate);
      DataZgloszenia := StrToDateTime(tempDate);
      ReadLn(f, tempDate);
      DataModyfikacji := StrToDateTime(tempDate);
      ReadLn(f, Uwagi);
    end;
  end;
  
  CloseFile(f);
end;

// ============================================================================
// FUNKCJE BIZNESOWE
// ============================================================================

procedure NoweZgloszenie;
var
  zgl: TZgloszenie;
  wybor: Integer;
begin
  CzyscEkran;
  WriteLn('═══════════════════════════════════════════════════');
  WriteLn('           NOWE ZGŁOSZENIE SERWISOWE');
  WriteLn('═══════════════════════════════════════════════════');
  WriteLn();
  
  zgl.ID := LiczbaZgloszen + 1;
  zgl.NumerZgloszenia := GenerujNumerZgloszenia;
  zgl.DataZgloszenia := Now;
  zgl.DataModyfikacji := Now;
  zgl.Status := stNowe;
  
  Write('Nazwa firmy: ');
  ReadLn(zgl.NazwaFirmy);
  
  Write('Osoba kontaktowa: ');
  ReadLn(zgl.OsobaKontaktowa);
  
  Write('Telefon: ');
  ReadLn(zgl.Telefon);
  
  Write('Email (opcjonalnie): ');
  ReadLn(zgl.Email);
  
  WriteLn();
  WriteLn('Opis problemu (zakończ pustą linią):');
  zgl.OpisProblemu := '';
  repeat
    var linia: String;
    ReadLn(linia);
    if linia <> '' then
    begin
      if zgl.OpisProblemu <> '' then
        zgl.OpisProblemu := zgl.OpisProblemu + ' ';
      zgl.OpisProblemu := zgl.OpisProblemu + linia;
    end
    else
      Break;
  until False;
  
  WriteLn();
  WriteLn('Priorytet:');
  WriteLn('1. Niski');
  WriteLn('2. Średni');
  WriteLn('3. Wysoki');
  WriteLn('4. Krytyczny');
  Write('Wybór (1-4): ');
  ReadLn(wybor);
  
  case wybor of
    1: zgl.Priorytet := prNiski;
    2: zgl.Priorytet := prSredni;
    3: zgl.Priorytet := prWysoki;
    4: zgl.Priorytet := prKrytyczny;
  else
    zgl.Priorytet := prSredni;
  end;
  
  Write('Uwagi (opcjonalnie): ');
  ReadLn(zgl.Uwagi);
  
  // Dodaj zgłoszenie do tablicy
  Inc(LiczbaZgloszen);
  SetLength(Zgloszenia, LiczbaZgloszen);
  Zgloszenia[LiczbaZgloszen - 1] := zgl;
  
  ZapiszDoPliku;
  
  WriteLn();
  WriteLn('✓ Zgłoszenie utworzone pomyślnie!');
  WriteLn('Numer zgłoszenia: ', zgl.NumerZgloszenia);
  
  Czekaj;
end;

procedure ListaZgloszen;
var
  i: Integer;
begin
  CzyscEkran;
  WriteLn('═══════════════════════════════════════════════════');
  WriteLn('           LISTA WSZYSTKICH ZGŁOSZEŃ');
  WriteLn('═══════════════════════════════════════════════════');
  WriteLn();
  
  if LiczbaZgloszen = 0 then
  begin
    WriteLn('Brak zgłoszeń w systemie.');
    Czekaj;
    Exit;
  end;
  
  WriteLn(Format('%-15s %-25s %-15s %-12s', ['Numer', 'Firma', 'Priorytet', 'Status']));
  WriteLn('───────────────────────────────────────────────────────────────────────');
  
  for i := 0 to LiczbaZgloszen - 1 do
  begin
    with Zgloszenia[i] do
    begin
      WriteLn(Format('%-15s %-25s %-15s %-12s', 
        [NumerZgloszenia, 
         Copy(NazwaFirmy, 1, 25), 
         PriorytetToString(Priorytet),
         StatusToString(Status)]));
    end;
  end;
  
  WriteLn();
  WriteLn('Liczba zgłoszeń: ', LiczbaZgloszen);
  
  Czekaj;
end;

procedure SzczegolyZgloszenia;
var
  numer: String;
  i: Integer;
  znaleziono: Boolean;
begin
  CzyscEkran;
  WriteLn('═══════════════════════════════════════════════════');
  WriteLn('           SZCZEGÓŁY ZGŁOSZENIA');
  WriteLn('═══════════════════════════════════════════════════');
  WriteLn();
  
  Write('Podaj numer zgłoszenia: ');
  ReadLn(numer);
  
  znaleziono := False;
  
  for i := 0 to LiczbaZgloszen - 1 do
  begin
    if UpperCase(Zgloszenia[i].NumerZgloszenia) = UpperCase(numer) then
    begin
      znaleziono := True;
      WriteLn();
      WriteLn('┌─────────────────────────────────────────────────┐');
      with Zgloszenia[i] do
      begin
        WriteLn('│ Numer: ', NumerZgloszenia);
        WriteLn('│ Firma: ', NazwaFirmy);
        WriteLn('│ Kontakt: ', OsobaKontaktowa);
        WriteLn('│ Telefon: ', Telefon);
        if Email <> '' then
          WriteLn('│ Email: ', Email);
        WriteLn('├─────────────────────────────────────────────────┤');
        WriteLn('│ Problem:');
        WriteLn('│ ', OpisProblemu);
        WriteLn('├─────────────────────────────────────────────────┤');
        WriteLn('│ Priorytet: ', PriorytetToString(Priorytet));
        WriteLn('│ Status: ', StatusToString(Status));
        WriteLn('│ Data zgłoszenia: ', DateTimeToStr(DataZgloszenia));
        WriteLn('│ Ostatnia modyfikacja: ', DateTimeToStr(DataModyfikacji));
        if Uwagi <> '' then
          WriteLn('│ Uwagi: ', Uwagi);
      end;
      WriteLn('└─────────────────────────────────────────────────┘');
      Break;
    end;
  end;
  
  if not znaleziono then
    WriteLn('✗ Nie znaleziono zgłoszenia o numerze: ', numer);
  
  Czekaj;
end;

procedure ZmienStatus;
var
  numer: String;
  i, wybor: Integer;
  znaleziono: Boolean;
begin
  CzyscEkran;
  WriteLn('═══════════════════════════════════════════════════');
  WriteLn('           ZMIANA STATUSU ZGŁOSZENIA');
  WriteLn('═══════════════════════════════════════════════════');
  WriteLn();
  
  Write('Podaj numer zgłoszenia: ');
  ReadLn(numer);
  
  znaleziono := False;
  
  for i := 0 to LiczbaZgloszen - 1 do
  begin
    if UpperCase(Zgloszenia[i].NumerZgloszenia) = UpperCase(numer) then
    begin
      znaleziono := True;
      
      WriteLn();
      WriteLn('Obecny status: ', StatusToString(Zgloszenia[i].Status));
      WriteLn();
      WriteLn('Nowy status:');
      WriteLn('1. Nowe');
      WriteLn('2. W realizacji');
      WriteLn('3. Oczekuje');
      WriteLn('4. Zamknięte');
      WriteLn('0. Anuluj');
      Write('Wybór (0-4): ');
      ReadLn(wybor);
      
      if (wybor >= 1) and (wybor <= 4) then
      begin
        case wybor of
          1: Zgloszenia[i].Status := stNowe;
          2: Zgloszenia[i].Status := stWRealizacji;
          3: Zgloszenia[i].Status := stOczekuje;
          4: Zgloszenia[i].Status := stZamkniete;
        end;
        
        Zgloszenia[i].DataModyfikacji := Now;
        ZapiszDoPliku;
        
        WriteLn();
        WriteLn('✓ Status zmieniony na: ', StatusToString(Zgloszenia[i].Status));
      end
      else if wybor = 0 then
        WriteLn('Anulowano zmianę statusu.')
      else
        WriteLn('✗ Nieprawidłowy wybór!');
      
      Break;
    end;
  end;
  
  if not znaleziono then
    WriteLn('✗ Nie znaleziono zgłoszenia o numerze: ', numer);
  
  Czekaj;
end;

procedure WyszukajZgloszenie;
var
  szukaj: String;
  i: Integer;
  znaleziono: Boolean;
begin
  CzyscEkran;
  WriteLn('═══════════════════════════════════════════════════');
  WriteLn('           WYSZUKIWANIE ZGŁOSZEŃ');
  WriteLn('═══════════════════════════════════════════════════');
  WriteLn();
  
  Write('Szukaj (nazwa firmy, numer, kontakt): ');
  ReadLn(szukaj);
  szukaj := UpperCase(szukaj);
  
  WriteLn();
  WriteLn('Wyniki wyszukiwania:');
  WriteLn('───────────────────────────────────────────────────');
  
  znaleziono := False;
  
  for i := 0 to LiczbaZgloszen - 1 do
  begin
    with Zgloszenia[i] do
    begin
      if (Pos(szukaj, UpperCase(NazwaFirmy)) > 0) or
         (Pos(szukaj, UpperCase(NumerZgloszenia)) > 0) or
         (Pos(szukaj, UpperCase(OsobaKontaktowa)) > 0) then
      begin
        znaleziono := True;
        WriteLn();
        WriteLn('Numer: ', NumerZgloszenia);
        WriteLn('Firma: ', NazwaFirmy);
        WriteLn('Kontakt: ', OsobaKontaktowa, ' (', Telefon, ')');
        WriteLn('Status: ', StatusToString(Status), ' | Priorytet: ', PriorytetToString(Priorytet));
        WriteLn('───────────────────────────────────────────────────');
      end;
    end;
  end;
  
  if not znaleziono then
    WriteLn('Nie znaleziono zgłoszeń pasujących do zapytania.');
  
  Czekaj;
end;

procedure Statystyki;
var
  i: Integer;
  nowe, wRealizacji, oczekuje, zamkniete: Integer;
  niski, sredni, wysoki, krytyczny: Integer;
begin
  CzyscEkran;
  WriteLn('═══════════════════════════════════════════════════');
  WriteLn('           STATYSTYKI ZGŁOSZEŃ');
  WriteLn('═══════════════════════════════════════════════════');
  WriteLn();
  
  nowe := 0;
  wRealizacji := 0;
  oczekuje := 0;
  zamkniete := 0;
  
  niski := 0;
  sredni := 0;
  wysoki := 0;
  krytyczny := 0;
  
  for i := 0 to LiczbaZgloszen - 1 do
  begin
    case Zgloszenia[i].Status of
      stNowe: Inc(nowe);
      stWRealizacji: Inc(wRealizacji);
      stOczekuje: Inc(oczekuje);
      stZamkniete: Inc(zamkniete);
    end;
    
    case Zgloszenia[i].Priorytet of
      prNiski: Inc(niski);
      prSredni: Inc(sredni);
      prWysoki: Inc(wysoki);
      prKrytyczny: Inc(krytyczny);
    end;
  end;
  
  WriteLn('Łączna liczba zgłoszeń: ', LiczbaZgloszen);
  WriteLn();
  WriteLn('Status zgłoszeń:');
  WriteLn('  • Nowe: ', nowe);
  WriteLn('  • W realizacji: ', wRealizacji);
  WriteLn('  • Oczekuje: ', oczekuje);
  WriteLn('  • Zamknięte: ', zamkniete);
  WriteLn();
  WriteLn('Priorytet zgłoszeń:');
  WriteLn('  • Niski: ', niski);
  WriteLn('  • Średni: ', sredni);
  WriteLn('  • Wysoki: ', wysoki);
  WriteLn('  • Krytyczny: ', krytyczny);
  
  if krytyczny > 0 then
  begin
    WriteLn();
    WriteLn('⚠ UWAGA: Masz ', krytyczny, ' zgłoszeń krytycznych!');
  end;
  
  Czekaj;
end;

procedure WyswietlMenu;
begin
  CzyscEkran;
  WriteLn('╔═══════════════════════════════════════════════════╗');
  WriteLn('║     SYSTEM ZGŁOSZEŃ SERWISOWYCH - v1.0          ║');
  WriteLn('╚═══════════════════════════════════════════════════╝');
  WriteLn();
  WriteLn('  1. Nowe zgłoszenie');
  WriteLn('  2. Lista wszystkich zgłoszeń');
  WriteLn('  3. Szczegóły zgłoszenia');
  WriteLn('  4. Zmień status zgłoszenia');
  WriteLn('  5. Wyszukaj zgłoszenie');
  WriteLn('  6. Statystyki');
  WriteLn('  0. Wyjście');
  WriteLn();
  WriteLn('───────────────────────────────────────────────────');
  Write('Wybierz opcję: ');
end;

// ============================================================================
// PROGRAM GŁÓWNY
// ============================================================================

var
  wybor: Integer;
  dzialaj: Boolean;

begin
  {$IFDEF WINDOWS}
  SetConsoleOutputCP(CP_UTF8);
  SetConsoleCP(CP_UTF8);
  {$ENDIF}

  WczytajZPliku;
  dzialaj := True;
  
  while dzialaj do
  begin
    WyswietlMenu;
    
    try
      ReadLn(wybor);
    except
      wybor := -1;
    end;
    
    case wybor of
      1: NoweZgloszenie;
      2: ListaZgloszen;
      3: SzczegolyZgloszenia;
      4: ZmienStatus;
      5: WyszukajZgloszenie;
      6: Statystyki;
      0: begin
           CzyscEkran;
           WriteLn('Dziękujemy za użycie systemu zgłoszeń!');
           WriteLn();
           dzialaj := False;
         end;
    else
      begin
        WriteLn('Nieprawidłowa opcja! Spróbuj ponownie.');
        Czekaj;
      end;
    end;
  end;
end.
