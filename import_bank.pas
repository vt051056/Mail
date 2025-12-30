unit import_bank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,
  xmldom, XMLIntf, msxmldom,
  XMLDoc, MSXML2_TLB, DBCtrls, Grids, DBGrids,DB, IniFiles, ADODB;

type
  TF_Import_Bank = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BB_BANK_Vypiska: TBitBtn;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    BBCreateDocs: TBitBtn;
    Panel3: TPanel;
    BBLinkClient: TBitBtn;
    BBLinkDocType: TBitBtn;
    OpenDialog1: TOpenDialog;
    BBDeleteImportData: TBitBtn;
    BBRefresh: TBitBtn;
    BBDeleteImportRec: TBitBtn;
    E_FileName: TEdit;
    BBPath: TBitBtn;
    BBSelectAll: TBitBtn;
    BB_NotImp: TBitBtn;
    ADS_IMPORT_BANK_TMP: TADODataSet;
    ADS_IMPORT_BANK_TMPID_IMPORT_DOC: TAutoIncField;
    ADS_IMPORT_BANK_TMPDK: TIntegerField;
    ADS_IMPORT_BANK_TMPID_USER: TIntegerField;
    ADS_IMPORT_BANK_TMPdeb_kred: TStringField;
    ADS_IMPORT_BANK_TMPD: TDateTimeField;
    ADS_IMPORT_BANK_TMPNN: TWideStringField;
    ADS_IMPORT_BANK_TMPTOT_SUM: TFloatField;
    ADS_IMPORT_BANK_TMPCOMMENT: TWideStringField;
    ADS_IMPORT_BANK_TMPID_DOC_TYPE: TIntegerField;
    ADS_IMPORT_BANK_TMPCLI_D_MY: TWideStringField;
    ADS_IMPORT_BANK_TMPCLI_K_MY: TWideStringField;
    ADS_IMPORT_BANK_TMPNAMEDOC: TWideStringField;
    ADS_IMPORT_BANK_TMPSCH_D_PROV: TWideStringField;
    ADS_IMPORT_BANK_TMPSCH_K_PROV: TWideStringField;
    ADS_IMPORT_BANK_TMPID_SCH_D: TStringField;
    ADS_IMPORT_BANK_TMPID_SCH_K: TStringField;
    ADS_IMPORT_BANK_TMPCLI_D: TWideStringField;
    ADS_IMPORT_BANK_TMPOKPO_D: TWideStringField;
    ADS_IMPORT_BANK_TMPRS_D: TWideStringField;
    ADS_IMPORT_BANK_TMPID_CLI_D: TIntegerField;
    ADS_IMPORT_BANK_TMPCLI_K: TWideStringField;
    ADS_IMPORT_BANK_TMPOKPO_K: TWideStringField;
    ADS_IMPORT_BANK_TMPRS_K: TWideStringField;
    ADS_IMPORT_BANK_TMPID_CLI_K: TIntegerField;
    ADS_IMPORT_BANK_TMPIS_IMPORTED: TIntegerField;
    DS_IMPORT_BANK_TMP: TDataSource;
    SP_DEL_IMPORT_BANK_USER: TADOStoredProc;
    Tb_CLIENTS: TADOTable;
    DS_Tb_CLIENTS: TDataSource;
    QDefaultSetting: TADOQuery;
    DSQDefaultSetting: TDataSource;
    procedure BBLinkClientClick(Sender: TObject);
    procedure BBLinkDocTypeClick(Sender: TObject);
    procedure BBCreateDocsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BB_BANK_VypiskaClick(Sender: TObject);
    procedure BBDeleteImportDataClick(Sender: TObject);
    procedure BBRefreshClick(Sender: TObject);
    procedure BBDeleteImportRecClick(Sender: TObject);
    procedure BBPathClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBSelectAllClick(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BB_NotImpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    
    Carrent_ID_Rec:integer;
    XML_File_Name_Vypiska:string;
    path_to_xml:string;
    iniFile:TIniFile;
    CarentColumn:Tcolumn;

    procedure Import_Vypiska;
    procedure Link_Deb_Kred;
    procedure FoundRec(ID_Rec:integer);
    procedure MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    function GridSelectAll(Grid: TDBGrid): Longint;
  end;

var
  F_Import_Bank: TF_Import_Bank;
  function  F_Import_Bank_Dlg():integer;
implementation

{$R *.dfm}

uses users_f, dm_orders,  client_f1, clipbrd, docTypeView, myfuncs, sch_f;

function  F_Import_Bank_Dlg():integer;
begin
 F_Import_Bank:=TF_Import_Bank.Create(Application);
 with F_Import_Bank do
 begin
  try

   result:=ShowModal;
  finally
   Free;
   F_Import_Bank:= nil;
  end;
 end;
end;



procedure TF_Import_Bank.Link_Deb_Kred;
var vOKPO, vCli:string;
is_Import_Rashod:boolean;
begin
if not Tb_CLIENTS.Active then  Tb_CLIENTS.Active:=True;
Tb_CLIENTS.Refresh;
  
  with ADS_IMPORT_BANK_TMP do
  begin
   First;
   
   while not Eof do
   begin
    is_Import_Rashod:=(FieldByName('DK').AsInteger=0);
    if  is_Import_Rashod then
    begin
      vOKPO:=FieldByName('OKPO_D').AsString;
      vCli:=FieldByName('CLI_D').AsString;
    end
    else
      begin
        vOKPO:=FieldByName('OKPO_K').AsString;
        vCli:=FieldByName('CLI_K').AsString;
      end;

    if Tb_CLIENTS.Locate('OKPO', vOKPO ,[loCaseInsensitive]) then
    begin
     // найден в нашем справочнике
     Edit;
     ADS_IMPORT_BANK_TMPID_CLI_D.ReadOnly:=False;
     ADS_IMPORT_BANK_TMPID_CLI_K.ReadOnly:=False;
     if  is_Import_Rashod then
      FieldByName('ID_CLI_D').AsInteger:=Tb_CLIENTS.FieldByName('ID_CLIENTS').AsInteger
     else FieldByName('ID_CLI_K').AsInteger:=Tb_CLIENTS.FieldByName('ID_CLIENTS').AsInteger;
       ADS_IMPORT_BANK_TMPID_CLI_D.ReadOnly:=True;
       ADS_IMPORT_BANK_TMPID_CLI_K.ReadOnly:=True;
     Post;
    end
    else
    begin
     MessageDlg('В нашем справочнике клиентов нет '+vCli+
     ' с ОКПО '+vOKPO+' Укажите его из имеющихся? (ОКПО будет В БУФЕРЕ ОБМЕНА!)',
         mtConfirmation, [mbOk], 0);
    end;
    Next;
   end; // while not Eof do

  end; // with ADS_IMPORT_BANK_TMP do

end;

procedure TF_Import_Bank.BBLinkClientClick(Sender: TObject);
var is_Import_Rashod:boolean;
begin
  if not Tb_CLIENTS.Active then  Tb_CLIENTS.Active:=True;
  with ADS_IMPORT_BANK_TMP do
  begin
          Carrent_ID_Rec:=FieldByName('ID_IMPORT_DOC').AsInteger;
         
          is_Import_Rashod:=(FieldByName('DK').AsInteger=0);
          if  is_Import_Rashod then Clipboard.asText:=FieldByName('OKPO_D').AsString
          else  Clipboard.asText:=FieldByName('OKPO_K').AsString;

          if F_clientDlg_1(-1,'', ID_client_select_1)=mrOk then
          begin

            Edit;

            if  is_Import_Rashod then
            begin
              ADS_IMPORT_BANK_TMPID_CLI_D.ReadOnly:=False;
              FieldByName('ID_CLI_D').AsInteger:=ID_client_select_1;
              ADS_IMPORT_BANK_TMPID_CLI_D.ReadOnly:=True;
            end
            else
             begin
             ADS_IMPORT_BANK_TMPID_CLI_K.ReadOnly:=False;
             FieldByName('ID_CLI_K').AsInteger:=ID_client_select_1;
             ADS_IMPORT_BANK_TMPID_CLI_K.ReadOnly:=True;
             end;

            Post;
          end;

  end; // with ADS_IMPORT_BANK_TMP do
  FoundRec(Carrent_ID_Rec);
end;

procedure TF_Import_Bank.BBLinkDocTypeClick(Sender: TObject);
var i:integer;
    is_Import_Rashod:boolean;
begin
 if DBGrid1.SelectedRows.Count=0 then
 begin
   MessageDlg('Не выбраны строки для операции!', mtError,
      [mbOk], 0);
  exit;
 end;

  with ADS_IMPORT_BANK_TMP do
  begin
     Carrent_ID_Rec:=FieldByName('ID_IMPORT_DOC').AsInteger;
     if F_doctypeViewDlg(0)=mrOk then
     begin

      for i:=0 to DBGrid1.SelectedRows.Count-1 do
      begin
        DBGrid1.DataSource.DataSet.GotoBookmark((DBGrid1.SelectedRows.Items[i]));
        is_Import_Rashod:=(FieldByName('DK').AsInteger=0);
        Edit;
        FieldByName('ID_DOC_TYPE').AsInteger:=ID_Doc_type_select;
        FieldByName('D').AsFloat:=FieldByName('D').AsFloat+Doc_Type_Select_TIME_DEFAULT;
        ADS_IMPORT_BANK_TMPSCH_D_PROV.ReadOnly:=False;
        ADS_IMPORT_BANK_TMPSCH_K_PROV.ReadOnly:=False;
        FieldByName('SCH_D_PROV').AsString:=DocSch_d;
        FieldByName('SCH_K_PROV').AsString:=DocSch_k;
        ADS_IMPORT_BANK_TMPSCH_D_PROV.ReadOnly:=True;
        ADS_IMPORT_BANK_TMPSCH_K_PROV.ReadOnly:=True;
        if  is_Import_Rashod then  //  при расходе кредитор, а приходе дебетор из привязываемых типов докум
        begin
          ADS_IMPORT_BANK_TMPID_CLI_K.ReadOnly:=False;
          FieldByName('ID_CLI_K').AsInteger:=DocID_CLI_K;
          ADS_IMPORT_BANK_TMPID_CLI_K.ReadOnly:=True;
        end
        else
        begin
          ADS_IMPORT_BANK_TMPID_CLI_D.ReadOnly:=False;
          FieldByName('ID_CLI_D').AsInteger:=DocID_CLI_D;
          ADS_IMPORT_BANK_TMPID_CLI_D.ReadOnly:=True;
        end;

             

        Post;
      end; // for i:=0 to DBGrid1.SelectedRows.Count-1 do

     end;

  end; // with ADS_IMPORT_BANK_TMP do
  FoundRec(Carrent_ID_Rec);
end;

procedure TF_Import_Bank.BBCreateDocsClick(Sender: TObject);
var ID_NAKLCAP,i  : integer;
begin
 if DBGrid1.SelectedRows.Count=0 then
 begin
   MessageDlg('Не выбраны строки для передачи!', mtError,
      [mbOk], 0);
   Exit;
 end;
 with ADS_IMPORT_BANK_TMP do
 begin
  for i:=0 to DBGrid1.SelectedRows.Count-1 do
  begin
    DBGrid1.DataSource.DataSet.GotoBookmark((DBGrid1.SelectedRows.Items[i]));



//  First;
//  while not Eof do
//  begin
  if FieldByName('IS_IMPORTED').AsInteger=0 then
  begin
  if (FieldByName('ID_CLI_D').AsInteger<>Unknown_code) and
     (FieldByName('ID_CLI_K').AsInteger<>Unknown_code) and
     (FieldByName('ID_DOC_TYPE').AsInteger<>Unknown_code)  then
  begin

   MessageDlg('Сохранение не реализовано!', mtError,
      [mbOk], 0);

   {
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_NAKLCAP']:=Unknown_code;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_DOC_TYPE']:=FieldByName('ID_DOC_TYPE').AsInteger;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@D']:=FieldByName('D').AsFloat;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NN']:=FieldByName('NN').AsString;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLIENT']:=FieldByName('ID_CLI_D').AsInteger;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@CHEREZ']:='';
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@DOVER']:='';
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@OSNOV']:='';
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@UDOST']:='';
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@FORMOPL']:='';
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TRANSP']:=0.0;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TARA']:=0.0;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PLUS']:=0.0;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@MINUS']:=0.0;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ZATRNAME']:=FieldByName('COMMENT').AsString;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ZATR']:=0.0;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PRICE_KATEG']:=1;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@IS_PRICE_WITHOUT_NDS']:=0;

    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_USER']:=id_user_select;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_SUPPLYER']:=QDefaultSetting.FieldByName('ID_OUR_FIRM').AsInteger;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TOT_SUM']:=FieldByName('TOT_SUM').AsFloat;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@TOT_NUM']:=0;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NUM_TARA']:=0;
   // dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NUM_TARA_D']:=0;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_TARA']:=1;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLI_K']:=FieldByName('ID_CLI_K').AsInteger;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SCH_D']:=FieldByName('SCH_D_PROV').AsString;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@SCH_K']:=FieldByName('SCH_K_PROV').AsString;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@NDS']:=0;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@STAVKA_NDS']:=0.2;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@IS_DELETE']:=0;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_LINK_DOC_NEW']:=Unknown_code;
    dm1.SP_SAVE_NAKL.Parameters.ParamValues['@PER_NACENKA']:=0;
   // dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_USLUGI']:=Unknown_code;
   // dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_CLI_HOST_PRICE']:=-1;


    dm1.SP_SAVE_NAKL.ExecProc;
    ID_NAKLCAP:=dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ID_NC_NEW'];
    if dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ER']<>0 then
    begin
      MessageDlg('Ошибка при сохранении нового документа!'+
      dm1.SP_SAVE_NAKL.Parameters.ParamValues['@ER_COMMENT'], mtError,
      [mbOk], 0);
    end
    else
    begin
      Edit;
      FieldByName('IS_IMPORTED').AsInteger:=1;
      Post;
    end;
  }
  end
  else // if (FieldByName('ID_CLI_D').AsInteger<>Unknown_code) and  ...
  begin
     MessageDlg('К документу '+FieldByName('NN').AsString+' не привязан дебетор или кредитор или тип документа!', mtError,
      [mbOk], 0);
  end;
  end; // if FieldByName('IS_IMPORTED').AsInteger=0 then
  //  Next;
 // end; // while not Eof do
  end;  // for i:=0 to DBGrid1.SelectedRows.Count-1 do
 end; // with ADS_IMPORT_BANK_TMP do
 FoundRec(-1);
