unit kateg_cli_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, Data.DB;

type
  TF_kateg_cli = class(TForm)
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
    CBSetEdit: TCheckBox;
    BBDelete: TBitBtn;
    CB_Deleted: TCheckBox;
    BBRestore: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BBRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBSetEditClick(Sender: TObject);
    procedure BBDeleteClick(Sender: TObject);
    procedure CB_DeletedClick(Sender: TObject);
    procedure BBRestoreClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenFound(id_found:integer);

  end;

var

  ID_kateg_cli_select:longint;
  kateg_cli_select:string;
  ID_kateg_cli_K_select:longint;
  kateg_cli_K_select:string;
  ID_kateg_cli_D_select:longint;
  kateg_cli_D_select:string;
  F_kateg_cli: TF_kateg_cli;
  function  F_kateg_cliDlg:integer;
  
implementation
 uses dm_orders, users_f, myfuncs;
{$R *.dfm}


function  F_kateg_cliDlg:integer;
begin
 F_kateg_cli:=TF_kateg_cli.Create(Application);
 with F_kateg_cli do
 begin
  try
   result:=ShowModal;
  finally
   Free;
   F_kateg_cli:= nil;
  end;
 end;
end;


procedure TF_kateg_cli.OpenFound(id_found:integer);
begin
with DM1.ADODSKateg_cli do
begin
 Disablecontrols;
 Close;
 if CB_Deleted.Checked then
  Parameters.ParamByName('isdelete').Value:=1
 else
  Parameters.ParamByName('isdelete').Value:=0;
 Open;
 locate('ID_KATEGOR', id_found, [loCaseInsensitive]);
 Enablecontrols;
end;

end;

procedure TF_kateg_cli.FormCreate(Sender: TObject);
begin

 DM1.ADODSKateg_cli.Parameters.ParamByName('isdelete').Value:=0;
 DM1.ADODSKateg_cli.Active:=True;
 BBSearchUp.Enabled:= CheckBox1.Checked;

 BBSearchDown.Enabled := BBSearchUp.Enabled;

 CBSetEdit.Checked:=False;
 DBNavigator1.VisibleButtons:=[nbFirst,nbPrior,nbNext,nbLast];
 DBGrid1.ReadOnly:=True;

 BBDelete.Enabled:=CBSetEdit.Checked;
 CB_Deleted.Checked:=False;
 CB_Deleted.Enabled:=CBSetEdit.Checked;
 BBRestore.Enabled:=CB_Deleted.Checked;


end;

procedure TF_kateg_cli.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if CanClose then
 begin
  if modalResult=mrOk then
  begin
   if DM1.ADODSKateg_cli.State in [dsInsert,DsEdit] then  DM1.ADODSKateg_cli.Post;
   ID_kateg_cli_select:=DM1.ADODSKateg_cli.FieldByName('ID_KATEGOR').Asinteger;
   kateg_cli_select:=DM1.ADODSKateg_cli.FieldByName('KATEGOR').AsString;
  end
  else
  begin
   if DM1.ADODSKateg_cli.State in [dsInsert,DsEdit] then  DM1.ADODSKateg_cli.Cancel;
   ID_kateg_cli_select:=Unknown_code;
   kateg_cli_select:=Unknown_str;
  end;

  DM1.ADODSKateg_cli.Active:=False;
 end;
end;

procedure TF_kateg_cli.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSKateg_cli.DataSet.DisableControls;
 with DM1.DSKateg_cli.DataSet do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('KATEGOR').Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   Next;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом '+Edit1.Text+' не найдена!', mtInformation,
      [mbOk], 0);

 end;

 DM1.DSKateg_cli.DataSet.EnableControls;
end;

procedure TF_kateg_cli.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSKateg_cli.DataSet.DisableControls;
 with DM1.DSKateg_cli.DataSet do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('KATEGOR').Asstring)) <>0 then
   begin
    is_found:=True;
    break;
   end;
   prior;
  end;
  if not is_found then
   MessageDlg('Запись с контекстом '+Edit1.Text+' не найдена!', mtInformation,
      [mbOk], 0);
 end;

 DM1.DSKateg_cli.DataSet.EnableControls;

end;

procedure TF_kateg_cli.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  TdataSet(DM1.DSKateg_cli.DataSet).Locate('KATEGOR',Edit1.Text,[loPartialKey]);
end;

procedure TF_kateg_cli.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_kateg_cli.BBRefreshClick(Sender: TObject);
var carrent_ID_KATEGER:longint;
begin
 with DM1.ADODSKateg_cli do
begin
 Disablecontrols;
 carrent_ID_KATEGER:=FieldByName('ID_KATEGOR').AsInteger;
 Close;
 Open;
 locate('ID_KATEGOR', carrent_ID_KATEGER, [loCaseInsensitive]);
 Enablecontrols;
end;
end;

procedure TF_kateg_cli.FormShow(Sender: TObject);
begin
Edit1.SetFocus;
OpenFound(ID_kateg_cli_select);
end;

