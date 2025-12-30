unit SendMail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ComCtrls,
  IdSMTP, IdMessage, IdSSLOpenSSL, IdAttachmentFile, IdExplicitTLSClientServerBase,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTPBase, IdBaseComponent,
  IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  System.UITypes, Data.DB;
  //  IdAntiFreezeBase, Vcl.IdAntiFreeze;

type
  TFSendMail = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    E_Title: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    M_Content: TMemo;
    E_File_Attach: TEdit;
    Label3: TLabel;
    BBAttachFile: TBitBtn;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    Label4: TLabel;
    E_Sender: TEdit;
    Label5: TLabel;
    E_Recipient: TEdit;
    E_mail_Sender: TEdit;
    E_mail_Recipient: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    CB_Edit: TCheckBox;
    OpenDialog1: TOpenDialog;
    BBSendMail: TBitBtn;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    BitBtn1: TBitBtn;
    procedure CB_EditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BBAttachFileClick(Sender: TObject);
    procedure BBSendMailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_NAKLCAP:longint;
    IS_Auto_send:boolean;
    procedure ReOpenQ;
    procedure Prep_for_show;
  end;

var
  FSendMail: TFSendMail;
  function FSendMailDlg(vID_NAKLCAP:longint; vIS_Auto_send:boolean):integer;

implementation

{$R *.dfm}
uses dm_orders, ORDER_REP, Orders_f, myfuncs;


function FSendMailDlg(vID_NAKLCAP:longint; vIS_Auto_send:boolean):integer;
begin
 FSendMail:=TFSendMail.Create(Application);
 with FSendMail do
 begin
  try
    ID_NAKLCAP:=vID_NAKLCAP;
    IS_Auto_send:=vIS_Auto_send;
    if IS_Auto_send then
    begin
      Prep_for_show;
      BBSendMailClick(FSendMail);
      Close;
    end
    else
    result:=ShowModal;
  finally
   Free;
   FSendMail:=Nil;
  end;
 end;
end;

procedure TFSendMail.BBAttachFileClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    E_File_Attach.ReadOnly:=False;
    E_File_Attach.Text:=OpenDialog1.FileName;
    E_File_Attach.ReadOnly:=True;
  end;


end;

procedure TFSendMail.BBSendMailClick(Sender: TObject);
var i:integer;
// s_content:string;
var Save_Cursor:TCursor;
begin

try
  Save_Cursor:=Screen.Cursor;
  Screen.Cursor := crSQLWait;
{формируем тело сообщения}
  IdMessage1 := TIdMessage.Create;
  IdMessage1.From.Address := 'sale@novmk.com';

//  IdMessage1.From.Address := 'ifinnmk@gmail.com';
// IdMessage1.From.Address := 'vt051056@gmail.com';
 // IdMessage1.Recipients.EMailAddresses :='ukr.nmk@gmail.com';
  IdMessage1.Recipients.EMailAddresses :=E_mail_Recipient.Text;
  IdMessage1.CharSet := 'UTF-8';

  IdMessage1.IsEncoded  := true;
  IdMessage1.Encoding  := meDefault;


 // IdMessage1.Subject := UTF8Encode(E_Title.Text);
  IdMessage1.Subject := AnsiToUtf8(E_Title.Text);



  for i := 0 to M_Content.Lines.Count-1 do
  begin
   IdMessage1.Body.Add(AnsiToUtf8(M_Content.Lines[i]));
  end;

  IdMessage1.Date:= now;


  TIdAttachmentfile.Create(IdMessage1.MessageParts,E_File_Attach.Text);

  {настройка компонентов перед отправкой}
  IdSMTP1:= TIdSMTP.Create(nil);

  IdSMTP1.Host:='mail.adm.tools';
  IdSMTP1.Port:=465; // обычно при использование ssl 495, 587 или стандартный 25
  IdSMTP1.Username:='sale@novmk.com';
  IdSMTP1.Password:='DxMd25PC76tf';

  {
  IdSMTP1.Host:='imap-2.1gb.ua';
  IdSMTP1.Port:=465; // обычно при использование ssl 495, 587 или стандартный 25
  IdSMTP1.Username:='u40915';
  IdSMTP1.Password:='938a154c';
  }
  {
  IdSMTP1.Host:='smtp.gmail.com';
  IdSMTP1.Port:=465; // обычно при использование ssl 495, 587 или стандартный 25
 IdSMTP1.Username:='ifinnmk@gmail.com';
  IdSMTP1.Password:='Vorra2018';
 //IdSMTP1.Username:='vt051056@gmail.com';
 // IdSMTP1.Password:='05vt1056';
   }
  IdSMTP1.AuthType:=satDefault;

