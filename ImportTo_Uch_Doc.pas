unit ImportTo_Uch_Doc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, ComObj, ADODB, DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Clipbrd,
  Vcl.ComCtrls;

type
  TF_ImportTo_Uch_Doc = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Q_IMPORT_NAKLTOV_TMP: TADOQuery;
    Q_IMPORT_NAKLTOV_TMPID: TAutoIncField;
    Q_IMPORT_NAKLTOV_TMPID_TOV_SOURCE: TIntegerField;
    Q_IMPORT_NAKLTOV_TMPNAME_TOV_SOURCE: TWideStringField;
    Q_IMPORT_NAKLTOV_TMPNAME_TOV_DEST: TWideStringField;
    Q_IMPORT_NAKLTOV_TMPNUMB: TFloatField;
    Q_IMPORT_NAKLTOV_TMPPRICE: TFloatField;
    Q_IMPORT_NAKLTOV_TMPID_GRTOV_SOURCE: TIntegerField;
    Q_IMPORT_NAKLTOV_TMPGRTOV_SOURCE: TWideStringField;
    Q_IMPORT_NAKLTOV_TMPPART_SOURCE: TWideStringField;
    Q_IMPORT_NAKLTOV_TMPID_TOV_DEST: TIntegerField;
    Q_IMPORT_NAKLTOV_TMPID_GRTOV_DEST: TIntegerField;
    Q_IMPORT_NAKLTOV_TMPGRTOV_DEST: TWideStringField;
    Q_IMPORT_NAKLTOV_TMPPART_DEST: TWideStringField;
    Q_IMPORT_NAKLTOV_TMPID_USER: TIntegerField;
    DS_Q_IMPORT_NAKLTOV_TMP: TDataSource;
    DBGrid4: TDBGrid;
    BB_ImportTov: TBitBtn;
    Label5: TLabel;
    QCountTov: TADOQuery;
    BB_PrepTov: TBitBtn;
    DBNavigator4: TDBNavigator;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    E_ID_CLI_K_Source: TEdit;
    E_CLI_K_Dest: TEdit;
    E_ID_CLI_K_Dest: TEdit;
    E_CLI_K_Source: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    E_ID_CLI_D_Source: TEdit;
    E_CLI_D_Dest: TEdit;
    E_ID_CLI_D_Dest: TEdit;
    E_CLI_D_Source: TEdit;
    BBSel_K: TBitBtn;
    BBSel_D: TBitBtn;
    SP_ADD_HOOKUP_CLI: TADOStoredProc;
    L_Doc_NN_DD: TLabel;
    SP_ADD_LIST_TOV_IMPORT: TADOStoredProc;
    QGetCli_Dest: TADOQuery;
    Label10: TLabel;
    E_Kateg_K_Dest: TEdit;
    Label11: TLabel;
    E_Kateg_D_Dest: TEdit;
    SP_EDIT_LIST_TOV_IMPORT: TADOStoredProc;
    SP_ADD_HOOKUP_TOV: TADOStoredProc;
    SP_CREATE_DOC_FROM_IMPORT: TADOStoredProc;
    BBSetting: TBitBtn;
    BitBtn1: TBitBtn;
    Q_IMPORT_NAKLTOV_TMPPRICE1: TFloatField;
    Q_IMPORT_NAKLTOV_TMPEDIZM_SOURCE: TWideStringField;
    Q_IMPORT_NAKLTOV_TMPEDIZM_DEST: TWideStringField;
    BB_PrepCap: TBitBtn;
    BBReCalcPrice: TBitBtn;
    ADOCommand_SetPrice_from_Specification: TADOCommand;
    ADOCommandUpdateOrder: TADOCommand;
    E_NN: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    DTP_NAKL: TDateTimePicker;
    BB_UpdateNameTov: TBitBtn;
    ADOCommandUpdateNameTov: TADOCommand;
    ADOCommandUpdateNameTov_1: TADOCommand;
    procedure BBSel_KClick(Sender: TObject);
    procedure BBSel_DClick(Sender: TObject);
    procedure BB_PrepTovClick(Sender: TObject);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBGrid4EditButtonClick(Sender: TObject);
    procedure BB_ImportTovClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BBSettingClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BB_PrepCapClick(Sender: TObject);
    procedure BBReCalcPriceClick(Sender: TObject);
    procedure E_NNChange(Sender: TObject);
    procedure DTP_NAKLChange(Sender: TObject);
    procedure BB_UpdateNameTovClick(Sender: TObject);
    procedure BB_UpdateNameTovMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_DOC_TYPE:longint;
    Attach_File_Name:string;
    ID_CLI_D_Source, ID_CLI_K_Source:longint; //  int64;//--
    ID_CLI_D_Dest, ID_CLI_K_Dest: longint; // int64;

    CTRLBooleanView:integer;
    ID_Vendor:longint;
    Vendor:string;
    kateg_vendor:string;
    NN:string; // номер накладной
    D:TDateTime; // дата накладной
    CarentColumn:TColumn;
    ID_NC_NEW:longint; // код созданного из импорта документа
    procedure Read_Xls_Nakl(XLSFile:string);
    procedure Read_Xls_Nakl_1(XLSFile:string);
    procedure Read_Xls_Nakl_CAP(XLSFile:string);
    function Control_HookupTov:integer; // проверка установлены ли связи по всем товарам документа
    procedure CreateDoc;
    procedure ReopenQ(id:longint);
    procedure Mark_Order_As_Complete();
  end;

