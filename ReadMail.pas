unit ReadMail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, IdMessage,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdPOP3, idMessageParts, IdAttachmentFile,
  MSHTML, shdocvw, Vcl.OleCtrls, IdText, IdAttachment, IdIMAP4, Vcl.Grids,
  Data.DB, Data.Win.ADODB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.DBGrids, ComObj, IniFiles,
  Vcl.ComCtrls;

type
  TFReadMail = class(TForm)
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdMessage1: TIdMessage;
    IdIMAP41: TIdIMAP4;
    ADS_INBOX: TADODataSet;
    DS_INBOX: TDataSource;
    ADOC_CreateInBox: TADOCommand;
    ADOC_DropInBox: TADOCommand;
    ADOC_Create_Attach_files: TADOCommand;
    ADOC_Drop_Attach_Files: TADOCommand;
    ADS_Attach_Files: TADODataSet;
    DS_Attach_Files: TDataSource;
    ADOC_Delete_Attach_Files: TADOCommand;
    ADOC_DeleteInBox: TADOCommand;
    Panel5: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    BBSetting: TBitBtn;
    BB_Read_message: TBitBtn;
    BB_ReadInBox: TBitBtn;
    E_max_send: TEdit;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    BB_OpenAttach_file: TBitBtn;
    DBNavigator2: TDBNavigator;
    Panel6: TPanel;
    WebBrowser1: TWebBrowser;
    BBImportTo_Uch_Doc: TBitBtn;
    BitBtn1: TBitBtn;
    DTP_From_Mail: TDateTimePicker;
    DTP_To_Mail: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    E_Dep_Days: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Q_Mail_Firm_List: TADOQuery;
    BB_Remove_mess_To_Arhive: TBitBtn;
    CB_IncludArhive: TCheckBox;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BB_ReadInBoxClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBSettingClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BB_Read_messageClick(Sender: TObject);
    procedure BB_OpenAttach_fileClick(Sender: TObject);
    procedure ADS_INBOXAfterScroll(DataSet: TDataSet);
    procedure E_max_sendExit(Sender: TObject);
    procedure BBImportTo_Uch_DocClick(Sender: TObject);
    procedure ADS_Attach_FilesAfterScroll(DataSet: TDataSet);
    procedure E_Dep_DaysExit(Sender: TObject);
    procedure DTP_From_MailChange(Sender: TObject);
    procedure DBGrid2DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BB_Remove_mess_To_ArhiveClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }

//    EMailRead:string;
    ID_CLI:  longint; // поставщик
    ID_PARENT :  longint; // поставщик
    CLI:string;
    ID_NAKLCAP:  longint;
    max_send, dep_days:integer;
    IniFile:TIniFile;
    CarentFieldSeach:string;
    procedure AppendToWB(WB: TWebBrowser; const html: widestring);
    procedure Read_message;
    function ExistFirmMailAdres(Email:string):boolean;
  end;

var
  FReadMail: TFReadMail;

  function FReadMailDlg(vID_CLI:longint; vCli:string; vID_NAKLCAP:longint):integer;

implementation

{$R *.dfm}

uses dm_orders, myfuncs, doctypeView, Orders_f, ImportTo_Uch_Doc, CLIENT_F1, DateUtils;


function FReadMailDlg(vID_CLI:longint; vCli:string; vID_NAKLCAP:longint):integer;
begin
 FReadMail:=TFReadMail.Create(Application);
 with FReadMail do
 begin
  try
   // EMailRead:=vEMailRead;
    ID_CLI:=vID_CLI;
    CLI:=vCli;
    ID_NAKLCAP:=vID_NAKLCAP;
    result:=ShowModal;
  finally
   Free;
   FReadMail:=Nil;
  end;
 end;
end;
 {
procedure TFReadMail.SetupSSL;
begin
  if chkUseSSL.Checked then  //если включена опция использовать SSL
  begin
    IdPOP31.IOHandler := IdSSLIOHandlerSocketOpenSSL1; //устанавливаем SSL Handler для IdPOP3
    IdPOP31.UseTLS := utUseImplicitTLS;  //использовать неявный TSL
    //Устанавливаем тип SSL
    case cbSSLType.ItemIndex of
      0: IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method := sslvTLSv1;
      1: IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method := sslvSSLv2;
      2: IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method := sslvSSLv23;
      3: IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method := sslvSSLv3;

    else
      raise Exception.Create('Выберите тип SSL');
    end;
  end
  else
  begin
    IdPOP31.IOHandler := nil; //если не используем SSL - устанавливаем все по умолчанию
    IdPOP31.UseTLS := utNoTLSSupport;
  end;
end;
 }


