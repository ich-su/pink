object FAbout: TFAbout
  Left = 307
  Top = 183
  BorderStyle = bsDialog
  Caption = 'О программе'
  ClientHeight = 130
  ClientWidth = 187
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RxLabel1: TRxLabel
    Left = 48
    Top = 8
    Width = 129
    Height = 33
    AutoSize = False
    Caption = 'Pink'#39'овый издеватель'#13#10'v1.0'
    WordWrap = True
  end
  object Label1: TLabel
    Left = 8
    Top = 52
    Width = 106
    Height = 26
    Caption = 'Специально для '#13#10'KAA aka Pink manyak'
  end
  object Label2: TLabel
    Left = 24
    Top = 96
    Width = 153
    Height = 33
    AutoSize = False
    Caption = 'i[H, 2000'#13#10'2:5034/1.370 (FidoNet)'
    WordWrap = True
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 9
    Height = 13
    Caption = '©'
  end
  object PIcon: TPanel
    Left = 8
    Top = 8
    Width = 34
    Height = 34
    BevelOuter = bvLowered
    TabOrder = 0
    object IIcon: TImage
      Left = 1
      Top = 1
      Width = 32
      Height = 32
      Align = alClient
    end
  end
end