end;

procedure TF_Import_Bank.FormShow(Sender: TObject);
begin
if not QDefaultSetting.Active then QDefaultSetting.Open;
FoundRec(-1);
Caption:='Импорт документов из системы клиент-банк.';

end;




procedure TF_Import_Bank.BB_BANK_VypiskaClick(Sender: TObject);
begin
 if XML_File_Name_Vypiska<>'' then
 begin
  SP_DEL_IMPORT_BANK_USER.Parameters.ParamValues['@ID_USER']:=id_user_select;
   SP_DEL_IMPORT_BANK_USER.Parameters.ParamValues['@ID_IMPORT_DOC']:=-1;
  SP_DEL_IMPORT_BANK_USER.ExecProc;
  if SP_DEL_IMPORT_BANK_USER.Parameters.ParamValues['@ER']<>0 then
  begin
    MessageDlg('Ошибка при удалении старой информации о импорте банковских документов!', mtError,
      [mbOk], 0);
  end
  else
  begin
    FoundRec(-1);
    Import_Vypiska;
    Link_Deb_Kred;
  end; // else if SP_DEL_IMPORT_BANK_USER.Parameters.ParamValues['@ER']<>0 then
  FoundRec(-1);
  

 end
 else MessageDlg('Не задан XML-файл выписок банка!', mtError,
      [mbOk], 0);