var
  F_ImportTo_Uch_Doc: TF_ImportTo_Uch_Doc;

  function F_ImportTo_Uch_Doc_Dlg(vID_DOC_TYPE:longint; vAttach_File_Name:string;
   vID_Vendor: longint; vVendor:string; vkateg_vendor:string; var vID_NC_NEW:longint):integer;

implementation

{$R *.dfm}
uses CLIENT_F1, myfuncs, dm_orders, users_f, Host_tov_list_f, Orders_f, ReadMail;


function F_ImportTo_Uch_Doc_Dlg(vID_DOC_TYPE:longint; vAttach_File_Name:string;
vID_Vendor: longint; vVendor:string; vkateg_vendor:string;  var vID_NC_NEW:longint):integer;
begin
 F_ImportTo_Uch_Doc:=TF_ImportTo_Uch_Doc.Create(Application);
 with F_ImportTo_Uch_Doc do
 begin
  try
    Vendor:=vVendor;
    ID_Vendor:=vID_Vendor;
    kateg_vendor:=vkateg_vendor;
    Caption:= 'Импорт документа от '+ Vendor;
    ID_DOC_TYPE :=vID_DOC_TYPE;
    Attach_File_Name:=vAttach_File_Name;
    ID_CLI_D_Source:=Unknown_code;
    ID_CLI_K_Source:=Unknown_code;
    ID_CLI_D_Dest:=Unknown_code;
    ID_CLI_K_Dest:=Unknown_code;
    E_ID_CLI_D_Source.Text:=IntToStr(ID_CLI_D_Source);
    E_ID_CLI_K_Source.Text:=IntToStr(ID_CLI_K_Source);
    E_ID_CLI_D_Dest.Text:=IntToStr(ID_CLI_D_Dest);
    E_ID_CLI_K_Dest.Text:=IntToStr(ID_CLI_K_Dest);
    E_CLI_D_Source.Text:=Unknown_str;
    E_CLI_K_Source.Text:=Unknown_str;
    E_CLI_D_Dest.Text:=Unknown_str;
    E_CLI_K_Dest.Text:=Unknown_str;
    E_Kateg_D_Dest.Text:=Unknown_str;
    E_Kateg_K_Dest.Text:=Unknown_str;
    L_Doc_NN_DD.Caption:='';
    BBSel_D.Enabled:=False;
    BBSel_K.Enabled:=False;
    result:=ShowModal;
    vID_NC_NEW:=ID_NC_NEW;
  finally
   Free;
   F_ImportTo_Uch_Doc:=Nil;
  end;
 end;
end;



procedure TF_ImportTo_Uch_Doc.Read_Xls_Nakl_CAP(XLSFile:string);
 const
  xlCellTypeLastCell = $0000000B;
var
  ExlApp, Sheet: OLEVariant;
  i, j, r, c:integer;
  first_str_tov, last_str_tov:integer;
  var
  Xml: TStringList;
  s:string;
