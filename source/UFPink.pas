unit UFPink;

interface

uses
  Windows, Messages, Classes, Controls, Graphics, Forms,
  Buttons, Menus, RXShell;

type
  TFPink = class(TForm)
    SBPlay: TSpeedButton;
    SBStop: TSpeedButton;
    SBExit: TSpeedButton;
    SBMenu: TSpeedButton;
    PMenu: TPopupMenu;
    Move1: TMenuItem;
    LeftUp: TMenuItem;
    RightUp: TMenuItem;
    LeftDown: TMenuItem;
    RightDown: TMenuItem;
    Line1: TMenuItem;
    About1: TMenuItem;
    RxTIcon: TRxTrayIcon;
    Minimize1: TMenuItem;
    PMenuTray: TPopupMenu;
    PMTIzd: TMenuItem;
    N2: TMenuItem;
    PMTView: TMenuItem;
    N1: TMenuItem;
    PMTAbout: TMenuItem;
    procedure SBExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBPlayClick(Sender: TObject);
    procedure SBStopClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SBMenuClick(Sender: TObject);
    procedure RightDownClick(Sender: TObject);
    procedure Minimize1Click(Sender: TObject);
    procedure RxTIconDblClick(Sender: TObject);
    procedure PMTIzdClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    RING: Pointer;

    procedure WMNCHitTest(var Message : TWMNCHitTest); message WM_NCHitTest;
  end;

var FPink: TFPink;

implementation

uses mmsystem, UFAbout;

{$R *.DFM}

procedure TFPink.WMNCHitTest;
var P: tPoint;
begin
  inherited;
  with Message, P do begin
    X:=XPos;
    Y:=YPos;
    P:=ScreenToClient(P);
    if (X in [0..SBMenu.Left - 1]) and
       (Y in [0..SBMenu.Height - 1]) then Result:=htCaption;
  end
end;

procedure TFPink.SBExitClick(Sender: TObject); begin
  SBStopClick(nil);
  Close
end;

procedure TFPink.FormCreate(Sender: TObject);
var RS: TResourceStream;
begin
  Top:=0;
  Left:=0;

  SBPlay.Left:=3;
  SBStop.Left:=SBPlay.Left + SBPlay.Width;
  SBPlay.Top:=SBExit.Height + 3;
  SBStop.Top:=SBPlay.Top;

  Width:=SBStop.Left + SBStop.Width + SBPlay.Left;

  SBExit.Top:=1;
  SBExit.Left:=ClientWidth - SBExit.Width - 1;

  SBMenu.Top:=SBExit.Top;
  SBMenu.Left:=SBExit.Left - SBMenu.Width;

  Height:=SBPlay.Height + SBExit.Height + SBExit.Top +
          (SBPlay.Top - (SBExit.Top + SBExit.Height)) shl 1;

  RS:=TResourceStream.Create(hinstance, 'RING', RT_RCDATA);
  try
    GetMem(RING, RS.Size);
    RS.Read(RING^, RS.Size);
  finally
    RS.Free;
  end;
  SBPlayClick(nil)
end;

procedure TFPink.SBPlayClick(Sender: TObject); begin
  if PlaySound(RING, 0, SND_MEMORY + SND_ASYNC + SND_LOOP) then begin
    SBPlay.Enabled:=false;
    SBStop.Enabled:=true;
    PMTIzd.Checked:=true;
  end
end;

procedure TFPink.SBStopClick(Sender: TObject); begin
  PlaySound(nil, 0, 0);
  SBPlay.Enabled:=true;
  SBStop.Enabled:=false;
  PMTIzd.Checked:=false;
end;

procedure TFPink.FormDestroy(Sender: TObject); begin
  FreeMem(RING)
end;

procedure TFPink.FormPaint(Sender: TObject);
var Rect: tRect;
begin
  with Rect do begin
    Top:=0;
    Left:=0;
    Right:=Width;
    Bottom:=SBExit.Height + SBExit.Top shl 1;
  end;

  with Canvas do begin
    Brush.Color:=clActiveCaption;
    FillRect(Rect);
    Font.Color:=clCaptionText;
    TextOut(SBExit.Top, SBExit.Top, 'Pink')
  end;

end;

procedure TFPink.SBMenuClick(Sender: TObject);
var P: tPoint;
begin
  with P do begin
    X:=SBMenu.Left + SBMenu.Height shr 2;
    Y:=SBMenu.Top + SBMenu.Height shr 2;
    P:=ClientToScreen(P);
    PMenu.Popup(X, Y)
  end
end;

procedure TFPink.RightDownClick(Sender: TObject); begin
  case tControl(Sender).Tag of
    0: begin Top:=0; Left:=0 end;
    1: begin Top:=0; Left:=Screen.Width - Width end;
    2: begin Top:=Screen.Height - Height; Left:=0 end;
    3: begin
      Top:=Screen.Height - Height;
      Left:=Screen.Width - Width
    end;
  end
end;

procedure TFPink.Minimize1Click(Sender: TObject); begin
  Hide
end;

procedure TFPink.RxTIconDblClick(Sender: TObject); begin
  Show
end;

procedure TFPink.PMTIzdClick(Sender: TObject); begin
  if SBPlay.Enabled then SBPlayClick(nil)
  else SBStopClick(nil)
end;

procedure TFPink.FormHide(Sender: TObject); begin
  PMTView.Visible:=true
end;

procedure TFPink.FormShow(Sender: TObject); begin
  PMTView.Visible:=false
end;

procedure TFPink.About1Click(Sender: TObject); begin
  with tFAbout.Create(Application) do begin
    ShowModal;
    Free
  end
end;

end.

