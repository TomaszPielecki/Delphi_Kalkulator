program HelloDelphi;

{$APPTYPE CONSOLE}
{$CODEPAGE UTF8}

uses
  SysUtils, Windows;

var
  Name: string;
  Age: Integer;

begin
  try
    // Ustawienie kodowania konsoli dla polskich znaków
    SetConsoleOutputCP(65001); // UTF-8
    SetConsoleCP(65001); // UTF-8 dla wejścia
    
    // Przywitanie
    WriteLn('=== Witaj w Delphi! ===');
    WriteLn('');
    
    // Pobieranie danych od użytkownika
    Write('Podaj swoje imię: ');
    ReadLn(Name);
    
    Write('Podaj swój wiek: ');
    ReadLn(Age);
    
    // Wyświetlanie wyniku
    WriteLn('');
    WriteLn(Format('Cześć %s! Masz %d lat.', [Name, Age]));
    
    if Age >= 18 then
      WriteLn('Jesteś pełnoletni/a!')
    else
      WriteLn('Jesteś nieletni/a.');
    
    WriteLn('');
    WriteLn('Gratulacje! Twój pierwszy program w Delphi działa! 🎉');
    WriteLn('');
    WriteLn('Naciśnij Enter aby zakończyć...');
    ReadLn;
    
  except
    on E: Exception do
    begin
      WriteLn('Błąd: ' + E.Message);
      ReadLn;
    end;
  end;
end.