begin
  //создаем объект Excel
  ExlApp := CreateOleObject('Excel.Application');

  //делаем окно Excel невидимым
  ExlApp.Visible := false;

  //открываем файл XLSFile
  ExlApp.Workbooks.Open(XLSFile);

  //создаем объект Sheet(страница) и указываем номер листа (1)
  //в книге, с которого будем осуществлять чтение
  Sheet := ExlApp.Workbooks[ExtractFileName(XLSFile)].WorkSheets[1];

  // номер накладной
  j:=1;
  i:=3;
  NN:=sheet.cells[j,i];
  // дата накладной
  j:=1;
  i:=5;
  D:=StrToDateTime(Trim(sheet.cells[j,i]));
   // получатель
  j:=3;
  i:=1;
  E_CLI_D_Source.Text:=Trim(sheet.cells[j,i]);
  j:=3;
  i:=3;
  ID_CLI_D_Source:= StrToInt(Trim(sheet.cells[j,i]));// StrToInt64(Trim(sheet.cells[j,i]));
  E_ID_CLI_D_Source.Text:=IntToStr(ID_CLI_D_Source);
   // поставщик
  j:=5;
  i:=1;
  E_CLI_K_Source.Text:=Trim(sheet.cells[j,i]);
  j:=5;
  i:=3;
  ID_CLI_K_Source:=StrToInt(Trim(sheet.cells[j,i]));  //StrToInt64(Trim(sheet.cells[j,i]));
  E_ID_CLI_K_Source.Text:=IntToStr(ID_CLI_K_Source);


  // связать инфо о дебиторе и кредиторе с нашей кодировкой
  with QGetCli_Dest  do
  begin
    Close;
    Parameters.ParamByName('ID_Vendor').Value:=ID_Vendor;
    Parameters.ParamByName('ID_CLI_Source').Value:=ID_CLI_D_Source;
    Open;
    First;
    ID_CLI_D_Dest:=FieldByName('ID_CLI_DEST').AsInteger;
    E_ID_CLI_D_Dest.Text:=IntToStr(ID_CLI_D_Dest);
    E_CLI_D_Dest.Text:=FieldByName('CLI_DEST').AsString;
    E_Kateg_D_Dest.Text:=FieldByName('KATEG_DEST').AsString;
    Close;
    Parameters.ParamByName('ID_Vendor').Value:=ID_Vendor;
    Parameters.ParamByName('ID_CLI_Source').Value:=ID_CLI_K_Source;
    Open;
    First;
    ID_CLI_K_Dest:=FieldByName('ID_CLI_DEST').AsInteger;
    E_ID_CLI_K_Dest.Text:=IntToStr(ID_CLI_K_Dest);
    E_CLI_K_Dest.Text:=FieldByName('CLI_DEST').AsString;
    E_Kateg_K_Dest.Text:=FieldByName('KATEG_DEST').AsString;
    Close;

  end;


 //закрываем приложение Excel
 ExlApp.Quit;

 //очищаем выделенную память
 ExlApp := Unassigned;
 Sheet := Unassigned;

end;









procedure TF_ImportTo_Uch_Doc.Read_Xls_Nakl(XLSFile:string);
 const
  xlCellTypeLastCell = $0000000B;
var
  ExlApp, Sheet: OLEVariant;
  i, j, r, c:integer;
  first_str_tov, last_str_tov:integer;
  var
  Xml: TStringList;
  s,st,ste:string;
  v_3,v_1,v_2:extended;
begin
  //создаем объект Excel
  ExlApp := CreateOleObject('Excel.Application');

  //делаем окно Excel невидимым
  ExlApp.Visible := false;

  //открываем файл XLSFile
  ExlApp.Workbooks.Open(XLSFile);

  //создаем объект Sheet(страница) и указываем номер листа (1)
  //в книге, с которого будем осуществлять чтение
  Sheet := ExlApp.Workbooks[ExtractFileName(XLSFile)].WorkSheets[1];
  Xml := TStringList. Create;
  try


  //активируем последнюю ячейку на листе
  Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
  // Возвращает номер последней активной строки
  r := ExlApp.ActiveCell.Row;


  // ищем последнюю строку со значением в 8-й колонке
  // уточняем r - последнюю строку
  for j := 8 to r do
  begin
    s:= sheet.cells[j,8];
    if not TryStrToFloat(Trim(s), v_3) then
    begin
      r:=j-1;
      break;
    end;

  end;

  s:= sheet.cells[r,8];
  v_3:=0.0;
  TryStrToFloat(Trim(s), v_3);
  s:= sheet.cells[r-1,8];
  v_2:=0.0;
  TryStrToFloat(Trim(s), v_2);
  s:= sheet.cells[r-2,8];
  v_1:=0.0;
  TryStrToFloat(Trim(s), v_1);
  if not ((v_3>Eps) // and (v_2<Eps)
  and (abs(v_3-v_2-v_1)<=1))  then
  begin
   //  MessageDlg('Нет концовки файла данных', mtError, [mbOk], 0);
     raise Exception.Create('Не правильная концовки файла данных!');

  end;


   // Получаем значение последней колонки
 // c := ExlApp.ActiveCell.Column;