procedure TFReadMail.BBImportTo_Uch_DocClick(Sender: TObject);
var ID_NC_NEW:longint;
ID_CLI_K:longint;

begin
if  ADS_Attach_Files.Active and (ADS_Attach_Files.RecordCount>0) then
begin
// получить ID, и наименование кредитора по его E_mail адресу
{
 with DM1.Q_Get_ID_CLI_For_Email do
 begin
    Close;
    Parameters.ParamByName('EMAIL').Value:=ADS_INBOX.FieldByName('Адрес').AsString;
    open;
    if RecordCount=0 then  ID_CLI_K:=-1
    else
    begin
      First;
      ID_CLI_K:=FieldByName('ID_CLIENTS').AsInteger;
    end;
   Close;
 end;
}
ID_CLI_K:=ADS_INBOX.FieldByName('ID_PARENT').AsInteger;
if F_clientDlg_1(-1,'', ID_CLI_K)=mrOk then
  begin
    if F_ImportTo_Uch_Doc_Dlg(сID_DOC_TYPE_Prihod_TNP_Nakl,    // 164 10_1 Приход ТНП на торговую сеть
    ADS_Attach_Files.FieldByName('Полное_имя').AsString,
    ID_client_select_1, client_select_1, kateg_cli_select_1, ID_NC_NEW)=mrOk then
    begin
      if ID_client_select_1=DM1.ADS_Orders.FieldByName('ID_CLI_K').AsInteger then
      begin
         // отметка об получении накладной по заказу по почте
        DM1.ADS_Orders.Edit;
        DM1.ADS_Orders.FieldByName('NALOG_NAKL').AsInteger :=2;
        DM1.ADS_Orders.Post;
        Inc(FOrders.N_mail_Sended);
      end;
    // DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger)
    end;
   end;
end;
end;

procedure TFReadMail.BBSettingClick(Sender: TObject);
begin
     // сохранить настройки колонок DbGrid1 в секцию  'nakllist_f'  Ini файла
  SaveColumnPosToIni(DbGrid1, 'ReadMail');
  SaveColumnPosToIni(DbGrid2, 'ReadMail_Attach');
  IniFile:=TIniFile.Create(GetSpecialPath(CSIDL_COMMON_APPDATA)+'\'+
   ChangeFileExt(ExtractFileName(Application.ExeName), '.ini'));
  with IniFile do
  begin
     Writeinteger('ReadMail','max_send',max_send);
     Writeinteger('ReadMail','dep_days',dep_days);
  end;
end;

procedure TFReadMail.BB_OpenAttach_fileClick(Sender: TObject);
 Var Ap : Variant;
begin
if  ADS_Attach_Files.Active and (ADS_Attach_Files.RecordCount>0) then
begin
  Ap := CreateOleObject('Excel.Application');
  Ap.Workbooks.Open(ADS_Attach_Files.FieldByName('Полное_имя').AsString);
  Ap.Visible := True;
end;

end;

function TFReadMail.ExistFirmMailAdres(Email:string):boolean;
begin
  result:=False;
  with Q_Mail_Firm_List do
  begin
    Close;
    Parameters.ParamByName('ID_PARENT').Value:=ID_CLI;
    Open;
    First;
    while not EOF do
    begin
      if Trim(FieldByName('EMAIL').AsString)=Trim(Email) then
      begin
        result:=True;
        Break;
      end;

      Next;
    end;   // while not EOF do
    Close;
  end;
end;


procedure TFReadMail.BB_ReadInBoxClick(Sender: TObject);
var
  MsgCnt, i, j, k, count_cli,
 // PartIndex,
  n_send: integer;
  msg: TIdMessage;
  FolderMail_list:TStringList;
  s_box:string;
  SearchInfo: array of TIdIMAP4SearchRec;

  var Save_Cursor:TCursor;
