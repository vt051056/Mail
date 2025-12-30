unit CLIENT_F1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,DB,ADODB;

type
PCLI_select_list_element=^TCLI_select_list_element;
TCLI_select_list_element= record
 ID_CLIENTS, ID_KATEGOR, ID_PARENT:longint;
 CLIENT, KATEGOR, PARENT:string[255];

end;

type
  TF_client_1 = class(TForm)
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
    BBGrCliSel: TBitBtn;
    BBAllGrCliSel: TBitBtn;
    LGrup: TLabel;
    BBSetting: TBitBtn;
    CheckBox2: TCheckBox;
    BBSelectAll: TBitBtn;
    BitBtn3: TBitBtn;
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
    procedure BBGrCliSelClick(Sender: TObject);
    procedure BBAllGrCliSelClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BBSettingClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BBSelectAllClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    { Private declarations }
    CarentFieldSeach:string;
  public
    { Public declarations }
    carrentID_CLIENT:longint;
    StartID_CLIENT:longint;
    viewGrup:longInt;
    procedure ReopenQ(v_idCli,IDG_FROM,IDG_TO:longInt);
    procedure FoundClient(v_ID_CLIENTS:longint);


  end;


  

var

  ID_client_select_1:longint;
  client_select_1, RS_select_1, MFO_select_1, OKPO_select_1, Bank_select_1:string;
  per_minus_select_1:extended;
  PRICE_TIME_select_1:extended;
  F_client_1: TF_client_1;
  Cli_select_list:TList;  // список выбранных контрагентов
  ID_kateg_cli_select_1:longint;
  kateg_cli_select_1:string;
  Folder_cli_select_1:string;
  function  F_clientDlg_1(id_kategor:longint; kategor:string; vStartID_CLIENT:longint):integer;

implementation
 uses dm_orders,kateg_cli_f,users_f, myfuncs;
{$R *.dfm}


function  F_clientDlg_1(id_kategor:longint; kategor:string; vStartID_CLIENT:longint):integer;
begin
 F_client_1:=TF_client_1.Create(Application);
 with F_client_1 do
 begin
  try
    viewGrup:=id_kategor;
    LGrup.Caption:=kategor;
    if viewGrup =-1 then
      LGrup.Caption:='Все группы';
    StartID_CLIENT:=vStartID_CLIENT;
    result:=ShowModal;
  finally
   Free;
  end;
 end;
end;





procedure TF_client_1.ReopenQ(v_idCli,IDG_FROM,IDG_TO:longInt);
begin
 with DM1.QClients_1 do
 begin
  DisableControls;
  if not Active then Active:=True;
  carrentID_CLIENT:=FieldByName('ID_CLIENTS').AsInteger;
  Close;
  Parameters.ParamByName('ID_K1').Value:=IDG_FROM;
  Parameters.ParamByName('ID_K2').Value:=IDG_TO;
  Open;
  if v_idCli <>-1 then
  begin
  Locate('ID_CLIENTS',v_idCli,[loCaseInsensitive]);

  end;
  EnableControls;

 end;
end;

procedure TF_client_1.FormCreate(Sender: TObject);
begin

 LGrup.Caption:='Все группы';
 viewGrup:=-1;
// ReOpenQ(-1,0,MaxInt);
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
 CheckBox1.Checked:=False;
 CheckBox2.Checked:=False;
 DBGrid1.DataSource.DataSet.Filtered:=False;
 DBGrid1.DataSource.DataSet.Filter :='';
 CarentFieldSeach:='CLIENT';
 TADODataSet(DM1.DSClients_1.DataSet).IndexFieldNames:=CarentFieldSeach;
 

end;

