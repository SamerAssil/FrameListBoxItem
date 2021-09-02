unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  System.Rtti, FMX.Grid.Style, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.ScrollBox,
  FMX.Grid, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.StdCtrls,
  FMX.Layouts, FMX.ListBox, FMX.Controls.Presentation, FMX.Edit, FMX.EditBox,
  FMX.NumberBox;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    ListBox1: TListBox;
    Button1: TButton;
    Sqlite_demoConnection: TFDConnection;
    EmployeesTable: TFDQuery;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Label1: TLabel;
    edtDuration: TNumberBox;
    edtDelay: TNumberBox;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  BGColors: array of integer;

implementation

{$R *.fmx}

uses FrameListBoxItem, Unit2;

procedure TForm1.Button1Click(Sender: TObject);
var
  itm: TFrameListBoxItem<TFrame2>;
  idx: integer;
  employeeName: String;
begin
  ListBox1.Clear;

  EmployeesTable.First;

  while not EmployeesTable.Eof do
  begin
    itm := TFrameListBoxItem<TFrame2>.create(ListBox1);
    itm.Parent := ListBox1;
    itm.Height := 80;
    itm.Opacity := 0;
    idx := ListBox1.items.Count - 1;
    itm.frame.Label1.Text := EmployeesTable.FieldByName('Title').AsString;
    employeeName := format('%s %s %s',
      [EmployeesTable.FieldByName('TitleOfCourtesy').AsString,
      EmployeesTable.FieldByName('FirstName').AsString,
      EmployeesTable.FieldByName('LastName').AsString ]);
    itm.frame.Label3.Text := employeeName;
    itm.frame.BGColor := BGColors[idx];
    itm.AnimateFloatDelay('Opacity', 1, edtDuration.Value,
      idx * edtDelay.Value);
    Application.ProcessMessages;
    EmployeesTable.Next;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  BGColors := [$FFFFADAD, $FFFFD6A5, $FFFDFFB6, $FFCAFFBF, $FF9BF6FF, $FFA0C4FF,
    $FFBDB2FF, $FFFFADAD, $FFFFD6A5];

end;

end.