begin
  Save_Cursor:=Screen.Cursor;
  Screen.Cursor := crSQLWait;

  ADS_INBOX.Close;
  ADOC_DeleteInBox.Execute;
  ADS_INBOX.Open;
  ReadColumnPosFromIni(DbGrid1, 'ReadMail');

try
 {
  IdIMAP41.Host:='imap.gmail.com';
  IdIMAP41.Username:='ifinnmk@gmail.com';
  IdIMAP41.Password:='Vorra2018';
  IdIMAP41.Port:=993;
  }
  {
  IdIMAP41.Host:='imap-2.1gb.ua';
  IdIMAP41.Username:='u40915';
  IdIMAP41.Password:='938a154c';
  IdIMAP41.Port:=993;
 }

  IdIMAP41.Host:='mail.adm.tools';
  IdIMAP41.Username:='sale@novmk.com';
  IdIMAP41.Password:='DxMd25PC76tf';
  IdIMAP41.Port:=993;

  msg := TIdMessage.Create(nil);
  msg.CharSet := 'windows-1251';
  msg.ContentType := 'text/plain; charset="windows-1251"';
  IdIMAP41.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(IdIMAP41);
  IdIMAP41.UseTLS := utUseImplicitTLS;
  IdIMAP41.Connect;

  FolderMail_list:=TStringList.Create;    // список входящих папок
  IdIMAP41.ListMailBoxes(FolderMail_list);
  Label8.Caption:='';
 with Q_Mail_Firm_List do  // email адреса  ID_CLI контрагента
  begin
    Close;
    Parameters.ParamByName('ID_PARENT').Value:=ID_CLI;
    Open;
    count_cli:=RecordCount;
    First;
    k:=1;
    while not EOF do
    begin
      ID_PARENT:=FieldByName('ID_PARENT').AsInteger;
      FOrders.StatusBar1.Panels[0].Text:=
      Format('%s - %d из %d',[FieldByName('CLI').AsString, k, count_cli]) ;
      Label8.Caption:=FOrders.StatusBar1.Panels[0].Text;
      FOrders.StatusBar1.Invalidate;
      Label8.Invalidate;
      Inc(k);
      SetLength(SearchInfo, 2);                // условия поиска
      SearchInfo[0].SearchKey := skFrom;
      SearchInfo[0].Text:=Trim(FieldByName('EMAIL').AsString);

      SearchInfo[1].SearchKey :=skSince;
      SearchInfo[1].Date:=DTP_From_Mail.Date;


      for j := 0 to FolderMail_list.Count-1 do
      begin
        s_box:= FolderMail_list.Strings[j];
        // просмотр всех папок, кроме Обработанные
        if not CB_IncludArhive.Checked then if Trim(s_box)=c_FOLDER_ARHIVE then
        begin
          Continue;
        end;

        IdIMAP41.SelectMailBox(s_box);

        IdIMAP41.UIDSearchMailBox(SearchInfo);

        for i := 0 to High(IdIMAP41.MailBox.SearchResult) do
        begin
            if IdIMAP41.UIDRetrieveHeader(IntToStr(IdIMAP41.MailBox.SearchResult[i]), msg) then
            begin
                ADS_INBOX.Append;
                ADS_INBOX.FieldByName('UID_MESSAGE').AsString:=IntToStr(IdIMAP41.MailBox.SearchResult[i]);// msg.UID;
                ADS_INBOX.FieldByName('Адрес').AsString:=msg.From.Address;
                ADS_INBOX.FieldByName('От_кого').AsString:=msg.From.Name;
                ADS_INBOX.FieldByName('Тема').AsString:=msg.Subject;
                ADS_INBOX.FieldByName('Дата').AsFloat:=msg.Date;
                ADS_INBOX.FieldByName('Папка').AsString:=s_box;
                ADS_INBOX.FieldByName('ID_PARENT').AsInteger:=ID_PARENT;
                ADS_INBOX.Post

            end;

        end;

      end;   //    for j := 0 to FolderMail_list.Count-1 do


      Next;
    end;   // while not EOF do
    Close;
  end;  // with Q_Mail_Firm_List do




  ADS_INBOX.First;
  IdIMAP41.Disconnect;
  IdIMAP41.IOHandler.Free;
  msg.free;
  FolderMail_list.Free;
except
  on e: Exception do ShowMessage('Ошибка соединения с почтовым сервером!');
