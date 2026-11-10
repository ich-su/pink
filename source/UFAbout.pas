unit UFAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RXCtrls;

type
  TFAbout = class(TForm)
    PIcon: TPanel;
    IIcon: TImage;
    RxLabel1: TRxLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
  end;

implementation

uses UFPink;

{$R *.DFM}

procedure TFAbout.FormCreate(Sender: TObject); begin
  IIcon.Picture.Assign(FPink.Icon)
end;

end.
 