end;

procedure TF_Import_Bank.BBDeleteImportDataClick(Sender: TObject);
begin
 SP_DEL_IMPORT_BANK_USER.Parameters.ParamValues['@ID_USER']:=id_user_select;
 SP_DEL_IMPORT_BANK_USER.Parameters.ParamValues['@ID_IMPORT_DOC']:=-1;

  SP_DEL_IMPORT_BANK_USER.ExecProc;
  if SP_DEL_IMPORT_BANK_USER.Parameters.ParamValues['@ER']<>0 then
  begin
    MessageDlg('Ошибка при удалении старой информации о импорте банковских документов!', mtError,
      [mbOk], 0);
  end;
FoundRec(-1);

end;

procedure TF_Import_Bank.BBRefreshClick(Sender: TObject);
begin
 FoundRec(ADS_IMPORT_BANK_TMP.FieldByName('ID_IMPORT_DOC').AsInteger);
end;

procedure TF_Import_Bank.FoundRec(ID_Rec:integer);
begin
 DBGrid1.SelectedRows.Clear;
  ADS_IMPORT_BANK_TMP.DisableControls;
  ADS_IMPORT_BANK_TMP.Close;
  ADS_IMPORT_BANK_TMP.Parameters.ParamByName('IDUSER').Value:=id_user_select;
  ADS_IMPORT_BANK_TMP.Open;
  if ID_Rec <> -1 then
      ADS_IMPORT_BANK_TMP.Locate('ID_IMPORT_DOC', ID_Rec ,[loCaseInsensitive]);
  ADS_IMPORT_BANK_TMP.EnableControls;

