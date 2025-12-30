unit Host_tov_list_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, Grids, DBGrids,DB,
  Data.Win.ADODB, Vcl.ComCtrls;

type
  TFHost_Tov_list = class(TForm)
    Panel1: TPanel;
    LGrup: TLabel;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    BBGrTovSel: TBitBtn;
    BBAllGrTovSel: TBitBtn;
    BBRefresh: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    QHostPrice: TADOQuery;
    QHostPriceGRUPTOV: TWideStringField;
    QHostPriceNAME: TWideStringField;
    QHostPriceEDIZM: TWideStringField;
    QHostPriceP1: TFloatField;
    QHostPriceP2: TFloatField;
    QHostPriceP3: TFloatField;
    QHostPriceP4: TFloatField;
    QHostPriceD_START: TDateTimeField;
    QHostPriceAVAILABILITY: TIntegerField;
    QHostPriceNOVELTY: TIntegerField;
    QHostPriceRECOMMENDED: TIntegerField;
    QHostPriceIS_USE: TIntegerField;
    QHostPriceAV_TXT: TStringField;
    QHostPriceNOV_TXT: TStringField;
    QHostPriceRECOM_TXT: TStringField;
    QHostPriceID_PRICE_DATE: TIntegerField;
    QHostPriceID_CLI: TIntegerField;
    QHostPriceID_TOV: TIntegerField;
    DS_QHostPrice: TDataSource;
    Tb_AVAILABILITY_TXT: TADOTable;
    Tb_NOVELTY_TXT: TADOTable;
    Tb_RECOMMEND_TXT: TADOTable;
    QHostPriceID_GRTOV: TIntegerField;
    Label1: TLabel;
    DTP_Price: TDateTimePicker;
    E_Cli_HostPrice: TEdit;
    Label2: TLabel;
    BBSel_Client: TBitBtn;
    L_Kateg_Cli: TLabel;
    procedure BBRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBGrTovSelClick(Sender: TObject);
    procedure BBAllGrTovSelClick(Sender: TObject);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBSel_ClientClick(Sender: TObject);
  private
    { Private declarations }
    CarentFieldSeach:string;
  public
    { Public declarations }
    viewGrup:longInt;
    nameTovForSearch:string;
    ID_Vendor:longint;

    procedure ReOpenQ(vID_TOV:longint; vID_GRTOV: longint);

  end;

var
  FHost_Tov_list: TFHost_Tov_list;
  id_Host_Tov_Select:integer;
  id_Host_GrTov_Select:integer;
  Host_Tov_Select:string;
  Host_Edizm_Select:string;
  Host_GrTov_Select:string;

function  FHost_Tov_listDLG(id_gr:longint; nametov:string; vID_Vendor:longint; vkateg_cli, vVendor:string):integer;

implementation
 uses dm_orders, grtov_f, myfuncs, CLIENT_F1;
{$R *.dfm}


function  FHost_Tov_listDLG(id_gr:longint; nametov:string; vID_Vendor:longint; vkateg_cli, vVendor:string ):integer;
begin
 FHost_Tov_list:=TFHost_Tov_list.Create(Application);
 with FHost_Tov_list do
 begin
  try
    viewGrup:=id_gr;
    ID_Vendor:=vID_Vendor;
    E_Cli_HostPrice.ReadOnly:=False;
    E_Cli_HostPrice.Text:=vVendor;
    E_Cli_HostPrice.ReadOnly:=True;
    L_Kateg_Cli.Caption:=vkateg_cli;
    DTP_Price.DateTime:=Date;
    ReOpenQ(-1,id_gr);
    nameTovForSearch:=nametov;
    result:=ShowModal;
  finally
   Free;
   FHost_Tov_list:=Nil;
  end;
 end;
end;



procedure TFHost_Tov_list.ReOpenQ(vID_TOV:longint; vID_GRTOV: longint);
begin
 with QHostPrice do
 begin
  DisableControls;
  Close;
  Parameters.ParamByName('ID_CLI_HOST').Value:=ID_Vendor;
  Parameters.ParamByName('D').Value:=DTP_Price.DateTime;
  Parameters.ParamByName('ID_GRTOV').Value:=vID_GRTOV;
  Parameters.ParamByName('isdel').Value:=0;

  Open;
  if vID_TOV<>-1 then
    Locate('ID_TOV', vID_TOV,[loCaseInsensitive]);
  EnableControls;
 end; // with QHostPrice do


end;



procedure TFHost_Tov_list.BBRefreshClick(Sender: TObject);
begin
  ReOpenQ(QHostPrice.FieldByName('ID_TOV').AsInteger, QHostPrice.FieldByName('ID_GRTOV').AsInteger);
end;

procedure TFHost_Tov_list.FormCreate(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;

 CarentFieldSeach:='TOV_NAME';
// DM1.QTovList.IndexFieldNames:=CarentFieldSeach;
 viewGrup:=-1;
 LGrup.Caption:='Все группы';
 ReOpenQ(-1,-1);



end;



procedure TFHost_Tov_list.BBGrTovSelClick(Sender: TObject);
begin
 if F_grtovDlg= mrOk then
 begin
  viewGrup:=ID_grtov_select;
  LGrup.Caption:='Группа '+grtov_select;
  ReOpenQ(-1,viewGrup);
 end;
end;

procedure TFHost_Tov_list.BBAllGrTovSelClick(Sender: TObject);
begin
 viewGrup:=-1;
 LGrup.Caption:='Все группы';
 ReOpenQ(-1,viewGrup);
end;

procedure TFHost_Tov_list.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 QHostPrice.DisableControls;
 with QHostPrice do
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

 QHostPrice.EnableControls;
end;

procedure TFHost_Tov_list.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 QHostPrice.DisableControls;
 with QHostPrice do
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

 QHostPrice.EnableControls;

end;

procedure TFHost_Tov_list.BBSel_ClientClick(Sender: TObject);
begin
if F_clientDlg_1(-1,'', -1)=mrOk then
begin
ID_Vendor:=ID_client_select_1;
E_Cli_HostPrice.ReadOnly:=False;
E_Cli_HostPrice.Text:=client_select_1;
E_Cli_HostPrice.ReadOnly:=True;
L_Kateg_Cli.Caption:=kateg_cli_select_1;
ReOpenQ(-1, -1);
end;
end;

procedure TFHost_Tov_list.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TFHost_Tov_list.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  QHostPrice.Locate(CarentFieldSeach,Edit1.Text,[loPartialKey]);
end;

procedure TFHost_Tov_list.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if modalResult<>mrOk then
 begin
   id_Host_Tov_Select:=Unknown_code;
   id_Host_GrTov_Select:=Unknown_code;
   Host_Tov_Select:=Unknown_str;
   Host_Edizm_Select:=Unknown_str;
   Host_GrTov_Select:=Unknown_str;
 end;
end;

procedure TFHost_Tov_list.BitBtn1Click(Sender: TObject);
begin
   id_Host_Tov_Select:=QHostPrice.FieldByName('ID_TOV').AsInteger;
   id_Host_GrTov_Select:=QHostPrice.FieldByName('ID_GRTOV').AsInteger;
   Host_Tov_Select:=QHostPrice.FieldByName('TOV_NAME').AsString;
   Host_Edizm_Select:=QHostPrice.FieldByName('EDIZM').AsString;
   Host_GrTov_Select:=QHostPrice.FieldByName('GRUPTOV').AsString;
   modalResult:=mrOk;
end;

procedure TFHost_Tov_list.FormShow(Sender: TObject);
begin
 Edit1.Text:=nameTovForSearch;
end;

end.
