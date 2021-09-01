unit uFrameItem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, FMX.Ani, FMX.Effects;

type
  TFrameItem = class(TFrame)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Label1: TLabel;
    Layout2: TLayout;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    FloatAnimation1: TFloatAnimation;
    ShadowEffect1: TShadowEffect;
    Switch1: TSwitch;
    Layout3: TLayout;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Switch1Switch(Sender: TObject);
  private
    FTitle: String;
    FIsOpen: Boolean;
    FID: Integer;
    FIsSelected: Boolean;
    procedure SetIsOpen(const Value: Boolean);
    procedure SetTitle(const Value: String);
    procedure SetIsSelected(const Value: Boolean);

    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    property IsSelected: Boolean read FIsSelected write SetIsSelected;
    property IsOpen: Boolean read FIsOpen write SetIsOpen Default false;
    property Title: String read FTitle write SetTitle;
    property ID: Integer read FID write FID;
  end;

implementation

{$R *.fmx}

constructor TFrameItem.Create(AOwner: TComponent);
begin
  inherited;
  Height := 100;
  IsSelected := false;
end;

procedure TFrameItem.SetIsOpen(const Value: Boolean);
begin
  FIsOpen := Value;

  if assigned(Parent) then
    FloatAnimation1.Parent := Parent;

  FloatAnimation1.StartFromCurrent := True;
  if FIsOpen then
  begin
    FloatAnimation1.StopValue := 300;
    SpeedButton1.StyleLookup := 'arrowuptoolbutton';
  end
  else
  begin
    FloatAnimation1.StopValue := 100;
    SpeedButton1.StyleLookup := 'arrowdowntoolbutton';
  end;

  FloatAnimation1.Start;

end;

procedure TFrameItem.SetIsSelected(const Value: Boolean);
begin
  FIsSelected := Value;
  if FIsSelected then
    Rectangle1.Fill.Color := $FF2D81B4
  else
    Rectangle1.Fill.Color := $FF1D5475;
end;

procedure TFrameItem.SetTitle(const Value: String);
begin
  FTitle := Value;
  Label1.Text := FTitle;
end;

procedure TFrameItem.SpeedButton1Click(Sender: TObject);
begin
  IsOpen := not IsOpen;
end;

procedure TFrameItem.Switch1Switch(Sender: TObject);
begin
  IsSelected := not IsSelected;
end;

end.