end;
 Screen.Cursor := Save_Cursor;
 Label8.Caption:='';
end;




procedure TFReadMail.Read_message;
var
//  MsgCnt, i,
  n_attach_files : integer;
  msg: TIdMessage;
  messtext1,messtext2:string;
  ttype,
 // atype,
  aname, AttachPath:string;
  n:integer;
  attach:TIdAttachment;
 var Save_Cursor:TCursor;
begin
Save_Cursor:=Screen.Cursor;
Screen.Cursor := crSQLWait;
try
  {
  IdIMAP41.Host:='imap.gmail.com';
  IdIMAP41.Username:='ifinnmk@gmail.com';
  IdIMAP41.Password:='Vorra2018';
  IdIMAP41.Port:=993;

  IdIMAP41.Host:='imap-2.1gb.ua';
  IdIMAP41.Username:='u40915';
  IdIMAP41.Password:='938a154c';
  IdIMAP41.Port:=993;
   }
    IdIMAP41.Host:='mail.adm.tools';
  IdIMAP41.Username:='sale@novmk.com';
  IdIMAP41.Password:='DxMd25PC76tf';
  IdIMAP41.Port:=993;

  msg := TIdMessage.Create(nil);
  msg.CharSet := 'windows-1251';
  msg.ContentType := 'text/plain; charset="windows-1251"';
  IdIMAP41.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(IdIMAP41);
  IdIMAP41.UseTLS := utUseImplicitTLS;
  IdIMAP41.Connect;

  IdIMAP41.SelectMailBox(ADS_INBOX.FieldByName('Папка').AsString);

  IdIMAP41.UIDRetrieve(ADS_INBOX.FieldByName('UID_MESSAGE').AsString, msg);

  messtext1:=msg.Body.Text;
 // if (messtext1='') or (AnsiPos('multi-part message in MIME format',messtext1)>0) then
 //           messtext1:='';
  if (msg.ContentType='text/html') or (msg.ContentType='text/plain') then
  begin
    AppendToWB(WebBrowser1,messtext1);
  end;
  messtext1:='';
  n_attach_files:=0;
  for n:=0 to msg.MessageParts.Count-1 do
  begin
    ttype:=msg.MessageParts[n].ClassName;
    if (ttype='TIdText') and not (ttype=NULL) then
    begin
      messtext2:=TIdText(msg.MessageParts.Items[n]).Body.Text;
    end;  //  if (ttype='TIdText') and not (ttype=NULL) then

    if msg.MessageParts[n].PartType = mptAttachment then
    begin
    //Создаем папку формат .\Attach\2013.04.09\UID сообщения
    //Сохранение файла
      AttachPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))+'Attach');
      ForceDirectories(AttachPath);
      aname:=msg.MessageParts.Items[n].FileName;
      if aname='' then aname:='unknown_file';
      attach:=TIdAttachment(msg .MessageParts.Items[n]);
      if FileExists(AttachPath +  aname ) then
      begin
        try
          DeleteFile(AttachPath +  aname );
        except
           MessageDlg('Не удается заменить файл '+AttachPath +  aname, mtError, [mbOk], 0);
        end;
      end;
      attach.SaveToFile(AttachPath +  aname);

      with ADS_Attach_Files do
      begin
        Append;
        FieldByName('UID').AsString:=ADS_INBOX.FieldByName('UID_MESSAGE').AsString;
        FieldByName('Путь').AsString:=AttachPath;
        FieldByName('Файл').AsString:=aname;
        FieldByName('Полное_имя').AsString:=AttachPath +  aname;
        FieldByName('Импорт').AsInteger:=0;
        Post
      end; // with ADS_Attach_Files do

      Inc(n_attach_files);
      messtext1:=  messtext1+': '+aname
    end;
  end;  // for n:=0 to msg.MessageParts.Count-1 do
  if n_attach_files>0 then
    messtext1:=Format('<br /><p>В письме %d прикрепленных файлов: ',[n_attach_files])+messtext1+'</p>';
  AppendToWB(WebBrowser1,messtext2);
  AppendToWB(WebBrowser1,messtext1);
  IdIMAP41.Disconnect;
  IdIMAP41.IOHandler.Free;
  msg.free;
