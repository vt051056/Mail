unit post_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdServerIOHandler, IdSSL,
  IdSSLOpenSSL, IdMessage, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdTCPServer, IdCmdTCPServer, IdExplicitTLSClientServerBase, IdSMTPServer,IdSMTP,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTPBase, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdAttachmentFile;

type
  TFPost = class(TForm)
    IdMessage1: TIdMessage;
    Button1: TButton;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdSMTP1: TIdSMTP;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPost: TFPost;

implementation

{$R *.dfm}

procedure TFPost.Button1Click(Sender: TObject);
begin
try
{формируем тело сообщения}
IdMessage1 := TIdMessage.Create;
IdMessage1.From.Address := 'vt051056@gmail.com';
IdMessage1.Recipients.EMailAddresses :='ukr.nmk@gmail.com';
IdMessage1.CharSet := 'UTF-8';
IdMessage1.Subject := UTF8Encode('Тестовое сообщение заголовок');
IdMessage1.Body.Text:=UTF8Encode('Тело сообщения');
IdMessage1.Date:= now;


TIdAttachmentfile.Create(IdMessage1.MessageParts,'Книга1.xls');

{настройка компонентов перед отправкой}
IdSMTP1:= TIdSMTP.Create(nil);

IdSMTP1.Host:='smtp.gmail.com';
IdSMTP1.Port:=465; // обычно при использование ssl 495, 587 или стандартный 25
IdSMTP1.Username:='vt051056@gmail.com';
IdSMTP1.Password:='05vt1056';
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
IdSMTP1.UseTLS := utUseExplicitTLS;

{отправляем письмо}
IdSMTP1.Connect();
except
MessageBox(handle,pchar('ОШИБКА!!! Подключение к SMTP серверу не удалось'+#10+#13+
'Проверьте настройки программы, а так же не блокируется ли'+#10#13+
'порт SMTP сервера антивирусом или файреволом(брандмауэром)'), pchar('111'), 48);
exit;
end;
IdSMTP1.Send(IdMessage1);
Application.ProcessMessages;
IdSMTP1.Disconnect;
//на событие OnClose вешаем следующее:
//{очищаем память}
idMessage1.Free;
IdSSLIOHandlerSocketOpenSSL1.Free;
idSMTP1.Free;
end;

end.
