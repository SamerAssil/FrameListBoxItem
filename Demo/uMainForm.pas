unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.Bind.GenData, System.Rtti, FMX.Grid.Style, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.ObjectScope,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, FMX.Layouts, FMX.ListBox,
  FMX.StdCtrls, FrameListBoxItem, FMX.Ani;

type
  TMainForm = class(TForm)
    ListBox1: TListBox;
    DataGeneratorAdapter1: TDataGeneratorAdapter;
    Grid1: TGrid;
    AdapterBindSource1: TAdapterBindSource;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceAdapterBindSource1: TLinkGridToDataSource;
    StyleBook1: TStyleBook;
    BtnFill: TButton;
    FloatAnimation1: TFloatAnimation;
    btnDelete: TButton;
    procedure BtnFillClick(Sender: TObject);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure btnDeleteClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

uses uFrameItem;

procedure TMainForm.btnDeleteClick(Sender: TObject);
begin
  ListBox1.Items.Delete(ListBox1.Selected.index);
end;

procedure TMainForm.BtnFillClick(Sender: TObject);
var
  itm: TFrameListBoxItem<TFrameItem>;
begin
  ListBox1.ItemHeight := 0;

  ListBox1.BeginUpdate;

  DataGeneratorAdapter1.First;

  while not DataGeneratorAdapter1.Eof do
  begin
    itm := TFrameListBoxItem<TFrameItem>.create(ListBox1);
    itm.Parent := ListBox1;
    itm.Height := 100;

    itm.Frame.ID := DataGeneratorAdapter1.FindField('IDField')
      .GetTValue.AsInteger;
    itm.Frame.Title := DataGeneratorAdapter1.FindField('ContactName1')
      .GetTValue.AsString;
    itm.Frame.Label2.Text := DataGeneratorAdapter1.FindField('LoremIpsum1')
      .GetTValue.AsString;

    DataGeneratorAdapter1.Next;
  end;
  ListBox1.EndUpdate;
end;

procedure TMainForm.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  AdapterBindSource1.Locate('IDField', (Item as TFrameListBoxItem<TFrameItem>)
    .Frame.ID);

end;

end.