//  s:= sheet.cells[r,c];

  // Возвращает номер последнего столбца
 // c := ExlApp.ActiveCell.Column;
  first_str_tov:=8;
  last_str_tov:=r-3; // последняя строка табличных данных о товарах


  // формируем документ
 // Xml. Add ('<?xml version="1.0" encoding="windows-1251"?>');
  // 	<sourcetovlist><sourcetov><ID_TOV>5587</ID_TOV><TOV_NAME>Имя товара</TOV_NAME>
  // <NUMB>1</NUMB><PRICE>452.0</PRICE></sourcetov></sourcetovlist>

  Xml. Add ('<sourcetovlist>');
  for j := first_str_tov to last_str_tov do
  begin
    Xml.Add ('<sourcetov>');

    // экранирование спец символов XML
  {  <! ENTITY lt "& # 38; # 60;">
<! ENTITY gt "& # 62;">
<! ENTITY amp "& # 38; # 38;">
<! ENTITY apos "& # 39;">
<! ENTITY quot "& # 34;">
   }
   

    s:='<ID_TOV>'+Trim(sheet.cells[j,4])+'</ID_TOV>';
    Xml.Add(s);
    st:=Trim(sheet.cells[j,3]);
    ste:= StringReplace(st, '&', '&amp;',[rfReplaceAll, rfIgnoreCase]);
    s:='<TOV_NAME>'+ste+'</TOV_NAME>';
    Xml.Add(s);

    s:='<NUMB>'+Trim(sheet.cells[j,6])+'</NUMB>';
    Xml.Add(s);

    s:='<PRICE>'+Trim(sheet.cells[j,7])+'</PRICE>';
    Xml.Add(s);

    Xml. Add ('</sourcetov>');

  end;

  Xml.Add ('</sourcetovlist>');

    // сформировать таблицу товаров и связать с нашей кодировкой
    SP_ADD_LIST_TOV_IMPORT.Parameters.ParamValues['@XML_SOURCE_TOV']:=Xml.Text;
    SP_ADD_LIST_TOV_IMPORT.Parameters.ParamValues['@ID_USER']:=ID_user_select;
    SP_ADD_LIST_TOV_IMPORT.Parameters.ParamValues['@ID_CLI']:=ID_Vendor;
    SP_ADD_LIST_TOV_IMPORT.ExecProc;
    if SP_ADD_LIST_TOV_IMPORT.Parameters.ParamValues['@ER']<>0
    then
    begin
       MessageDlg('Ошибка при установке связей кодировок товаров', mtError, [mbOk], 0);
    end;

    ReopenQ(-1);
  finally
      //закрываем приложение Excel
   ExlApp.Quit;

   //очищаем выделенную память
   ExlApp := Unassigned;
   Sheet := Unassigned;

   FreeAndNil (Xml);
  end;


end;



procedure TF_ImportTo_Uch_Doc.Read_Xls_Nakl_1(XLSFile:string);
 const
  xlCellTypeLastCell = $0000000B;
var
  ExlApp, Sheet: OLEVariant;
  i, j, r, c:integer;
  first_str_tov, last_str_tov:integer;
  var
  Xml: TStringList;
  s:string;
begin
  //создаем объект Excel
  ExlApp := CreateOleObject('Excel.Application');

  //делаем окно Excel невидимым
  ExlApp.Visible := false;

  //открываем файл XLSFile
  ExlApp.Workbooks.Open(XLSFile);

  //создаем объект Sheet(страница) и указываем номер листа (1)
  //в книге, с которого будем осуществлять чтение
  Sheet := ExlApp.Workbooks[ExtractFileName(XLSFile)].WorkSheets[1];

  // номер накладной
  j:=3;
  i:=17;
  NN:=sheet.cells[j,i];
  // дата накладной
  j:=3;
  i:=23;
  D:=StrToDate(Trim(sheet.cells[j,i]));
   // получатель
  j:=8;
  i:=7;
  E_CLI_D_Source.Text:=Trim(sheet.cells[j,i]);
  j:=8;
  i:=36;
  ID_CLI_D_Source:=StrToInt(Trim(sheet.cells[j,i]));
  E_ID_CLI_D_Source.Text:=IntToStr(ID_CLI_D_Source);
   // поставщик
  j:=5;
  i:=7;
  E_CLI_K_Source.Text:=Trim(sheet.cells[j,i]);
  j:=5;
  i:=36;
  ID_CLI_K_Source:=StrToInt(Trim(sheet.cells[j,i]));
  E_ID_CLI_K_Source.Text:=IntToStr(ID_CLI_K_Source);

  // связать инфо о дебиторе и кредиторе с нашей кодировкой
  with QGetCli_Dest  do
  begin
    Close;
    Parameters.ParamByName('ID_Vendor').Value:=ID_Vendor;
    Parameters.ParamByName('ID_CLI_Source').Value:=ID_CLI_D_Source;
    Open;
    First;
    ID_CLI_D_Dest:=FieldByName('ID_CLI_DEST').AsInteger;
    E_ID_CLI_D_Dest.Text:=IntToStr(ID_CLI_D_Dest);
    E_CLI_D_Dest.Text:=FieldByName('CLI_DEST').AsString;
    E_Kateg_D_Dest.Text:=FieldByName('KATEG_DEST').AsString;
    Close;
    Parameters.ParamByName('ID_Vendor').Value:=ID_Vendor;
    Parameters.ParamByName('ID_CLI_Source').Value:=ID_CLI_K_Source;
    Open;
    First;
    ID_CLI_K_Dest:=FieldByName('ID_CLI_DEST').AsInteger;
    E_ID_CLI_K_Dest.Text:=IntToStr(ID_CLI_K_Dest);
    E_CLI_K_Dest.Text:=FieldByName('CLI_DEST').AsString;
    E_Kateg_K_Dest.Text:=FieldByName('KATEG_DEST').AsString;
    Close;

  end;

  //активируем последнюю ячейку на листе
  Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
  // Возвращает номер последней строки
  r := ExlApp.ActiveCell.Row;
  // Возвращает номер последнего столбца
 // c := ExlApp.ActiveCell.Column;
  first_str_tov:=13;
  last_str_tov:=r-3; // последняя строка табличных данных о товарах

  Xml := TStringList. Create;
  // формируем документ
 // Xml. Add ('<?xml version="1.0" encoding="windows-1251"?>');
  // 	<sourcetovlist><sourcetov><ID_TOV>5587</ID_TOV><TOV_NAME>Имя товара</TOV_NAME>
  // <NUMB>1</NUMB><PRICE>452.0</PRICE></sourcetov></sourcetovlist>

  Xml. Add ('<sourcetovlist>');
  for j := first_str_tov to last_str_tov do
  begin
    Xml.Add ('<sourcetov>');
    s:='<ID_TOV>'+Trim(sheet.cells[j,22])+'</ID_TOV>';
    Xml.Add(s);
    s:='<TOV_NAME>'+Trim(sheet.cells[j,9])+'</TOV_NAME>';
    Xml.Add(s);
    s:='<NUMB>'+Trim(sheet.cells[j,25])+'</NUMB>';
    Xml.Add(s);
    s:='<PRICE>'+Trim(sheet.cells[j,30])+'</PRICE>';
    Xml.Add(s);
    s:='<EDIZM>'+Trim(sheet.cells[j,28])+'</EDIZM>';
    Xml.Add(s);
    Xml. Add ('</sourcetov>');

  end;

  Xml.Add ('</sourcetovlist>');

    // сформировать таблицу товаров и связать с нашей кодировкой
    SP_ADD_LIST_TOV_IMPORT.Parameters.ParamValues['@XML_SOURCE_TOV']:=Xml.Text;
    SP_ADD_LIST_TOV_IMPORT.Parameters.ParamValues['@ID_USER']:=ID_user_select;
    SP_ADD_LIST_TOV_IMPORT.Parameters.ParamValues['@ID_CLI']:=ID_Vendor;
    SP_ADD_LIST_TOV_IMPORT.ExecProc;
    if SP_ADD_LIST_TOV_IMPORT.Parameters.ParamValues['@ER']<>0
    then
    begin
       MessageDlg('Ошибка при установке связей кодировок товаров', mtError, [mbOk], 0);
    end;

 //   ReopenQ(-1);

 //закрываем приложение Excel
 ExlApp.Quit;

 //очищаем выделенную память
 ExlApp := Unassigned;
 Sheet := Unassigned;

 FreeAndNil (Xml);
