program Demo;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  uFrameItem in 'uFrameItem.pas' {FrameItem: TFrame},
  FrameListBoxItem in '..\..\FrameListBoxItem.pas';

{$R *.res}

begin
ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