end;


procedure TF_Import_Bank.BBDeleteImportRecClick(Sender: TObject);
var pred_ID_Rec, next_ID_Rec,carrent_ID_Rec:longint;

begin
DBGrid1.SelectedRows.Clear;
with ADS_IMPORT_BANK_TMP do
begin

 carrent_ID_Rec:=FieldByName('ID_IMPORT_DOC').AsInteger;
 DisableControls;
 prior;
 pred_ID_Rec:=FieldByName('ID_IMPORT_DOC').AsInteger;
 if carrent_ID_Rec=pred_ID_Rec then Next
 else begin Next; Next; end;
 next_ID_Rec:=FieldByName('ID_IMPORT_DOC').AsInteger;
 EnableControls;

 FoundRec(carrent_ID_Rec);
  SP_DEL_IMPORT_BANK_USER.Parameters.ParamValues['@ID_USER']:=id_user_select;
 SP_DEL_IMPORT_BANK_USER.Parameters.ParamValues['@ID_IMPORT_DOC']:=carrent_ID_Rec;
  SP_DEL_IMPORT_BANK_USER.ExecProc;
  if SP_DEL_IMPORT_BANK_USER.Parameters.ParamValues['@ER']=0 then
  begin
  if pred_ID_Rec=carrent_ID_Rec then // удаляем 1-ю
          FoundRec(next_ID_Rec)
        else
          if next_ID_Rec=carrent_ID_Rec then // удаляем последнюю
            FoundRec(pred_ID_Rec)
          else FoundRec(pred_ID_Rec);

  end
  else
  begin
    MessageDlg('Ошибка при удалении записи о импорте банковских документов!', mtError,
      [mbOk], 0);
  end;