{это необходимо использовать для SSL}
  IdSSLIOHandlerSocketOpenSSL1 := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdSSLIOHandlerSocketOpenSSL1.Destination := IdSMTP1.Host+':'+IntToStr(IdSMTP1.Port);
  IdSSLIOHandlerSocketOpenSSL1.Host := IdSMTP1.Host;
  IdSSLIOHandlerSocketOpenSSL1.Port := IdSMTP1.Port;
  IdSSLIOHandlerSocketOpenSSL1.DefaultPort := 0;
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method := sslvTLSv1;
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Mode := sslmUnassigned;

  IdSMTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
 // IdSMTP1.UseTLS := utUseExplicitTLS;
  IdSMTP1.UseTLS := utUseImplicitTLS;


{отправляем письмо}
  IdSMTP1.Connect();

except
  if not IS_Auto_send then
  MessageBox(handle,pchar('ОШИБКА!!! Подключение к SMTP серверу не удалось'+#10+#13+
  'Проверьте настройки программы, а так же не блокируется ли'+#10#13+
  'порт SMTP сервера антивирусом или файреволом(брандмауэром)'), pchar('Ошибка отправки почты'), MB_OK);
   Screen.Cursor := Save_Cursor;
  exit;
end;

IdSMTP1.Send(IdMessage1);
//Application.ProcessMessages;
IdSMTP1.Disconnect;
//на событие OnClose вешаем следующее:
//{очищаем память}
idMessage1.Free;
IdSSLIOHandlerSocketOpenSSL1.Free;
idSMTP1.Free;
 Screen.Cursor := Save_Cursor;
 if not IS_Auto_send then
  MessageDlg('Письмо отправлено!', mtInformation, [mbOk], 0);
 // отметка об отправке заказа по почте
 //DM1.ADS_OrdersNALOG_NAKL.ReadOnly:=False;
 DM1.ADS_Orders.Edit;
 DM1.ADS_Orders.FieldByName('NALOG_NAKL').AsInteger :=1;
 DM1.ADS_Orders.Post;
 //DM1.ADS_OrdersNALOG_NAKL.ReadOnly:=True;
 Inc(FOrders.N_mail_Sended);
// FOrders.BBRefreshClick(Sender);
 // Close;
  DeleteFile(E_File_Attach.Text); // надо проверить!!!!!!

end;

procedure TFSendMail.CB_EditClick(Sender: TObject);
begin
  E_mail_Recipient.ReadOnly:=not CB_Edit.Checked;
  E_Title.ReadOnly:=not CB_Edit.Checked;
  M_Content.ReadOnly:=not CB_Edit.Checked;
  BBAttachFile.Enabled:=CB_Edit.Checked;


end;

procedure TFSendMail.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  DM1.QOrder_Cap.Close;
  DM1.QOrder_Tov.Close;
end;

procedure TFSendMail.FormCreate(Sender: TObject);
begin
  E_Sender.ReadOnly:=True;
  E_mail_Sender.ReadOnly:=True;
  E_Recipient.ReadOnly:=True;
  E_mail_Recipient.ReadOnly:=True;
  E_Title.ReadOnly:=True;
  M_Content.ReadOnly:=True;
  E_File_Attach.ReadOnly:=True;
  BBAttachFile.Enabled:=False;

end;