except
  on e: Exception do ShowMessage('Ошибка соединения с почтовым сервером!');
end;

 Screen.Cursor := Save_Cursor;

end;


procedure TFReadMail.BB_Read_messageClick(Sender: TObject);
begin
  WebBrowser1.Navigate('about:blank');
  while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do
    Application.ProcessMessages;
  ADS_Attach_Files.Close;
  ADOC_Delete_Attach_Files.Execute;
  ADS_Attach_Files.Open;

  ReadColumnPosFromIni(DbGrid2, 'ReadMail_Attach');
  Read_message;
  ADS_Attach_Files.First;
//  BB_OpenAttach_file.Enabled:= (ADS_Attach_Files.Active and (ADS_Attach_Files.RecordCount>0));
 // BBImportTo_Uch_Doc.Enabled:=BB_OpenAttach_file.Enabled;
end;





procedure TFReadMail.BB_Remove_mess_To_ArhiveClick(Sender: TObject);
// перемещение письма в папку "Обработанные" обработанных (архив)
 var
  msg: TIdMessage;
  Save_Cursor:TCursor;
  pred_ID, next_ID,carrent_ID:longint;
  is_ok:integer;
begin
  Save_Cursor:=Screen.Cursor;
  Screen.Cursor := crSQLWait;
  with ADS_INBOX do
  begin
    Disablecontrols;
    carrent_ID:=FieldByName('ID').AsInteger;
    prior;
    pred_ID:=FieldByName('ID').AsInteger;
    if carrent_ID=pred_ID then Next
    else begin Next; Next; end;
    next_ID:=FieldByName('ID').AsInteger;

    ADS_INBOX.Locate('ID', carrent_ID, [loCaseInsensitive]);
    Enablecontrols;
  end;

is_ok:=1;
try


  IdIMAP41.Host:='mail.adm.tools';
  IdIMAP41.Username:='sale@novmk.com';
  IdIMAP41.Password:='DxMd25PC76tf';
  IdIMAP41.Port:=993;

  msg := TIdMessage.Create(nil);
  msg.CharSet := 'windows-1251';
  msg.ContentType := 'text/plain; charset="windows-1251"';
  IdIMAP41.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(IdIMAP41);
  IdIMAP41.UseTLS := utUseImplicitTLS;
  IdIMAP41.Connect;

  IdIMAP41.SelectMailBox(ADS_INBOX.FieldByName('Папка').AsString);

  IdIMAP41.UIDCopyMsg(ADS_INBOX.FieldByName('UID_MESSAGE').AsString,c_FOLDER_ARHIVE);
  IdIMAP41.UIDDeleteMsg(ADS_INBOX.FieldByName('UID_MESSAGE').AsString);

  // Перепаковать выбраный ящик
  IdIMAP41.ExpungeMailBox();

  IdIMAP41.SelectMailBox(c_FOLDER_ARHIVE);
  IdIMAP41.ExpungeMailBox();

  IdIMAP41.Disconnect;
  IdIMAP41.IOHandler.Free;
  msg.free;

except

  on e: Exception do
  begin
    is_ok:=0;
    ShowMessage('Ошибка соединения с почтовым сервером!');
  end;
end;

if is_ok=1 then
begin
      ADS_INBOX.Disablecontrols;
       ADS_INBOX.Locate('ID', carrent_ID, [loCaseInsensitive]);
       ADS_INBOX.Delete;
      if pred_ID=carrent_ID then
        ADS_INBOX.Locate('ID', next_ID, [loCaseInsensitive])
      else
      if next_ID=carrent_ID then
      ADS_INBOX.Locate('ID', pred_ID, [loCaseInsensitive])
      else ADS_INBOX.Locate('ID', pred_ID, [loCaseInsensitive]);

   ADS_INBOX.Enablecontrols;

end
else MessageDlg('Ошибка при перемещении письма в архив!', mtError,
      [mbOk], 0);

 Screen.Cursor := Save_Cursor;

end;

procedure TFReadMail.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TFReadMail.DBGrid1TitleClick(Column: TColumn);
begin
 CarentFieldSeach:=Column.FieldName;
 ADS_INBOX.IndexFieldNames:=CarentFieldSeach;
end;