end;   // with ADS_IMPORT_BANK_TMP do

end;



procedure TF_Import_Bank.Import_Vypiska;

var
  XML: IXMLDOMDocument;
 list_Bank_doc:IXMLDOMNodeList;
 Element_Bank_doc:IXMLDOMNode;
 i,j:integer;
 s:string;
  y,m,d:word;
  is_Import_Rashod:boolean;
begin

 if not QDefaultSetting.Active then QDefaultSetting.Open;

    XML := CoDOMDocument.Create;

  try
    XML.load(XML_File_Name_Vypiska);
    list_Bank_doc:=XML.getElementsByTagName('ROW');
    for i:=0 to list_Bank_doc.length-1 do
    begin
      Element_Bank_doc:=list_Bank_doc.Item[i] ;
      ADS_IMPORT_BANK_TMP.Append;
     // Atributes_Element_Bank_doc:=Element_Bank_doc.attributes;
     // определение вида операции приход или расход
     is_Import_Rashod:=False;
     for j:=0 to Element_Bank_doc.attributes.length-1 do
     begin
      if Element_Bank_doc.attributes.item[j].nodeName='OPERATIONID' then    // вид операции 0- расход с банка 1- приход
      begin
        is_Import_Rashod:=(Element_Bank_doc.attributes.item[j].nodeValue='0');
        ADS_IMPORT_BANK_TMP.FieldByName('DK').AsInteger:=
          StrToInt(Element_Bank_doc.attributes.item[j].nodeValue);
              
      end;
     end; // for j:=0 to Element_Bank_doc.attributes.length-1 do


      for j:=0 to Element_Bank_doc.attributes.length-1 do
      begin

        with ADS_IMPORT_BANK_TMP do
        begin

          if is_Import_Rashod then
          begin  // расход
            ADS_IMPORT_BANK_TMPID_CLI_D.ReadOnly:=False;
            FieldByName('ID_CLI_D').AsInteger:=Unknown_code;
            ADS_IMPORT_BANK_TMPID_CLI_D.ReadOnly:=True;
            if Element_Bank_doc.attributes.item[j].nodeName='CORRACCOUNTNO' then    // р/с  дебетора
            begin
              FieldByName('RS_D').AsString:=Element_Bank_doc.attributes.item[j].nodeValue;
            end;
            if Element_Bank_doc.attributes.item[j].nodeName='CORRIDENTIFYCODE' then    // ОКПО дебетора
            begin
              FieldByName('OKPO_D').AsString:=Element_Bank_doc.attributes.item[j].nodeValue;
            end;
            if Element_Bank_doc.attributes.item[j].nodeName='CORRCONTRAGENTSNAME' then    // имя дебетора
            begin
              FieldByName('CLI_D').AsString:=Element_Bank_doc.attributes.item[j].nodeValue;
            end;
            ADS_IMPORT_BANK_TMPID_CLI_K.ReadOnly:=False;
            FieldByName('ID_CLI_K').AsInteger:=QDefaultSetting.FieldByName('ID_OUR_FIRM').AsInteger;
            ADS_IMPORT_BANK_TMPID_CLI_K.ReadOnly:=True;
            FieldByName('RS_K').AsString:=QDefaultSetting.FieldByName('RS').AsString;
            FieldByName('OKPO_K').AsString:=QDefaultSetting.FieldByName('OKPO').AsString;
            FieldByName('CLI_K').AsString:=QDefaultSetting.FieldByName('FIRM_OUR_DEF').AsString;

          end
          else
          begin  // приход
            ADS_IMPORT_BANK_TMPID_CLI_K.ReadOnly:=False;
            FieldByName('ID_CLI_K').AsInteger:=Unknown_code;
            ADS_IMPORT_BANK_TMPID_CLI_K.ReadOnly:=True;
            if Element_Bank_doc.attributes.item[j].nodeName='CORRACCOUNTNO' then    // р/с  дебетора
            begin
              FieldByName('RS_K').AsString:=Element_Bank_doc.attributes.item[j].nodeValue;
            end;
            if Element_Bank_doc.attributes.item[j].nodeName='CORRIDENTIFYCODE' then    // ОКПО дебетора
            begin
              FieldByName('OKPO_K').AsString:=Element_Bank_doc.attributes.item[j].nodeValue;
            end;
            if Element_Bank_doc.attributes.item[j].nodeName='CORRCONTRAGENTSNAME' then    // имя дебетора
            begin
              FieldByName('CLI_K').AsString:=Element_Bank_doc.attributes.item[j].nodeValue;
            end;
             ADS_IMPORT_BANK_TMPID_CLI_D.ReadOnly:=False;
            FieldByName('ID_CLI_D').AsInteger:=QDefaultSetting.FieldByName('ID_OUR_FIRM').AsInteger;
             ADS_IMPORT_BANK_TMPID_CLI_D.ReadOnly:=True;
            FieldByName('RS_D').AsString:=QDefaultSetting.FieldByName('RS').AsString;
            FieldByName('OKPO_D').AsString:=QDefaultSetting.FieldByName('OKPO').AsString;
            FieldByName('CLI_D').AsString:=QDefaultSetting.FieldByName('FIRM_OUR_DEF').AsString;
          end; // if is_Import_Rashod then

          FieldByName('ID_USER').Asinteger:=id_user_select;
          if Element_Bank_doc.attributes.item[j].nodeName='ARCDATE' then    // дата валютования документа
          begin
            s:=Element_Bank_doc.attributes.item[j].nodeValue;
            y:=StrToInt(Copy(s,1,4));
            m:=StrToInt(Copy(s,5,2));
            d:=StrToInt(Copy(s,7,2));
            FieldByName('D').AsFloat:=EncodeDate(y,m,d);
          end;
          if Element_Bank_doc.attributes.item[j].nodeName='DOCUMENTNO' then    // № документа
          begin
            FieldByName('NN').AsString:=Element_Bank_doc.attributes.item[j].nodeValue;
          end;
          if Element_Bank_doc.attributes.item[j].nodeName='SUMMA' then    // сумма
          begin
            // в XML файле сумма выражена в целых копейках
            FieldByName('TOT_SUM').AsFloat:=StrToFloat(Element_Bank_doc.attributes.item[j].nodeValue)/100;
          end;
          if Element_Bank_doc.attributes.item[j].nodeName='PLATPURPOSE' then    // содержание
          begin
            FieldByName('COMMENT').AsString:=Element_Bank_doc.attributes.item[j].nodeValue;
          end;

          FieldByName('ID_DOC_TYPE').Asinteger:=Unknown_code;
        end; //  with ADS_IMPORT_BANK_TMP do


      end; // for j:=0 to Element_Bank_doc.attributes.length-1 do




      ADS_IMPORT_BANK_TMP.Post;

    end;  // for i:=0 to list_Bank_doc.length-1 do


  finally

     XML:= nil;

  end;


