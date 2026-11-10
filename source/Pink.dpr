program Pink;

uses
  Forms,
  UFPink in 'UFPink.pas' {FPink},
  UFAbout in 'UFAbout.pas' {FAbout};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFPink, FPink);
  Application.ShowMainForm:=false;
  Application.Run;
end.
