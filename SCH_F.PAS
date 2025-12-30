unit sch_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,DB,ADODB;

type
  TF_sch = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    BBRefresh: TBitBtn;
    ADODSSCH: TADODataSet;
    ADODSSCHID_SCH: TStringField;
    ADODSSCHSCH_NAME: TWideStringField;
    ADODSSCHID_SCH_TYPE: TIntegerField;
    ADODSSCHID_UCHET: TIntegerField;
    ADODSSCHUCHET: TWideStringField;
    ADODSSCHSCH_TYPE: TWideStringField;
    ADODSSCHIN_BALANS: TIntegerField;
    ADODSSCHIS_VISIBLE: TIntegerField;
    DSSCH: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BBRefreshClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
    CarentFieldSeach:string;
    CarentColumn:Tcolumn;
  public

    procedure ReOpenQ(v_idSch:string);
    procedure FoundTov(v_ID_Sch:string);


   
  end;

var

  ID_sch_select:string;
  sch_select,UCHET_sch_select:string;
  ID_UCHET_sch_select:longint;

  F_sch: TF_sch;
  function  F_SchDlg:integer;

implementation
 uses users_f, myfuncs, dm_orders;
{$R *.dfm}


function  F_SchDlg:integer;
begin
 F_sch:=TF_sch.Create(Application);
 with F_sch do
 begin
  try
    result:=ShowModal;
  finally
   Free;
  end;
 end;
end;

procedure TF_sch.ReOpenQ(v_idSch:string);
begin
 ADODSSch.DisableControls;
   ADODSSch.Active:=False;
  ADODSSch.Active:=True;
  if v_idSch<>'' then
  TADOdataSet(DSSch.DataSet).Locate('ID_SCH',v_idSch,[loCaseInsensitive]);
  ADODSSch.EnableControls;
end;

procedure TF_sch.FormCreate(Sender: TObject);
begin
Caption:=work_DB+'/ План счетов';
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
 CarentColumn:=nil;
 CarentFieldSeach:='ID_SCH';
 TADODataSet(DSSch.DataSet).IndexFieldNames:=CarentFieldSeach;
 ReOpenQ('');


end;






procedure TF_sch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var vsch:string;
begin
 vsch:=Trim(ADODSSch.FieldByName('ID_SCH').Asstring);
 if CanClose then
 begin
    if modalResult=mrOk then
    begin

     ID_sch_select:=ADODSSch.FieldByName('ID_SCH').Asstring;
     sch_select:=ADODSSch.FieldByName('SCH_NAME').AsString;
     ID_UCHET_sch_select:=ADODSSch.FieldByName('ID_UCHET').AsInteger;
     UCHET_sch_select:=ADODSSch.FieldByName('UCHET').AsString;

   end;
   ADODSSch.Active:=False;
 end;
end;

procedure TF_sch.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DSSch.DataSet.DisableControls;
 with DSSch.DataSet do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName(CarentFieldSeach).Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   Next;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом "'+Edit1.Text+'" не найдена!', mtInformation,
      [mbOk], 0);

 end;

 DSSch.DataSet.EnableControls;
end;

procedure TF_sch.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DSSch.DataSet.DisableControls;
 with DSSch.DataSet do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName(CarentFieldSeach).Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   prior;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом "'+Edit1.Text+'" не найдена!', mtInformation,
      [mbOk], 0);
 end;

 DSSch.DataSet.EnableControls;

end;

procedure TF_sch.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  TADOdataSet(DSSch.DataSet).Locate(CarentFieldSeach,Edit1.Text,[loPartialKey]);
end;

procedure TF_sch.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_sch.DBGrid1TitleClick(Column: TColumn);
begin
 CarentFieldSeach:=Column.FieldName;
 TADODataSet(DSSch.DataSet).IndexFieldNames:=CarentFieldSeach;
end;


procedure TF_sch.FoundTov(v_ID_Sch:string);
begin
with ADODSSch do
begin
 DisableControls;
 ReOpenQ(v_ID_Sch);
 EnableControls;
end;
end;


procedure TF_sch.BBRefreshClick(Sender: TObject);
begin
with ADODSSch do
begin
 Disablecontrols;
 FoundTov(FieldByName('ID_SCH').AsString);
 Enablecontrols;
end;

end;

procedure TF_sch.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if column.FieldName=CarentFieldSeach then
begin
///column.Title.Font.Color:= clBLUE;
 column.Font.Color:= clBLUE
end
else
 begin
  column.Font.Color:= clBlack;
 // column.Title.Font.Color:= clBlack;
 end;
end;

procedure TF_sch.FormShow(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TF_sch.DBGrid1CellClick(Column: TColumn);
begin
 CarentColumn:=Column;
end;

end.