end;





procedure TF_Import_Bank.BBPathClick(Sender: TObject);
begin
  IniFile:=TIniFile.Create(GetSpecialPath(CSIDL_COMMON_APPDATA)+'\'+
   ChangeFileExt(ExtractFileName(Application.ExeName), '.ini'));
  path_to_xml:=IniFile.ReadString('import_bank', 'path_to_xml','');
  OpenDialog1.InitialDir:=path_to_xml;
if OpenDialog1.Execute then
 begin
  XML_File_Name_Vypiska:= OpenDialog1.FileName;
  E_FileName.Text:=XML_File_Name_Vypiska;
  path_to_xml:=ExtractFilePath(XML_File_Name_Vypiska);
  IniFile.WriteString('import_bank', 'path_to_xml',path_to_xml);

  IniFile.Free;
  
  BB_BANK_VypiskaClick(Sender);


 end;  // if OpenDialog1.Execute then
end;

procedure TF_Import_Bank.FormCreate(Sender: TObject);
begin
Caption:=work_DB+'/ Импорт документов из системы клиент-банк';
XML_File_Name_Vypiska:='';
TForm(DBGrid1).OnMouseWheel := MouseWheel;
CarentColumn:=nil;
end;




procedure TF_Import_Bank.MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if WheelDelta>0 then
  begin
    if not TDBGrid(Sender).DataSource.DataSet.Bof
      then TDBGrid(Sender).DataSource.DataSet.Prior;
  end
  else
  begin
    if not TDBGrid(Sender).DataSource.DataSet.Eof
      then TDBGrid(Sender).DataSource.DataSet.Next;
  end;
 
  Handled := True;
