# FrameListBoxItem
ListBoxItem allow to use TFrames in it's items. Supported Windows 32/64, Android, IOs.

## What is it ?
Actualy it's a TListBoxItem with a Frame property. Nothing more.

## VCL support ##
No, and it's not ment to be. it's supported only FMX.

## how it's work
simply it's create a Frame inside a TListBoxItem.

## how to access the internal Frame?
 **Frame** Property allow you to access it. simple right ?

## Examples 
***Create FrameListBoxItem and add it to a listbox:***
```
  itm := TFrameListBoxItem<TFrame1>.create(Listbox1);
  itm.Parent := ListBox1;
  itm.Height := 100;  
```

***Access a compnent inside the frame:***
lets say you have a frame and a label compnent inside it.
```
itm.Frame.label1.Text := 'This is a FrameListBoxitem'; 
```
There is ather way to do it by adding a nessesory properties inside Frame unit. and handel everything in it.

```
FrameUnit.pas

TFrame1 = class(TFrame)
...
public
  property ID: String read FID write SetID;
  property Title: String read FTitle write SetTitle(Value: String);
end;
...
procedure SetTitle(Value: String);
begin
  FTitle := Value;
  lable1.Text := FTitle;
end;
...

```
now simply you can do this
```
  itm.Frame.Title := 'James Bond';
```



***How to populate a Listbox with items from a dataset***
```
  listbox1.ItemHeight := 0; // set it to 0 if you have a defrent item's hieghts

  Listbox1.BeginUpdate; // this will speed up the proccess.

  myTable.First;

  while not myTable.Eof do
  begin
    itm := TFrameListBoxItem<TFrame2>.create(Listbox1);
    itm.Parent := ListBox1;
    itm.Height := 100;
    itm.Frame.ID :=  myTable.FieldByName('ID').AsInteger; // the frame have ID: integer property you can use it to locate the dataset ;)
    itm.Frame.Title := myTable.FieldByName('CustomerName').AsString; // the frame have Title: String property
    myTable.Next;
  end;
  listbox1.EndUpdate;
```


## Destruction ##
The frame will destory with the listbox item destaction or when clear the listbox becouse the frame is owned by the Listbox Item. don't warry.
```
  ListBox1.Items.Delete(ListBox1.Selected.index);
```

## anther example ##
```
 // locate the associated record in a dataset
 // "ID" is a integer property in the frame to save the record's identify id insede the frame itself. 
 MyTable.Locate('IDField', (Item as TFrameListBoxItem<TFrame2>).Frame.ID ); 
```


## Visual Binding ##
No visual binding support ( I didn't think about it yet ). but don't complicate it. live is not always easy. just set the values manually.
