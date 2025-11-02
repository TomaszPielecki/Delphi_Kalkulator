program Template;

{*******************************************************************************
  SZABLON PROGRAMU PASCAL/DELPHI
  
  Użyj tego jako bazę dla własnych eksperymentów!
  
  Aby użyć:
  1. Skopiuj ten plik: cp template.pas moj_program.pas
  2. Zmień nazwę programu w linii 1
  3. Napisz swój kod!
*******************************************************************************}

{$mode delphi}
{$codepage utf8}

uses
  SysUtils
  {$IFDEF WINDOWS}, Windows{$ENDIF};

var
  // Twoje zmienne globalne tutaj

// Twoje procedury i funkcje tutaj

begin
  // Ustawienie kodowania UTF-8 dla polskich znaków
  {$IFDEF WINDOWS}
  SetConsoleOutputCP(CP_UTF8);
  SetConsoleCP(CP_UTF8);
  {$ENDIF}

  WriteLn('=== MÓJ PROGRAM ===');
  WriteLn();
  
  // Twój kod tutaj
  
  WriteLn();
  WriteLn('Naciśnij ENTER aby zakończyć...');
  ReadLn;
end.