procedure TFReadMail.DBGrid2DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin

  if (Field.FieldName='ID') or (Field.FieldName='Файл') then
  begin
    if DBGrid2.DataSource.DataSet.FieldByName('Импорт').AsInteger <>0 then
      DBGrid2.Canvas.Font.Color := clLime
    else DBGrid2.Canvas.Font.Color := clBlack;
  end;

  DBGrid2.DefaultDrawDataCell(Rect,field, State);
end;

procedure TFReadMail.DTP_From_MailChange(Sender: TObject);
begin
  dep_days:=DaysBetween(DTP_To_Mail.Date, DTP_From_Mail.Date);
  E_Dep_Days.Text:=IntToStr(dep_days);
end;

procedure TFReadMail.E_Dep_DaysExit(Sender: TObject);
begin
  dep_days:=StrToInt(E_Dep_Days.Text);
  DTP_To_Mail.Date:=Date();
  DTP_From_Mail.Date:=IncDay(DTP_To_Mail.Date, -1*dep_days);
end;

procedure TFReadMail.E_max_sendExit(Sender: TObject);
begin
 max_send:=StrToInt(E_max_send.Text);
end;

procedure TFReadMail.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  ADOC_DropInBox.Execute;
  ADOC_Drop_Attach_Files.Execute;
end;

procedure TFReadMail.FormCreate(Sender: TObject);
begin
  WebBrowser1.Navigate('about:blank');
  dep_days:=2;
  max_send:=2;
  ADOC_CreateInBox.Execute;
  ADOC_Create_Attach_files.Execute;
  ADS_INBOX.Open;
  ADS_Attach_Files.Open;
  BB_OpenAttach_file.Enabled:= (ADS_Attach_Files.Active and (ADS_Attach_Files.RecordCount>0));
  BBImportTo_Uch_Doc.Enabled:=BB_OpenAttach_file.Enabled;
  IniFile:=TIniFile.Create(GetSpecialPath(CSIDL_COMMON_APPDATA)+'\'+
   ChangeFileExt(ExtractFileName(Application.ExeName), '.ini'));
  with IniFile do
  begin
     max_send:=Readinteger('ReadMail','max_send',2);
     dep_days:=Readinteger('ReadMail','dep_days',2);
     E_max_send.Text:=IntToStr(max_send);
     E_Dep_Days.Text:=IntToStr(dep_days);
  end;
  DTP_To_Mail.Date:=Date();
  DTP_From_Mail.Date:=IncDay(DTP_To_Mail.Date, -1*dep_days);
  CB_IncludArhive.Checked:=False;
end;


procedure TFReadMail.FormShow(Sender: TObject);
begin
  ReadColumnPosFromIni(DbGrid1, 'ReadMail');
  ReadColumnPosFromIni(DbGrid2, 'ReadMail_Attach');
  if ID_CLI<>-1 then
   Label3.Caption:='От '+CLI
  else Label3.Caption:='От всех';
  Label1.Caption:='';
  BB_ReadInBoxClick(Sender);
end;

procedure TFReadMail.ADS_Attach_FilesAfterScroll(DataSet: TDataSet);
var ext:string;
begin
  ext:=AnsiLowerCase(Trim(ExtractFileExt(ADS_Attach_Files.FieldByName('Полное_имя').AsString)));
  BB_OpenAttach_file.Enabled:= ((ext='.xls') or (ext='.xlsx'));
  BBImportTo_Uch_Doc.Enabled:=BB_OpenAttach_file.Enabled;
end;

procedure TFReadMail.ADS_INBOXAfterScroll(DataSet: TDataSet);
begin
  WebBrowser1.Navigate('about:blank');
  while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do
    Application.ProcessMessages;
  ADS_Attach_Files.Close;
  ADOC_Delete_Attach_Files.Execute;
  BB_OpenAttach_file.Enabled:= (ADS_Attach_Files.Active and (ADS_Attach_Files.RecordCount>0));
  BBImportTo_Uch_Doc.Enabled:=BB_OpenAttach_file.Enabled;
end;

procedure TFReadMail.AppendToWB(WB: TWebBrowser; const html: widestring);
var
Range:IHTMLTxtRange;
begin
Range:=((WB.Document AS IHTMLDocument2).body AS IHTMLBodyElement).createTextRange;
Range.Collapse(False);
Range.PasteHTML(html);
end;

end.