procedure TF_client_1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i:integer;
p_Cli_sel:PCLI_select_list_element;
// TempBookmark: TBookMark;
begin
 if CanClose then
 begin
    if Cli_select_list<>nil then
    begin
       for i := 0 to (Cli_select_list.Count - 1) do
       begin
         p_Cli_sel:= Cli_select_list.Items[i];
         Dispose(p_Cli_sel);
       end;
       Cli_select_list.Free;
       Cli_select_list:=nil;
    end;  // if Cli_select_list<>nil then

  if modalResult=mrOk then
  begin
   ID_client_select_1:=DM1.QClients_1.FieldByName('ID_CLIENTS').Asinteger;
   client_select_1:=DM1.QClients_1.FieldByName('CLIENT').AsString;
   RS_select_1:=DM1.QClients_1.FieldByName('RS').AsString;
   MFO_select_1:=DM1.QClients_1.FieldByName('MFO').AsString;
   OKPO_select_1:=DM1.QClients_1.FieldByName('OKPO').AsString;
   Bank_select_1:=DM1.QClients_1.FieldByName('BANK').AsString;
   per_minus_select_1 :=DM1.QClients_1.FieldByName('PER_MINUS').AsFloat;
   ID_kateg_cli_select_1:=DM1.QClients_1.FieldByName('ID_KATEGOR').Asinteger;
   kateg_cli_select_1:=DM1.QClients_1.FieldByName('KATEGOR').AsString;
   Folder_cli_select_1:=DM1.QClients_1.FieldByName('FOLDER_NAME').AsString;


    if DBGrid1.SelectedRows.Count <> 0 then
    begin
      Cli_select_list:= TList.Create;
     // TempBookmark := DBGrid1.Datasource.Dataset.GetBookmark;
      for i := 0 to DBGrid1.SelectedRows.Count - 1 do
      begin
         if DBGrid1.SelectedRows.IndexOf(DBGrid1.SelectedRows.Items[i]) > -1 then
         begin
          DBGrid1.Datasource.Dataset.Bookmark := DBGrid1.SelectedRows.Items[i];
          New(p_Cli_sel);
          p_Cli_sel^.ID_CLIENTS :=
             DBGrid1.Datasource.Dataset.FieldByName('ID_CLIENTS').AsInteger;
          p_Cli_sel^.ID_KATEGOR :=
             DBGrid1.Datasource.Dataset.FieldByName('ID_KATEGOR').AsInteger;
          p_Cli_sel^.ID_PARENT :=
             DBGrid1.Datasource.Dataset.FieldByName('ID_PARENT').AsInteger;
          p_Cli_sel^.CLIENT :=
             DBGrid1.Datasource.Dataset.FieldByName('CLIENT').AsString;
          p_Cli_sel^.KATEGOR :=
             DBGrid1.Datasource.Dataset.FieldByName('KATEGOR').AsString;
          p_Cli_sel^.PARENT :=
             DBGrid1.Datasource.Dataset.FieldByName('PARENT').AsString;
          Cli_select_list.Add(p_Cli_sel);
         end;   //  if DBGrid1.SelectedRows.IndexOf(DBGrid1.SelectedRows.Items[i]) > -1 then
       end;  //  for i := 0 to DBGrid1.SelectedRows.Count - 1 do
    end  // if DBGrid1.SelectedRows.Count <> 0 then
    else
    begin
          Cli_select_list:= TList.Create;
          New(p_Cli_sel);
          p_Cli_sel^.ID_CLIENTS :=
             DBGrid1.Datasource.Dataset.FieldByName('ID_CLIENTS').AsInteger;
          p_Cli_sel^.ID_KATEGOR :=
             DBGrid1.Datasource.Dataset.FieldByName('ID_KATEGOR').AsInteger;
          p_Cli_sel^.ID_PARENT :=
             DBGrid1.Datasource.Dataset.FieldByName('ID_PARENT').AsInteger;
          p_Cli_sel^.CLIENT :=
             DBGrid1.Datasource.Dataset.FieldByName('CLIENT').AsString;
          p_Cli_sel^.KATEGOR :=
             DBGrid1.Datasource.Dataset.FieldByName('KATEGOR').AsString;
          p_Cli_sel^.PARENT :=
             DBGrid1.Datasource.Dataset.FieldByName('PARENT').AsString;
          Cli_select_list.Add(p_Cli_sel);
    end;  // else if DBGrid1.SelectedRows.Count <> 0 then


  end
  else
  begin
   ID_client_select_1:=Unknown_code;
   client_select_1:=Unknown_str;
   RS_select_1:=Unknown_str;
   MFO_select_1:=Unknown_str;
   OKPO_select_1:=Unknown_str;
   Bank_select_1:=Unknown_str;
   per_minus_select_1 :=0;
   Folder_cli_select_1:='';

  end;

  DM1.QClients_1.Active:=False;
 end;
end;

procedure TF_client_1.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSClients_1.DataSet.DisableControls;
 with DM1.DSClients_1.DataSet do
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

 DM1.DSClients_1.DataSet.EnableControls;