procedure TF_kateg_cli.CBSetEditClick(Sender: TObject);
begin
  DBNavigator1.VisibleButtons:=[nbFirst,nbPrior,nbNext,nbLast];
  DBGrid1.ReadOnly:=True;
  BBDelete.Enabled:=False;
  CB_Deleted.Enabled:=False;
  BBRestore.Enabled:=False;
case status_user of
0:     // обычные пользователи
 begin

 end;
1:  // админ приложения
  begin
  DBNavigator1.VisibleButtons:=[nbFirst,nbPrior,nbNext,nbLast];
  DBGrid1.ReadOnly:=True;
  end;
 2:  // админ БД
  begin
   if CBSetEdit.Checked then
   begin
   DBNavigator1.VisibleButtons:=[nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbEdit,nbPost,nbCancel];
   DBGrid1.ReadOnly:=False;
   BBDelete.Enabled:=CBSetEdit.Checked;
   CB_Deleted.Checked:=False;
   CB_Deleted.Enabled:=CBSetEdit.Checked;
   BBRestore.Enabled:=CB_Deleted.Checked;
   end;
   
  end;
 else
  begin
   DBNavigator1.Enabled:=False;
   DBGrid1.Enabled:=False;
  end;
end; // case status_user of


end;

procedure TF_kateg_cli.BBDeleteClick(Sender: TObject);

var pred_ID, next_ID,carrent_ID:longint;
delete_yes : boolean;
begin

with DM1.ADODSKateg_cli do
begin
 Disablecontrols;
 carrent_ID:=FieldByName('ID_KATEGOR').AsInteger;
 prior;
 pred_ID:=FieldByName('ID_KATEGOR').AsInteger;
 if carrent_ID=pred_ID then Next
 else begin Next; Next; end;
 next_ID:=FieldByName('ID_KATEGOR').AsInteger;
 locate('ID_KATEGOR', carrent_ID, [loCaseInsensitive]);

 if FieldByName('IS_DELETE').AsInteger=0 then
  begin
   delete_yes:= (MessageDlg('Запись будет помечена как удаленная.'+
         'Вы уверенны в удалении записи?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes);

  end
  else // if FieldByName('IS_DELETE').AsInteger=0 then
  begin
    delete_yes:= (MessageDlg('Будет безвозвратно удалена запись. '+
     'Это может привести к нарушению целосности БД. '+
    'Вы уверенны в удалении записи?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes);
  end;  // if FieldByName('IS_DELETE').AsInteger=0 then

  if delete_yes then
  begin
        dm1.SP_DELETE_KATEG_CLI.Parameters.ParamValues['@ID_KATEGOR']:=carrent_ID;
      dm1.SP_DELETE_KATEG_CLI.ExecProc;
      if dm1.SP_DELETE_KATEG_CLI.Parameters.ParamValues['@ER']=0 then
      begin
        if pred_ID=carrent_ID then // удаляем 1-ю
          OpenFound(next_ID)
        else
          if next_ID=carrent_ID then // удаляем последнюю
            OpenFound(pred_ID)
          else OpenFound(pred_ID);

      end
      else MessageDlg('Ошибка при удалении контрагента!', mtError,
       [mbOk], 0);
    end;   //if delete_yes then

  Enablecontrols;
end;  // with DM1.ADODSKateg_cli do


end;

procedure TF_kateg_cli.CB_DeletedClick(Sender: TObject);
begin
with DM1.ADODSKateg_cli do
begin
 Disablecontrols;
 Close;
 if CB_Deleted.Checked then
  Parameters.ParamByName('isdelete').Value:=1
 else
  Parameters.ParamByName('isdelete').Value:=0;
  
  BBRestore.Enabled:=CB_Deleted.Checked;
 Open;
 Enablecontrols;
end;
end;

procedure TF_kateg_cli.BBRestoreClick(Sender: TObject);
 var pred_ID, next_ID,carrent_ID:longint;
begin
if (MessageDlg('Запись будет восстановлена из удаленных.'+
         'Вы уверенны в восстановлении записи?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes) then

with DM1.ADODSKateg_cli do
begin
 Disablecontrols;
 carrent_ID:=FieldByName('ID_KATEGOR').AsInteger;
 prior;
 pred_ID:=FieldByName('ID_KATEGOR').AsInteger;
 if carrent_ID=pred_ID then Next
 else begin Next; Next; end;
 next_ID:=FieldByName('ID_KATEGOR').AsInteger;

 locate('ID_KATEGOR', carrent_ID, [loCaseInsensitive]);

 dm1.SP_RESTORE_KATEG_CLI.Parameters.ParamValues['@ID_KATEGOR']:=carrent_ID;
 dm1.SP_RESTORE_KATEG_CLI.ExecProc;
 if dm1.SP_RESTORE_KATEG_CLI.Parameters.ParamValues['@ER']=0 then
 begin
        if pred_ID=carrent_ID then // восстан 1-ю
          OpenFound(next_ID)
        else
          if next_ID=carrent_ID then // восстан последнюю
            OpenFound(pred_ID)
          else OpenFound(pred_ID);

 end
 else MessageDlg('Ошибка при удалении контрагента!', mtError,
       [mbOk], 0);

 Enablecontrols;
end;

end;








end.
