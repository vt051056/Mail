unit doctypeView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,ADODB, Data.DB,
  System.UITypes;

type
  TF_doctypeView = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    BBRefresh: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BBRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CarentColumn:Tcolumn;
    ID_CHAR_DOC:longint;
    procedure FoundRec(v_ID_REC:longint);
    
  end;


  var

  ID_Doc_type_select,DocID_CLI_D,DocID_CLI_K, id_Form_Prn, ID_KATEG_CLI,
  ID_KATEG_CLI_K, ID_LINK_DOC, ID_LINK_CH_DOC, ID_PROV_CASE_select,
  ID_CHAR_DOC_select    :longint;
  Stavka_NDS_doc_select:extended;
  Doc_type_select,DocCLI_D,DocCLI_K,DocSch_d,DocSch_k, KATEG_CLI,
  KATEG_CLI_K, LINK_NAMEDOC:string;
  Doc_Type_Select_TIME_DEFAULT:TDateTime;
  IS_SLAVE_DOCTYPE:integer;
  NAMEDOC_LINK_2:string;

var
  F_doctypeView: TF_doctypeView;




  function  F_doctypeViewDlg(vID_CHAR_DOC:longint):integer;

implementation                                       
 uses dm_orders, Users_f, myfuncs;//, doclist_f, doctype_f,docchar_f;
{$R *.dfm}


function  F_doctypeViewDlg(vID_CHAR_DOC:longint):integer;
begin
 F_doctypeView:=TF_doctypeView.Create(Application);
 with F_doctypeView do
 begin
  try
   ID_CHAR_DOC:=vID_CHAR_DOC;
   result:=ShowModal;
  finally
   Free;
  end;
 end;
end;

procedure TF_doctypeView.FormCreate(Sender: TObject);
begin
 
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
 CarentColumn:=nil;
  DBNavigator1.VisibleButtons:=
   [nbFirst,nbPrior,nbNext,nbLast];
  DBGrid1.ReadOnly:=True;


end;




procedure TF_doctypeView.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if CanClose then
 begin
  if modalResult=mrOk then
  begin
   ID_Doc_type_select:=DM1.QDocType_View.FieldByName('ID_DOC_TYPE').Asinteger;
   Doc_Type_select:=DM1.QDocType_View.FieldByName('NAMEDOC').AsString;
   DocID_CLI_D:=DM1.QDocType_View.FieldByName('ID_CLI_D').Asinteger;
   DocCLI_D:=DM1.QDocType_View.FieldByName('CLI_D').AsString;
   DocID_CLI_K:=DM1.QDocType_View.FieldByName('ID_CLI_K').Asinteger;
   DocCLI_K:=DM1.QDocType_View.FieldByName('CLI_K').AsString;
   DocSch_K:=DM1.QDocType_View.FieldByName('ID_SCH_K').AsString;
   DocSch_D:=DM1.QDocType_View.FieldByName('ID_SCH_D').AsString;
   ID_CHAR_DOC_select:=DM1.QDocType_View.FieldByName('ID_CHAR_DOC').Asinteger;
   Stavka_NDS_doc_select:=DM1.QDocType_View.FieldByName('NDS_PER').AsFloat;
    id_Form_Prn:=DM1.QDocType_View.FieldByName('FORM_PRN').Asinteger;
    ID_LINK_DOC:=DM1.QDocType_View.FieldByName('ID_LINK_DOC').Asinteger;
    Doc_Type_Select_TIME_DEFAULT:=DM1.QDocType_View.FieldByName('TIME_DEFAULT').AsFloat;

  end
  else
  begin
   ID_Doc_type_select:=Unknown_code;
   Doc_Type_select:=Unknown_str;
   DocID_CLI_D:=Unknown_code;
   DocCLI_D:=Unknown_str;
   DocID_CLI_K:=Unknown_code;
   DocCLI_K:=Unknown_str;
   DocSch_K:=Unknown_str;
   DocSch_D:=Unknown_str;
   ID_CHAR_DOC_select:=Unknown_code;
   Stavka_NDS_doc_select:=0;
   ID_LINK_DOC:=Unknown_code;
   Doc_Type_Select_TIME_DEFAULT:=0;

  end;

  DM1.QDocType_View.Active:=False;
 end;
end;

procedure TF_doctypeView.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSQDocType_View.DataSet.DisableControls;
 with DM1.DSQDocType_View.DataSet do
 begin
  Next;
  is_found:=False;
  while not eof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('NAMEDOC').Asstring)) <>0 then
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

 DM1.DSQDocType_View.DataSet.EnableControls;
end;

procedure TF_doctypeView.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.DSQDocType_View.DataSet.DisableControls;
 with DM1.DSQDocType_View.DataSet do
 begin
  prior;
  is_found:=False;
  while not bof do
  begin
   if Pos(AnsiUpperCase(Edit1.Text), AnsiUpperCase(FieldByName('NAMEDOC').Asstring)) <>0 then
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

 DM1.DSQDocType_View.DataSet.EnableControls;

end;

procedure TF_doctypeView.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  TdataSet(DM1.DSQDocType_View.DataSet).Locate('NAMEDOC',Edit1.Text,[loPartialKey]);
end;

procedure TF_doctypeView.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TF_doctypeView.BBRefreshClick(Sender: TObject);
var carrent_ID_DOC_TYPE:longint;
begin
 with DM1.DSQDocType_View.DataSet do
begin
 carrent_ID_DOC_TYPE:=FieldByName('ID_DOC_TYPE').AsInteger;
 FoundRec(carrent_ID_DOC_TYPE);
end;
end;

procedure TF_doctypeView.FoundRec(v_ID_REC:longint);
begin
with DM1.DSQDocType_View.DataSet do
begin
 Disablecontrols;
 Close;

 if ID_CHAR_DOC=-1 then
begin
 DM1.QDocType_View.Parameters.ParamByName('ID_CHAR_FROM').Value:=-1;
 DM1.QDocType_View.Parameters.ParamByName('ID_CHAR_TO').Value:=1000;
end
else
begin
 DM1.QDocType_View.Parameters.ParamByName('ID_CHAR_FROM').Value:=ID_CHAR_DOC;
 DM1.QDocType_View.Parameters.ParamByName('ID_CHAR_TO').Value:=ID_CHAR_DOC;
end;

 Open;
 locate('ID_DOC_TYPE', v_ID_REC, [loCaseInsensitive]);
 Enablecontrols;
end;
end;

procedure TF_doctypeView.FormShow(Sender: TObject);
begin
DM1.QDocType_View.Active:=False;
if ID_CHAR_DOC=-1 then
begin
 DM1.QDocType_View.Parameters.ParamByName('ID_CHAR_FROM').Value:=-1;
 DM1.QDocType_View.Parameters.ParamByName('ID_CHAR_TO').Value:=1000;
end
else
begin
 DM1.QDocType_View.Parameters.ParamByName('ID_CHAR_FROM').Value:=ID_CHAR_DOC;
 DM1.QDocType_View.Parameters.ParamByName('ID_CHAR_TO').Value:=ID_CHAR_DOC;
end;
DM1.QDocType_View.Active:=True;
Edit1.SetFocus;
end;

procedure TF_doctypeView.DBGrid1CellClick(Column: TColumn);
begin
CarentColumn:=Column;
end;

procedure TF_doctypeView.DBGrid1DblClick(Sender: TObject);
begin
 modalResult:=mrOk;
end;

end.
