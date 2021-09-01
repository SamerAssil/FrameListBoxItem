{ ******************************************************* }
{ Samer Assil }
{ frxComponents.pas }
{ email: samer.assil@gmail.com }
{ 2021 }
{ ******************************************************* }

// TFrameListBoxItem class is a TListBoxItem with a TFrame inside it
// Parallel Thread supported

unit FrameListBoxItem;

interface

uses
  System.Classes, System.threading, FMX.ListBox, FMX.Forms, System.Rtti;

type
  TFrameInfo<TRecord> = class
  end;

  TFrameListBoxItem<T: TFrame> = class(TlistBoxItem)
  private
    FFrame: T;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    /// <summary>
    /// Frame property used to access the internal frame.
    /// </summary>
    property Frame: T read FFrame write FFrame;
  end;

  TFrameListBoxHeader<T: TFrame> = class(TListBoxHeader)
  private
    FFrame: T;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    /// <summary>
    /// Frame property used to access the internal frame.
    /// </summary>
    property Frame: T read FFrame write FFrame;
  end;

implementation

uses
  FMX.Types, System.SysUtils;

{ TCustomLBItem<T> }

constructor TFrameListBoxItem<T>.Create(AOwner: TComponent);
var
  futureObj: IFuture<T>;
begin
  inherited;
  futureObj := TTask.Future<T>(
    function: T
    begin
      try
        result := T.Create(Self);
        result.Parent := Self;
        result.Align := TAlignLayout.Client;
      except
        on E: exception do
          raise exception.Create('Unable to create frame: ' + E.Message);
      end;
    end);
  Frame := futureObj.Value;
end;

destructor TFrameListBoxItem<T>.Destroy;
begin
  FFrame.DisposeOf;
  inherited;
end;

{ TFrameListBoxHeader<T> }

constructor TFrameListBoxHeader<T>.Create(AOwner: TComponent);
var
  futureObj: IFuture<T>;
begin
  inherited;
  futureObj := TTask.Future<T>(
    function: T
    begin
      try
        result := T.Create(Self);
        result.Parent := Self;
        result.Align := TAlignLayout.Client;
      except
        on E: exception do
          raise exception.Create('Unable to create frame: ' + E.Message);
      end;
    end);
  Frame := futureObj.Value;

end;

destructor TFrameListBoxHeader<T>.Destroy;
begin
  FFrame.DisposeOf;
  inherited;
end;

end.
