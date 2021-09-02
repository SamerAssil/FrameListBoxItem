unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Ani, FMX.Objects, FMX.Effects;

type
  TFrame2 = class(TFrame)
    Label1: TLabel;
    Layout1: TLayout;
    FloatAnimation1: TFloatAnimation;
    Rectangle1: TRectangle;
    Label3: TLabel;
  private
    FBGColor: TAlphaColor;
    procedure SetBGColor(const Value: TAlphaColor);
    { Private declarations }
  public
    property BGColor : TAlphaColor read FBGColor write SetBGColor;
  end;

implementation

{$R *.fmx}

{ TFrame2 }

procedure TFrame2.SetBGColor(const Value: TAlphaColor);
begin
  FBGColor := Value;
  Rectangle1.Fill.Color := FBGColor;
  Rectangle1.Stroke.Color := FBGColor and $FFcccccc;
end;

end.