end;




procedure TF_ImportTo_Uch_Doc.ReopenQ(id:longint);
var i:integer;
begin
     with Q_IMPORT_NAKLTOV_TMP do
     begin
      Disablecontrols;
      Close;
      Parameters.ParamByName('ID_USER').Value:= ID_user_select;
      Parameters.ParamByName('ID_VENDOR').Value:= ID_Vendor;
      Parameters.ParamByName('D').Value:= D;
      Open;
      First;
      if id<>-1 then
       locate('ID', id, [loCaseInsensitive]);
      Enablecontrols
     end;

  for i:=0 to DbGrid4.Columns.Count-1 do
  begin
    if DbGrid4.Columns[i].FieldName='NAME_TOV_DEST' then  DbGrid4.Columns[i].ButtonStyle:=cbsEllipsis;
   end;
end;

procedure TF_ImportTo_Uch_Doc.BBReCalcPriceClick(Sender: TObject);
var id:longint;
begin
  id:=Q_IMPORT_NAKLTOV_TMP.FieldByName('ID').AsInteger;
  with ADOCommand_SetPrice_from_Specification do
  begin
    Parameters.ParamByName('ID_USER').Value:= ID_user_select;
    Parameters.ParamByName('ID_VENDOR').Value:= ID_Vendor;
    Parameters.ParamByName('D').Value:= D;
    Execute;
  end;
  ReopenQ(id);
end;

procedure TF_ImportTo_Uch_Doc.BBSel_DClick(Sender: TObject);
begin
  if F_clientDlg_1(2,'Торговая сеть',-1)=mrOk then
  begin
    ID_CLI_D_Dest:=ID_client_select_1;
    E_ID_CLI_D_Dest.Text:=IntToStr(ID_CLI_D_Dest);
    E_CLI_D_Dest.Text:=client_select_1;
    E_Kateg_D_Dest.Text:=kateg_cli_select_1;



    SP_ADD_HOOKUP_CLI.Parameters.ParamValues['@ID_CLI_SOURSE']:=ID_CLI_D_Source;
    SP_ADD_HOOKUP_CLI.Parameters.ParamValues['@ID_CLI_DEST']:=ID_CLI_D_Dest;
    SP_ADD_HOOKUP_CLI.Parameters.ParamValues['@ID_CLI']:=ID_Vendor;
    SP_ADD_HOOKUP_CLI.ExecProc;
    if SP_ADD_HOOKUP_CLI.Parameters.ParamValues['@ER']<>0
    then
    begin
       MessageDlg('Ошибка при установке связей кодировок клиентов', mtError, [mbOk], 0);
    end;

  end;