end;

procedure TF_client_1.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSClients_1.DataSet.DisableControls;
 with DM1.DSClients_1.DataSet do
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

 DM1.DSClients_1.DataSet.EnableControls;

end;

procedure TF_client_1.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  TADOdataSet(DM1.DSClients_1.DataSet).Locate(CarentFieldSeach,Edit1.Text,[loPartialKey]);
end;

procedure TF_client_1.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_client_1.DBGrid1TitleClick(Column: TColumn);
begin
 CarentFieldSeach:=Column.FieldName;
 TADODataSet(DM1.DSClients_1.DataSet).IndexFieldNames:=CarentFieldSeach;
end;


procedure TF_client_1.FoundClient(v_ID_CLIENTS:longint);
var idG_from, idG_to:integer;
begin
with DM1.QClients_1 do
begin
 DisableControls;
  if viewGrup=-1 then
   begin
    idG_from:=0;
    idG_to:=MaxInt;
   end
   else
   begin
    idG_from:=viewGrup;
    idG_to:=viewGrup;
   end;
   ReOpenQ(v_ID_CLIENTS,idG_from,idG_to);
 EnableControls;
end;
end;

procedure TF_client_1.BBRefreshClick(Sender: TObject);
begin
with DM1.QClients_1 do
begin
 Disablecontrols;
 FoundClient(FieldByName('ID_CLIENTS').AsInteger);
 Enablecontrols;
end;

end;

procedure TF_client_1.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if column.FieldName=CarentFieldSeach then
begin

 column.Font.Color:= clBLUE
end
else
 begin
  column.Font.Color:= clBlack;

 end;
end;

procedure TF_client_1.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  if  DM1.QClients_1.FieldByName('IS_DELETE').AsInteger=1 then
     DBGrid1.Canvas.Font.Color := clRed;
 DBGrid1.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TF_client_1.FormShow(Sender: TObject);
begin
if viewGrup=-1 then  ReOpenQ(StartID_CLIENT,0,MaxInt)
else ReOpenQ(StartID_CLIENT,viewGrup,viewGrup);
// установка порядка и ширины DbGrid1 из секции section_Ini Ini файла
ReadColumnPosFromIni(DbGrid1, 'clients1');
Edit1.SetFocus;
end;

procedure TF_client_1.BBGrCliSelClick(Sender: TObject);

begin
  DBGrid1.SelectedRows.Clear;
 if F_kateg_cliDlg= mrOk then
 begin
  LGrup.Caption:='Группа '+kateg_cli_select;
  viewGrup:=ID_kateg_cli_select;
  ReOpenQ(-1,viewGrup,viewGrup);
 end;
end;

procedure TF_client_1.BBAllGrCliSelClick(Sender: TObject);
begin
 LGrup.Caption:='Все группы';
 ID_kateg_cli_select:=-1;
 viewGrup:=-1;
 ReOpenQ(-1,0,MaxInt);
end;

procedure TF_client_1.DBGrid1DblClick(Sender: TObject);
begin
//  modalResult:=mrOk;
end;

procedure TF_client_1.BBSettingClick(Sender: TObject);
begin
  SaveColumnPosToIni(DbGrid1, 'clients1');
end;

procedure TF_client_1.CheckBox2Click(Sender: TObject);

begin
  DBGrid1.SelectedRows.Clear;
  if CheckBox2.Checked then
  begin
   if not CheckBox1.Checked then
   begin
     if MessageDlg('Установить фильтр по текущему значению выделенной колонки?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Edit1.text:=DM1.QClients_1.FieldByName(CarentFieldSeach).AsString;
    end;
   end;
   DBGrid1.DataSource.DataSet.Filtered:=True;
   DBGrid1.DataSource.DataSet.Filter := '('+CarentFieldSeach+' LIKE ' + QuotedStr('%'+Edit1.text+'%') + ')';
  end
  else
  begin
    DBGrid1.DataSource.DataSet.Filtered:=False;
    DBGrid1.DataSource.DataSet.Filter :='';
  end;
end;

procedure TF_client_1.BBSelectAllClick(Sender: TObject);
begin
if DBGrid1.DataSource.DataSet.Active then  GridSelectAll(DBGrid1);
end;




procedure TF_client_1.BitBtn3Click(Sender: TObject);
begin
DBGrid1.SelectedRows.Clear;
end;

end.