end;

procedure TF_Import_Bank.BBSelectAllClick(Sender: TObject);
begin
if ADS_IMPORT_BANK_TMP.Active then  GridSelectAll(DBGrid1);
end;



function TF_Import_Bank.GridSelectAll(Grid: TDBGrid): Longint;
begin
  Result := 0;
 
  Grid.SelectedRows.Clear;
  with Grid.Datasource.DataSet do
  begin
    First;
    DisableControls;
    try
      while not EOF do
      begin
        Grid.SelectedRows.CurrentRowSelected := True;
        inc(Result);
        Next;
      end;
    finally
       First;
      EnableControls;
    end;
  end;

end;


procedure TF_Import_Bank.DBGrid1EditButtonClick(Sender: TObject);
begin
 with ADS_IMPORT_BANK_TMP do
  begin
    if State in [dsInsert,dsEdit] then Post;

    if CarentColumn.FieldName='SCH_D_PROV' then
    begin
      if F_SchDlg= mrOk then
      begin
        ADS_IMPORT_BANK_TMPSCH_D_PROV.ReadOnly:=False;
        Edit;
        FieldByName('SCH_D_PROV').asString:=ID_sch_select;
        Post;
        ADS_IMPORT_BANK_TMPSCH_D_PROV.ReadOnly:=True;
       end;
   end;

    if CarentColumn.FieldName='SCH_K_PROV' then
    begin
      if F_SchDlg= mrOk then
      begin
        ADS_IMPORT_BANK_TMPSCH_K_PROV.ReadOnly:=False;
        Edit;
        FieldByName('SCH_K_PROV').asString:=ID_sch_select;
        Post;
        ADS_IMPORT_BANK_TMPSCH_K_PROV.ReadOnly:=True;
       end;
   end;



  if CarentColumn.FieldName='CLI_D_MY' then
  begin
    if F_clientDlg_1(-1,'',ID_Client_select_1)= mrOk then
    begin
      ADS_IMPORT_BANK_TMPID_CLI_D.ReadOnly:=False;
      Edit;
      FieldByName('ID_CLI_D').asInteger:=ID_Client_select_1;
      Post;
      ADS_IMPORT_BANK_TMPID_CLI_D.ReadOnly:=True;
    end;
  end;

  if CarentColumn.FieldName='CLI_K_MY' then
  begin
    if F_clientDlg_1(-1,'',ID_Client_select_1)= mrOk then
    begin
      ADS_IMPORT_BANK_TMPID_CLI_K.ReadOnly:=False;
      Edit;
      FieldByName('ID_CLI_K').asInteger:=ID_Client_select_1;
      Post;
      ADS_IMPORT_BANK_TMPID_CLI_K.ReadOnly:=True;
    end;
  end;


 end; // with ADS_IMPORT_BANK_TMP do
 FoundRec(ADS_IMPORT_BANK_TMP.FieldByName('ID_IMPORT_DOC').AsInteger);