end;

procedure TF_ImportTo_Uch_Doc.BBSel_KClick(Sender: TObject);
begin
  if F_clientDlg_1(-1,'',ID_Vendor)=mrOk then
  begin
    ID_CLI_K_Dest:=ID_client_select_1;
    E_ID_CLI_K_Dest.Text:=IntToStr(ID_CLI_K_Dest);
    E_CLI_K_Dest.Text:=client_select_1;
    E_Kateg_K_Dest.Text:=kateg_cli_select_1;

    
    SP_ADD_HOOKUP_CLI.Parameters.ParamValues['@ID_CLI_SOURSE']:=ID_CLI_K_Source;
    SP_ADD_HOOKUP_CLI.Parameters.ParamValues['@ID_CLI_DEST']:=ID_CLI_K_Dest;
    SP_ADD_HOOKUP_CLI.Parameters.ParamValues['@ID_CLI']:=ID_Vendor;
    SP_ADD_HOOKUP_CLI.ExecProc;
    if SP_ADD_HOOKUP_CLI.Parameters.ParamValues['@ER']<>0
    then
    begin
       MessageDlg('Ошибка при установке связей кодировок клиентов', mtError, [mbOk], 0);
    end;



  end;
end;



procedure TF_ImportTo_Uch_Doc.BBSettingClick(Sender: TObject);
begin
   // сохранить настройки колонок DbGrid1 в секцию  'orders_f'  Ini файла
 SaveColumnPosToIni(DbGrid4, 'import_f');
end;

function TF_ImportTo_Uch_Doc.Control_HookupTov:integer; // проверка установлены ли связи по всем товарам документа
begin
  result:=0;
  with Q_IMPORT_NAKLTOV_TMP do
  begin
    if Active then
    begin
      if RecordCount=0 then
      begin
        MessageDlg('Нет товаров в документе!', mtError, [mbOk], 0);
        result:=3;
        exit;
      end;
    end
    else
     begin
        MessageDlg('Не выполнена подготовка документа к импору!', mtError, [mbOk], 0);
        result:=4;
        exit;
      end;
    DisableControls;
    first;
    while not EOF do
    begin
      if (FieldByName('ID_TOV_DEST').AsInteger=0) or (FieldByName('ID_TOV_DEST').AsInteger=-1) then
      begin
        MessageDlg('Не связаны кодировки товаров!', mtError, [mbOk], 0);
        result:=2;
        Break;
      end;


      if abs(FieldByName('PRICE').AsFloat-FieldByName('PRICE1').AsFloat)>eps then
      begin
        MessageDlg('Не соответствие цен накладной и спецификации!', mtError, [mbOk], 0);
        result:=2;
        Break;
      end;


      if (Trim(FieldByName('NAME_TOV_DEST').AsString)<>Trim(FieldByName('NAME_TOV_SOURCE').AsString)) then
      begin
        MessageDlg('Не совпадают наименования товаров поставщика и наши!', mtError, [mbOk], 0);
        result:=1;
        Break;
      end;
      Next;
    end;
    EnableControls;
  end;
end;


procedure TF_ImportTo_Uch_Doc.Mark_Order_As_Complete();
begin
   // отметка выполнения заказа
  with ADOCommandUpdateOrder do
  begin
    Parameters.ParamByName('D').Value:= D;
    Parameters.ParamByName('ID_DOC_TYPE').Value:= FOrders.ID_DOC_TYPE;
    Parameters.ParamByName('ID_CLI_D').Value:= ID_CLI_D_Dest;
    Parameters.ParamByName('ID_CLI_K').Value:= ID_CLI_K_Dest;
    Parameters.ParamByName('ID_LINK_DOC').Value:= ID_NC_NEW;
    Execute;
  end;

  //Attach_File_Name
  if FReadMail<>nil then
  begin
   with FReadMail.ADS_Attach_Files do
   begin
    Edit;
    FieldByName('Импорт').AsInteger:=1;
    Post;
   end;

  end;


end;


