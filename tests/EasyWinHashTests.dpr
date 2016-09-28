program EasyWinHashTests;
{

  Delphi DUnit-Testprojekt
  -------------------------
  Dieses Projekt enth�lt das DUnit-Test-Framework und die GUI/Konsolen-Test-Runner.
  F�gen Sie den Bedingungen in den Projektoptionen "CONSOLE_TESTRUNNER" hinzu,
  um den Konsolen-Test-Runner zu verwenden.  Ansonsten wird standardm��ig der
  GUI-Test-Runner verwendet.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
{$IFDEF madExcept}
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
{$ENDIF}
  DUnitTestRunner,
  CryptoAPITests in 'CryptoAPITests.pas';

{$R *.RES}

begin
{$IFDEF WIN64}
  // madExcept leak checking does not seems to work in 64 bit builds
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  DUnitTestRunner.RunRegisteredTests;
end.