end;

procedure TF_Import_Bank.DBGrid1CellClick(Column: TColumn);
begin
CarentColumn:=Column;
end;

procedure TF_Import_Bank.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

if ((Column.FieldName ='deb_kred') and
(ADS_IMPORT_BANK_TMP.FieldByName('IS_IMPORTED').AsInteger=1)) then
  begin
 	 DBGrid1.Canvas.Brush.Color := clLime;
 	 DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  end;

  if ((Column.FieldName ='deb_kred') and
  (

  (ADS_IMPORT_BANK_TMP.FieldByName('ID_CLI_D').AsInteger=Unknown_code) or
     (ADS_IMPORT_BANK_TMP.FieldByName('ID_CLI_K').AsInteger=Unknown_code) or
     (ADS_IMPORT_BANK_TMP.FieldByName('ID_DOC_TYPE').AsInteger=Unknown_code)


  )) then
  begin

   DBGrid1.Canvas.Font.Color := clRed;
 	 DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  end;



end;

procedure TF_Import_Bank.BB_NotImpClick(Sender: TObject);

var i  : integer;
begin
 if DBGrid1.SelectedRows.Count=0 then
 begin
   MessageDlg('Не выбраны строки для изменения!', mtError,
      [mbOk], 0);
   Exit;
 end;
 with ADS_IMPORT_BANK_TMP do
 begin
  for i:=0 to DBGrid1.SelectedRows.Count-1 do
  begin
    DBGrid1.DataSource.DataSet.GotoBookmark(DBGrid1.SelectedRows.Items[i]);
      Edit;
      FieldByName('IS_IMPORTED').AsInteger:=0;
      Post;

  end;  // for i:=0 to DBGrid1.SelectedRows.Count-1 do
 end; // with ADS_IMPORT_BANK_TMP do
 FoundRec(-1);
end;

end.