procedure TF_ImportTo_Uch_Doc.CreateDoc;
begin
        SP_CREATE_DOC_FROM_IMPORT.Parameters.ParamValues['@ID_USER']:=ID_user_select;
        SP_CREATE_DOC_FROM_IMPORT.Parameters.ParamValues['@ID_DOC_TYPE']:=ID_DOC_TYPE;
        SP_CREATE_DOC_FROM_IMPORT.Parameters.ParamValues['@D']:= D;
        SP_CREATE_DOC_FROM_IMPORT.Parameters.ParamValues['@NN']:= NN;
        SP_CREATE_DOC_FROM_IMPORT.Parameters.ParamValues['@ID_CLI_D']:=ID_CLI_D_Dest;
        SP_CREATE_DOC_FROM_IMPORT.Parameters.ParamValues['@ID_CLI_K']:=ID_CLI_K_Dest;
        SP_CREATE_DOC_FROM_IMPORT.ExecProc;
        if SP_CREATE_DOC_FROM_IMPORT.Parameters.ParamValues['@ER']=0
        then
        begin
          MessageDlg('Документ создан успешно!', mtInformation, [mbOk], 0);
          ID_NC_NEW:=SP_CREATE_DOC_FROM_IMPORT.Parameters.ParamValues['@ID_NC_NEW'];
          // отметка выполнения заказа
          Mark_Order_As_Complete();

          if MessageDlg(Format('Удалить excel файл импорта документа %s?',[Attach_File_Name]), mtWarning,
            [mbYes,mbNo], 0)=mrYes then
            begin
             if not DeleteFile(Attach_File_Name)
              then ShowMessage(Attach_File_Name+' не возможно удалить');

            end;


          modalresult:=mrOk;
        end
        else
        begin
          MessageDlg('Ошибка при создании документа!', mtError, [mbOk], 0);
          modalresult:=mrNone;
        end;
end;

procedure TF_ImportTo_Uch_Doc.BB_ImportTovClick(Sender: TObject);
var control_result:integer;
begin
  control_result:=Control_HookupTov;
  case control_result of
    0: // все хорошо - создаем наш документ
    begin
      CreateDoc;
    end; // 0: все хорошо - создаем наш документ
    1: //  Не совпадают наименования
    begin
       if MessageDlg('Не совпадают наименования. Создать с нашими как есть?', mtWarning,
        [mbYes,mbNo], 0)=mrYes then CreateDoc;
    end;

  end;

end;

procedure TF_ImportTo_Uch_Doc.BB_PrepTovClick(Sender: TObject);
var i:integer;
begin
  Read_Xls_Nakl(Attach_File_Name);
//  Read_Xls_Nakl_1(Attach_File_Name);
  {
     ID_Vendor:=ID_CLI_K_Dest;
    kateg_vendor:=E_Kateg_K_Dest.Text;
    Vendor:=E_CLI_K_Dest.Text;
   }
  L_Doc_NN_DD.Caption:=Format('Документ № %s от %s', [NN,DateToStr(D)]);
  BBSel_D.Enabled:=True;
  BBSel_K.Enabled:=True;
  ReopenQ(-1);
  with QCountTov do
     begin
      Close;
      Parameters.ParamByName('ID_USER').Value:= ID_user_select;
      Open;
      First;
      Label5.Caption:=Format('Всего кол-во %8.3f',[FieldByName('S_NUMB').AsFloat]);
     end;
end;

procedure TF_ImportTo_Uch_Doc.BB_UpdateNameTovClick(Sender: TObject);
begin
// Наименования товаров в нашем справочнике привести в соответствие наименованиям товаров поставщика


 if MessageDlg('Вы действительно хотите заменить наши наименования товаров на соответствующие наименования поставщика?',
 mtWarning, [mbYes,mbNo], 0)=mrYes then
 begin

    case CTRLBooleanView of
    0:     // товар текущей строки
      begin
        ADOCommandUpdateNameTov_1.Parameters.ParamByName('ID').Value:=
          Q_IMPORT_NAKLTOV_TMP.FieldByName('ID').AsInteger;
        ADOCommandUpdateNameTov_1.Execute;
      end;
    1:     // alt   все товары документа
      begin
        ADOCommandUpdateNameTov.Parameters.ParamByName('ID_USER').Value:= ID_user_select;
        ADOCommandUpdateNameTov.Execute;
      end;
    2: ; // shIFT
    3: ;  // CTRL
    end;


  BB_PrepTovClick(Sender);
 end;

end;

procedure TF_ImportTo_Uch_Doc.BB_UpdateNameTovMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 CTRLBooleanView:=0;
 if ssAlt in Shift then
      CTRLBooleanView:=1;
 if ssShift in Shift then
      CTRLBooleanView:=2;
 if  ssCtrl in Shift then
      CTRLBooleanView:=3;
 if  ssRight in Shift then
      CTRLBooleanView:=4;
end;

procedure TF_ImportTo_Uch_Doc.BB_PrepCapClick(Sender: TObject);
begin

 Read_Xls_Nakl_CAP(Attach_File_Name);
//  Read_Xls_Nakl_1(Attach_File_Name);
  {
     ID_Vendor:=ID_CLI_K_Dest;
    kateg_vendor:=E_Kateg_K_Dest.Text;
    Vendor:=E_CLI_K_Dest.Text;
   }
  L_Doc_NN_DD.Caption:=Format('Документ № %s от %s', [NN,DateToStr(D)]);
  E_NN.Text:=NN;
  DTP_NAKL.Date:=D;
  BBSel_D.Enabled:=True;
  BBSel_K.Enabled:=True;
  {
  ReopenQ(-1);
  with QCountTov do
     begin
      Close;
      Parameters.ParamByName('ID_USER').Value:= ID_user_select;
      Open;
      First;
      Label5.Caption:=Format('Всего кол-во %8.3f',[FieldByName('S_NUMB').AsFloat]);
     end;
   }