procedure TFSendMail.Prep_for_show;
var v_ID_DOC_TYPE :longint;
var name_doc_print,text_message, text_message1, text_message2:string;
begin
  ReOpenQ;

  name_doc_print:=Unknown_str;
  text_message1:='';
  text_message2:='';
  text_message:='';
  v_ID_DOC_TYPE:=DM1.QOrder_Cap.FieldByName('ID_DOC_TYPE').AsInteger;

  if v_ID_DOC_TYPE=сID_DOC_TYPE_Zakaz_TNP then
    begin
      E_Sender.ReadOnly:=False;
      E_Sender.Text:=DM1.QOrder_Cap.FieldByName('CLI_D').AsString;
      E_Sender.ReadOnly:=True;
      E_mail_Sender.ReadOnly:=False;
    //  E_mail_Sender.Text:='ifinnmk@gmail.com';//   DM1.QOrder_Cap.FieldByName('EMAIL_D').AsString;
      E_mail_Sender.Text:='sale@novmk.com';
      E_mail_Sender.ReadOnly:=True;

      E_Recipient.ReadOnly:=False;
      E_Recipient.Text:=DM1.QOrder_Cap.FieldByName('CLI_K').AsString;
      E_Recipient.ReadOnly:=True;
      E_mail_Recipient.ReadOnly:=False;
      E_mail_Recipient.Text:=DM1.QOrder_Cap.FieldByName('EMAIL_K').AsString;
      E_mail_Recipient.ReadOnly:=True;
      name_doc_print:='Заказ';
      text_message:= Format('Примите %s №%s от торговой точки %s',
        [name_doc_print,
          DM1.QOrder_Cap.FieldByName('NN').AsString,
          DM1.QOrder_Cap.FieldByName('CLI_D').AsString]);
      text_message1:=Format('Доставку осуществляйте по адресу %s',
    [DM1.QOrder_Cap.FieldByName('ADRES_D').AsString]);
      text_message2:=Format('Пожалуйста, копию накладной отправьте в день отгрузки на e-mail %s',
    [E_mail_Sender.Text]);

    end;

    if v_ID_DOC_TYPE=сID_DOC_TYPE_Prihod_TNP_Nakl then
     begin
      E_Sender.ReadOnly:=False;
      E_Sender.Text:=DM1.QOrder_Cap.FieldByName('CLI_D').AsString;
      E_Sender.ReadOnly:=True;
      E_mail_Sender.ReadOnly:=False;
     // E_mail_Sender.Text:='ifinnmk@gmail.com';
      E_mail_Sender.Text:='sale@novmk.com';
      E_mail_Sender.ReadOnly:=True;

     // приходная накладная не отправляется поставщику (оставил на всякий случай)
      E_Recipient.ReadOnly:=False;
      E_Recipient.Text:=DM1.QOrder_Cap.FieldByName('CLI_K').AsString;
      E_Recipient.ReadOnly:=True;
      E_mail_Recipient.ReadOnly:=False;
      E_mail_Recipient.Text:=DM1.QOrder_Cap.FieldByName('EMAIL_K').AsString;
      E_mail_Recipient.ReadOnly:=True;
      name_doc_print:='Приходная накладная';
      text_message:= Format('Примите %s №%s от торговой точки %s',
        [name_doc_print,
          DM1.QOrder_Cap.FieldByName('NN').AsString,
          DM1.QOrder_Cap.FieldByName('CLI_D').AsString]);


      text_message1:=Format('Доставку осуществляйте по адресу %s',
    [DM1.QOrder_Cap.FieldByName('ADRES_D').AsString]);
      text_message2:=Format('Пожалуйста, копию накладной отправьте в день отгрузки на e-mail %s',
    [E_mail_Sender.Text]);
     end;

     if (v_ID_DOC_TYPE=сID_DOC_TYPE_Vozvrat_TNP)
      or (v_ID_DOC_TYPE=сID_DOC_TYPE_Zakaz_Vozvrat_TNP) then
     begin

      E_Sender.ReadOnly:=False;
      E_Sender.Text:=DM1.QOrder_Cap.FieldByName('CLI_K').AsString;
      E_Sender.ReadOnly:=True;
      E_mail_Sender.ReadOnly:=False;
    //  E_mail_Sender.Text:='ifinnmk@gmail.com';
      E_mail_Sender.Text:='sale@novmk.com';
      E_mail_Sender.ReadOnly:=True;

      E_Recipient.ReadOnly:=False;
      E_Recipient.Text:=DM1.QOrder_Cap.FieldByName('CLI_D').AsString;
      E_Recipient.ReadOnly:=True;
      E_mail_Recipient.ReadOnly:=False;
      E_mail_Recipient.Text:=DM1.QOrder_Cap.FieldByName('EMAIL_D').AsString;
      E_mail_Recipient.ReadOnly:=True;
      name_doc_print:='Возвратную накладную';

       text_message:= Format('Примите %s №%s от торговой точки %s',
        [name_doc_print,
          DM1.QOrder_Cap.FieldByName('NN').AsString,
          DM1.QOrder_Cap.FieldByName('CLI_K').AsString]);
      text_message1:=Format('Возврат с адреса %s',
        [DM1.QOrder_Cap.FieldByName('ADRES_K').AsString]);
      text_message2:=Format('Пожалуйста, сообщите о получении возврата на e-mail %s',
        [E_mail_Sender.Text]);
     end;


     if v_ID_DOC_TYPE=сID_DOC_TYPE_Rashod_Kolbas_realiz then    // 02 Расход продукции покупателю
     begin

      E_Sender.ReadOnly:=False;
      E_Sender.Text:=DM1.QOrder_Cap.FieldByName('CLI_K').AsString;
      E_Sender.ReadOnly:=True;
      E_mail_Sender.ReadOnly:=False;
    //  E_mail_Sender.Text:='ifinnmk@gmail.com';
      E_mail_Sender.Text:='sale@novmk.com';
      E_mail_Sender.ReadOnly:=True;

      E_Recipient.ReadOnly:=False;
      E_Recipient.Text:=DM1.QOrder_Cap.FieldByName('CLI_D').AsString;
      E_Recipient.ReadOnly:=True;
      E_mail_Recipient.ReadOnly:=False;
      E_mail_Recipient.Text:=DM1.QOrder_Cap.FieldByName('EMAIL_D').AsString;
      E_mail_Recipient.ReadOnly:=True;
      name_doc_print:='Расходную накладную';

       text_message:= Format('Примите %s №%s от  %s',
        [name_doc_print,
          DM1.QOrder_Cap.FieldByName('NN').AsString,
          DM1.QOrder_Cap.FieldByName('CLI_K').AsString]);
      text_message1:='';
      text_message2:='';
     end;



  E_Title.ReadOnly:=False;
  E_Title.Text:=Format('%s N %s от %s %s', [name_doc_print,
              DM1.QOrder_Cap.FieldByName('NN').AsString,
              DateToStr(DM1.QOrder_Cap.FieldByName('D').AsFloat),
              DM1.QOrder_Cap.FieldByName('CLI_D').AsString]);
  E_Title.ReadOnly:=True;

  M_Content.ReadOnly:=False;
  M_Content.Clear;
  M_Content.Lines.Add('Здравствуйте!');
  M_Content.Lines.Add(text_message);

  M_Content.Lines.Add(text_message1);
  M_Content.Lines.Add(text_message2);
  M_Content.ReadOnly:=True;

  E_File_Attach.ReadOnly:=True;
  E_File_Attach.Text:= OrderFieldName;
  E_File_Attach.ReadOnly:=True;

end;



procedure TFSendMail.FormShow(Sender: TObject);
begin
  Prep_for_show;
   // активировать приложение после автоматического закрытия Excel
  SetForeGroundWindow(FSendMail.Handle);

end;


procedure TFSendMail.ReOpenQ;
begin
 with DM1.QOrder_Cap do
 begin
  DisableControls;
  Close;
  Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
  Open;
  EnableControls;
 end; // with DM1.QOrder_Cap do

 with DM1.QOrder_Tov do
 begin
  DisableControls;
  Close;
  Parameters.ParamByName('ID_NAKLCAP').Value:=ID_NAKLCAP;
  Open;
  EnableControls;
 end; // with DM1.QOrder_Tov do

end;

end.