end;

procedure TF_ImportTo_Uch_Doc.DBGrid4CellClick(Column: TColumn);
begin
CarentColumn:=Column;
end;

procedure TF_ImportTo_Uch_Doc.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

if ((Column.FieldName ='NAME_TOV_SOURCE') and
 (( Q_IMPORT_NAKLTOV_TMP.FieldByName('ID_TOV_DEST').AsInteger=0) or
 ( Q_IMPORT_NAKLTOV_TMP.FieldByName('ID_TOV_DEST').AsInteger=-1)) or
 (abs(Q_IMPORT_NAKLTOV_TMP.FieldByName('PRICE').AsFloat-
      Q_IMPORT_NAKLTOV_TMP.FieldByName('PRICE1').AsFloat)>Eps) or
  (Trim(Q_IMPORT_NAKLTOV_TMP.FieldByName('NAME_TOV_DEST').AsString)<>
   Trim(Q_IMPORT_NAKLTOV_TMP.FieldByName('NAME_TOV_SOURCE').AsString))
 )
then
  begin

   DBGrid4.Canvas.Font.Color := clRed;


  end;

  DBGrid4.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TF_ImportTo_Uch_Doc.DBGrid4EditButtonClick(Sender: TObject);
var id_edit:longint;

begin
  if CarentColumn.FieldName='NAME_TOV_DEST' then
  begin
    id_edit:=Q_IMPORT_NAKLTOV_TMP.FieldByName('ID').AsInteger;
    Clipboard.Clear;
    Clipboard.SetTextBuf(PChar(Q_IMPORT_NAKLTOV_TMP.FieldByName('NAME_TOV_SOURCE').AsString));
    if (FHost_Tov_listDLG(-1,Q_IMPORT_NAKLTOV_TMP.FieldByName('NAME_TOV_SOURCE').AsString,
     ID_Vendor, kateg_vendor, Vendor )=mrOk) then
     begin

        SP_ADD_HOOKUP_TOV.Parameters.ParamValues['@ID_TOV_SOURSE']:=
        Q_IMPORT_NAKLTOV_TMP.FieldByName('ID_TOV_SOURCE').AsInteger;
        SP_ADD_HOOKUP_TOV.Parameters.ParamValues['@ID_TOV_DEST']:=id_Host_Tov_Select;
        SP_ADD_HOOKUP_TOV.Parameters.ParamValues['@ID_CLI']:=ID_Vendor;
        SP_ADD_HOOKUP_TOV.ExecProc;
        if SP_ADD_HOOKUP_TOV.Parameters.ParamValues['@ER']<>0
        then
        begin
          MessageDlg('Ошибка при установке связей кодировок товаров', mtError, [mbOk], 0);
          exit;
        end;

        SP_EDIT_LIST_TOV_IMPORT.Parameters.ParamValues['@ID_USER']:=ID_user_select;
        SP_EDIT_LIST_TOV_IMPORT.Parameters.ParamValues['@ID_LIST_TOV']:=id_edit;
        SP_EDIT_LIST_TOV_IMPORT.Parameters.ParamValues['@ID_TOV_DEST']:= id_Host_Tov_Select;
        SP_EDIT_LIST_TOV_IMPORT.Parameters.ParamValues['@NAME_TOV_DEST']:= Host_Tov_Select;
        SP_EDIT_LIST_TOV_IMPORT.Parameters.ParamValues['@EDIZM_DEST']:= Host_Edizm_Select;
        SP_EDIT_LIST_TOV_IMPORT.Parameters.ParamValues['@ID_GRTOV_DEST']:= id_Host_GrTov_Select;
        SP_EDIT_LIST_TOV_IMPORT.Parameters.ParamValues['@GRTOV_DEST']:= Host_GrTov_Select;
        SP_EDIT_LIST_TOV_IMPORT.ExecProc;
        if SP_EDIT_LIST_TOV_IMPORT.Parameters.ParamValues['@ER']<>0  then
        begin
          MessageDlg('Ошибка при указании товара-назначения!', mtError, [mbOk], 0);
        end
        else
        begin
          ReopenQ(id_edit);

        end;


      end;
   end;

end;

procedure TF_ImportTo_Uch_Doc.DTP_NAKLChange(Sender: TObject);
begin
  D:= DTP_NAKL.DateTime;
end;

procedure TF_ImportTo_Uch_Doc.E_NNChange(Sender: TObject);
begin
  NN:= E_NN.Text;
end;

procedure TF_ImportTo_Uch_Doc.FormCreate(Sender: TObject);
begin
 ID_NC_NEW:=-1;
end;

procedure TF_ImportTo_Uch_Doc.FormShow(Sender: TObject);

begin
  ReadColumnPosFromIni(DbGrid4, 'import_f');

end;

end.
