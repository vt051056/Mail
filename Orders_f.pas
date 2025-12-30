unit Orders_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, DB, Data.Win.ADODB,
  System.UITypes;

type
  TFOrders = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BBSearchDown: TBitBtn;
    BBSearchUp: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    DBNavigator1: TDBNavigator;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    D_From: TDateTimePicker;
    Label2: TLabel;
    D_To: TDateTimePicker;
    CBISDEL: TCheckBox;
    StatusBar1: TStatusBar;
    BBRefresh: TBitBtn;
    DBGrid1: TDBGrid;
    BBPrint: TBitBtn;
    BBSetting: TBitBtn;
    BBSendMail: TBitBtn;
    BBReadMail: TBitBtn;
    BBSelectAll: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BB_Clear_prim: TBitBtn;
    BB_Import_From_File_xls: TBitBtn;
    OpenDialog1: TOpenDialog;
    Timer1: TTimer;
    EInterval_SendMail: TEdit;
    Label3: TLabel;
    CB_StartAutoSendMail: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BBRefreshClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CBISDELClick(Sender: TObject);
    procedure D_FromChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BBSearchDownClick(Sender: TObject);
    procedure BBSearchUpClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BBPrintClick(Sender: TObject);
    procedure BBSettingClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBSendMailClick(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BBReadMailClick(Sender: TObject);
    procedure BBSelectAllClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BB_Clear_primClick(Sender: TObject);
    procedure BB_Import_From_File_xlsClick(Sender: TObject);
    procedure BBReadMailMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CB_StartAutoSendMailClick(Sender: TObject);
    procedure EInterval_SendMailExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Carrent_ID_NAKLCAP:longint;
    CarentFieldSeach:string;
    N_mail_Sended:integer;
    Count_Doc_Imported:integer;
    ID_DOC_TYPE:longint;
    CTRLBooleanView:integer;
    procedure ReOpenQ;
    Function GridSelectAll(Grid: TDBGrid): Longint;
  end;

var
  FOrders: TFOrders;

  function F_OrdersDlg(vID_DOC_TYPE:longint):integer;

implementation

{$R *.dfm}

uses dm_orders, myfuncs, Main_f, ORDER_REP, SendMail, ReadMail, ImportTo_Uch_Doc, CLIENT_F1, DateUtils;



function F_OrdersDlg(vID_DOC_TYPE:longint):integer;
begin
 FOrders:=TFOrders.Create(Application);
 with FOrders do
 begin
  try
    ID_DOC_TYPE:=vID_DOC_TYPE;

    if ID_DOC_TYPE=сID_DOC_TYPE_Zakaz_TNP then
    begin
      Caption:=work_DB+'/ Заказы за период';
      BBSendMail.Enabled:=True;
      BBReadMail.Enabled:=True;
    end;

    if ID_DOC_TYPE=сID_DOC_TYPE_Prihod_TNP_Nakl then
     begin
      Caption:=work_DB+'/ Приходные накладные ТНП за период';
      BBSendMail.Enabled:=False;
      BBReadMail.Enabled:=False;
     end;
     if ID_DOC_TYPE=сID_DOC_TYPE_Vozvrat_TNP then
     begin
      Caption:=work_DB+'/ Возвратные накладные ТНП за период';
      BBSendMail.Enabled:=True;
      BBReadMail.Enabled:=False;
     end;



    ReOpenQ;
    result:=ShowModal;
  finally
   Free;
   FOrders:=Nil;
  end;
 end;
end;


procedure TFOrders.BBPrintClick(Sender: TObject);
begin
   OrderExcelPrint(DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger, True, ID_DOC_TYPE );
 // OrderExcelPrint_1(DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger, True, ID_DOC_TYPE );
end;

procedure TFOrders.BBReadMailClick(Sender: TObject);
var
LastID:integer;
i:integer;
Count_mail:integer;
begin
 N_mail_Sended:=0;
 Count_Doc_Imported :=0;


 LastID:=DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger;
 with DM1.ADS_Orders do
 begin
  case CTRLBooleanView of
  0: FReadMailDlg(-1,
    'Все',
    DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger);
  1:    FReadMailDlg(DM1.ADS_Orders.FieldByName('ID_CLI_K').AsInteger,
    DM1.ADS_Orders.FieldByName('CLI_K').AsString,
    DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger);   // alt
  2: ; // shIFT
  3: ;  // CTRL
 end;


  {
  if DBGrid1.SelectedRows.Count<=1 then
  begin
    FReadMailDlg(DM1.ADS_Orders.FieldByName('ID_CLI_K').AsInteger,
    DM1.ADS_Orders.FieldByName('CLI_K').AsString,
    DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger);
    Count_mail:=1;
  end
  else
  begin
    Count_mail:=DBGrid1.SelectedRows.Count;
    for i:=0 to DBGrid1.SelectedRows.Count-1 do
    begin
      DBGrid1.DataSource.DataSet.GotoBookmark((DBGrid1.SelectedRows.Items[i]));
      FReadMailDlg(DM1.ADS_Orders.FieldByName('ID_CLI_K').AsInteger,
       DM1.ADS_Orders.FieldByName('CLI_K').AsString,
      DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger);
    end; // for i:=0 to DBGrid1.SelectedRows.Count-1 do
  end;
  }
  DBGrid1.SelectedRows.Clear;
  BBRefreshClick(Sender);
  DM1.ADS_Orders.Locate('ID_NAKLCAP', LastID,[loCaseInsensitive]);
  MessageDlg(Format('Получено %d из %d писем и импортировано данных!',[N_mail_Sended, Count_Doc_Imported]), mtInformation, [mbOk], 0);
 end;





end;

procedure TFOrders.BBReadMailMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
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

procedure TFOrders.BBRefreshClick(Sender: TObject);
begin
 Carrent_ID_NAKLCAP:=DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger;
 ReOpenQ;
end;

procedure TFOrders.BBSearchDownClick(Sender: TObject);
var is_found:boolean;
begin
  DM1.ADS_Orders.DisableControls;
   with  DM1.ADS_Orders do
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
   DM1.ADS_Orders.EnableControls;
end;


procedure TFOrders.BBSearchUpClick(Sender: TObject);
var is_found:boolean;
begin
 DM1.ADS_Orders.DisableControls;
 with DM1.ADS_Orders do
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

 DM1.ADS_Orders.EnableControls;

end;


Function TFOrders.GridSelectAll(Grid: TDBGrid): Longint;
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


procedure TFOrders.BBSelectAllClick(Sender: TObject);
begin
  if DM1.ADS_Orders.Active then  GridSelectAll(DBGrid1);
end;

procedure TFOrders.BBSendMailClick(Sender: TObject);
var Save_Cursor:TCursor;
LastID:integer;
i:integer;
Count_mail:integer;
begin
 N_mail_Sended:=0;

 LastID:=DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger;
 with DM1.ADS_Orders do
 begin
  if DBGrid1.SelectedRows.Count<=1 then
  begin
    if DM1.ADS_Orders.FieldByName('NALOG_NAKL').AsInteger =0 then
    begin
      Save_Cursor:=Screen.Cursor;
      Screen.Cursor := crSQLWait;
      try
    //  OrderExcelPrint_1(DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger, False, ID_DOC_TYPE );
      OrderExcelPrint(DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger, False, ID_DOC_TYPE );
      except
       MessageDlg(Format('Не могу создать excel файл документа с именем %s! Возможно он сейчас открыт. Закройте его.',
       ['order'+IntToStr(DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger)+'.xls']), mtError, [mbOk], 0);
        Screen.Cursor := Save_Cursor;
        exit;
      end;
      Screen.Cursor := Save_Cursor;
      FSendMailDlg(DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger, False);
      Count_mail:=1;
    end
    else  MessageDlg('Этот документ уже был отправлен!', mtError, [mbOk], 0);
  end
  else
  begin
    Count_mail:=DBGrid1.SelectedRows.Count;
    for i:=0 to DBGrid1.SelectedRows.Count-1 do
    begin
      DBGrid1.DataSource.DataSet.GotoBookmark((DBGrid1.SelectedRows.Items[i]));
      Save_Cursor:=Screen.Cursor;
      Screen.Cursor := crSQLWait;
      if DM1.ADS_Orders.FieldByName('NALOG_NAKL').AsInteger =0 then
      begin
       // OrderExcelPrint_1(DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger, False, ID_DOC_TYPE);
        OrderExcelPrint(DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger, False, ID_DOC_TYPE);
        try
          FSendMailDlg(DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger, True);
        finally
          Screen.Cursor := Save_Cursor;
        end;
      end;
    end; // for i:=0 to DBGrid1.SelectedRows.Count-1 do
  end;
  DBGrid1.SelectedRows.Clear;
  BBRefreshClick(Sender);
  DM1.ADS_Orders.Locate('ID_NAKLCAP', LastID,[loCaseInsensitive]);
  MessageDlg(Format('Отправлено %d из %d писем!',[N_mail_Sended, Count_mail]), mtInformation, [mbOk], 0);
 end;


end;

procedure TFOrders.BBSettingClick(Sender: TObject);
begin
   // сохранить настройки колонок DbGrid1 в секцию  'orders_f'  Ini файла
 SaveColumnPosToIni(DbGrid1, 'orders_f');
end;

procedure TFOrders.BB_Clear_primClick(Sender: TObject);
var Save_Cursor:TCursor;
LastID:integer;
i:integer;
begin
  if MessageDlg('Вы действительно хотите удалить признак отправки заказа поставщику и импорта приходной накладной?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Save_Cursor:=Screen.Cursor;
    Screen.Cursor := crSQLWait;

    LastID:=DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger;
     with DM1.ADS_Orders do
     begin
      if DBGrid1.SelectedRows.Count<=1 then
      begin
        // разотметка об отправке заказа по почте
        Edit;
        FieldByName('NALOG_NAKL').AsInteger :=0;
        Post;
        Screen.Cursor := Save_Cursor;
      end
      else
      begin
        for i:=0 to DBGrid1.SelectedRows.Count-1 do
        begin
          DBGrid1.DataSource.DataSet.GotoBookmark((DBGrid1.SelectedRows.Items[i]));
           // разотметка об отправке заказа по почте
          Edit;
          FieldByName('NALOG_NAKL').AsInteger :=0;
          Post;
        end; // for i:=0 to DBGrid1.SelectedRows.Count-1 do

      end;
      DBGrid1.SelectedRows.Clear;
      BBRefreshClick(Sender);
      DM1.ADS_Orders.Locate('ID_NAKLCAP', LastID,[loCaseInsensitive]);


  end;

  Screen.Cursor := Save_Cursor;
end;
end;



procedure TFOrders.BB_Import_From_File_xlsClick(Sender: TObject);
var  ID_NC_NEW :longint;
begin
 Carrent_ID_NAKLCAP:=DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger;
 if ID_DOC_TYPE=сID_DOC_TYPE_Zakaz_TNP then
 begin         //       поставщик из заказа
  ID_client_select_1:= DM1.ADS_Orders.FieldByName('ID_CLI_K').AsInteger;
 end
 else
 begin
  MessageDlg('Нужно выбрать поставщика', mtInformation, [mbOk], 0);
  ID_client_select_1:=-1
 end;

 if F_clientDlg_1(45,'Поставщики ТНП на ТС', ID_client_select_1)=mrOk then
 begin
  OpenDialog1.InitialDir:=Folder_cli_select_1;

  if OpenDialog1.Execute then
  begin
     if F_ImportTo_Uch_Doc_Dlg(сID_DOC_TYPE_Prihod_TNP_Nakl,    // 164 10_1 Приход ТНП на торговую сеть
        OpenDialog1.FileName,
        ID_client_select_1, client_select_1, kateg_cli_select_1, ID_NC_NEW)=mrOk then
      begin



        if ID_DOC_TYPE<>сID_DOC_TYPE_Zakaz_TNP then
        begin
          Carrent_ID_NAKLCAP:=ID_NC_NEW;
        end
        else
        begin
          // связать заказ с накл
          DM1.ADS_Orders.Edit;
          DM1.ADS_OrdersID_LINK_DOC.ReadOnly:=False;
          DM1.ADS_OrdersID_LINK_DOC.Value:=ID_NC_NEW;
          DM1.ADS_OrdersID_LINK_DOC.ReadOnly:=True;
          DM1.ADS_Orders.Post;
        end;
        ReOpenQ;


      end;
    end;
  end;

end;

procedure TFOrders.BitBtn3Click(Sender: TObject);
begin
  DBGrid1.SelectedRows.Clear;
end;

procedure TFOrders.CBISDELClick(Sender: TObject);
begin
 ReOpenQ;
end;

procedure TFOrders.CB_StartAutoSendMailClick(Sender: TObject);
var h:extended;
begin
try
    h:=StrToFloat(Trim(EInterval_SendMail.Text));
    Timer1.Interval:=Round(60000*h);
    if CB_StartAutoSendMail.Checked then CB_StartAutoSendMail.Caption:='Стоп автомат'
    else CB_StartAutoSendMail.Caption:='Старт автомат';
    Timer1.Enabled:=CB_StartAutoSendMail.Checked;
  except
    MessageDlg('Интервал отправки заказов - не число!', mtError, [mbOk], 0);
  end;
 
end;

procedure TFOrders.CheckBox1Click(Sender: TObject);
begin
 BBSearchUp.Enabled:= CheckBox1.Checked;
 BBSearchDown.Enabled := BBSearchUp.Enabled;
end;

procedure TFOrders.CheckBox2Click(Sender: TObject);
begin

 DM1.ADS_Orders.Filtered:=CheckBox2.Checked;
 if CheckBox2.Checked then
 begin
  if Trim(Edit1.Text)<>'' then
  begin
    if MessageDlg('Установить фильтр по текущему дебетору - Yes (по кредитору No)',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DM1.ADS_Orders.Filter := '(CLI_D LIKE ' + QuotedStr('%'+Edit1.Text+'%') + ')';
    end
    else
    begin
      DM1.ADS_Orders.Filter := '(CLI_K LIKE ' + QuotedStr('%'+Edit1.Text+'%') + ')';
    end; // else if MessageDlg('Установить фильтр по текущему дебетору - Yes (по кредитору No)',
  end // if Trim(Edit1.Text)<>'' then
  else
  begin
    CheckBox2.Checked:=False;
    MessageDlg('Не указано значение фильтра!', mtInformation, [mbOk], 0);
  end;
 end
 else DBGrid1.DataSource.DataSet.Filter :='';

end;

procedure TFOrders.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TFOrders.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  if Field.FieldName='NN' then
  begin
    if DBGrid1.DataSource.DataSet.FieldByName('NALOG_NAKL').AsInteger =1 then
      DBGrid1.Canvas.Font.Color := clLime
     else
      begin
        if DBGrid1.DataSource.DataSet.FieldByName('NALOG_NAKL').AsInteger =2 then
          DBGrid1.Canvas.Font.Color := clBlue
        else
          DBGrid1.Canvas.Font.Color := clRed;
      end;
  end;

  if Field.FieldName='CLI_D' then
  begin
    if DBGrid1.DataSource.DataSet.FieldByName('ID_LINK_DOC').AsInteger <>-1 then
      DBGrid1.Canvas.Font.Color := clLime
    else DBGrid1.Canvas.Font.Color := clBlack;
  end;

  DBGrid1.DefaultDrawDataCell(Rect,field, State);
end;

procedure TFOrders.DBGrid1TitleClick(Column: TColumn);
begin
   CarentFieldSeach:=Column.FieldName;
   DM1.ADS_Orders.IndexFieldNames:=CarentFieldSeach;
end;

procedure TFOrders.D_FromChange(Sender: TObject);
begin
 F_main.D_from.DateTime:=D_From.DateTime;
 F_main.D_to.DateTime:=D_To.DateTime;
 ReopenQ;
end;

procedure TFOrders.Edit1Change(Sender: TObject);
begin
 if not CheckBox1.Checked then
  DM1.ADS_Orders.Locate(CarentFieldSeach,Edit1.Text,[loPartialKey]);
end;

procedure TFOrders.EInterval_SendMailExit(Sender: TObject);
var h:extended;
begin
  try
    h:=StrToFloat(Trim(EInterval_SendMail.Text));
    Timer1.Interval:=Round(3600*h);
  except
    MessageDlg('Интервал отправки заказов - не число!', mtError, [mbOk], 0);
  end;
end;

procedure TFOrders.FormCreate(Sender: TObject);
begin
 //  Caption:=work_DB+'/ Заказы за период';
   D_From.DateTime:=F_Main.D_From.DateTime;
   D_To.DateTime:=F_Main.D_To.DateTime;
   Carrent_ID_NAKLCAP:=Unknown_code;
 //  ReOpenQ;
  BBSearchUp.Enabled:= CheckBox1.Checked;
  BBSearchDown.Enabled := BBSearchUp.Enabled;
  CarentFieldSeach:='D';
  DM1.ADS_Orders.IndexFieldNames:=CarentFieldSeach;
end;



procedure TFOrders.FormShow(Sender: TObject);
begin
ReadColumnPosFromIni(DbGrid1, 'orders_f');
Edit1.SetFocus;


end;

procedure TFOrders.ReOpenQ;
begin
 with DM1.ADS_Orders do
 begin
  DisableControls;
  Close;
  Parameters.ParamByName('ID_DOC_TYPE').Value:=ID_DOC_TYPE;
  Parameters.ParamByName('D_FROM').Value:=D_From.DateTime;
  Parameters.ParamByName('D_TO').Value:=D_To.DateTime;
  if CBISDEL.Checked then
        Parameters.ParamByName('IS_DELETE').Value:=1
  else Parameters.ParamByName('IS_DELETE').Value:=0;
  Open;
  Locate('ID_NAKLCAP', Carrent_ID_NAKLCAP,[loCaseInsensitive]);
  EnableControls;
 end; // with DM1.ADS_Orders do
 ReadColumnPosFromIni(DbGrid1, 'orders_f');
end;

procedure TFOrders.Timer1Timer(Sender: TObject);

begin
 Timer1.Enabled:=False;
 CBISDEL.Checked:=False;
 D_From.DateTime:=IncDay(Now,-1);
 D_From.DateTime:=StartOfTheDay(D_From.DateTime);
 D_To.DateTime:= IncDay(Now,1);
 D_To.DateTime:=EndOfTheDay(D_To.DateTime);

with DM1.ADS_Orders do
 begin
  DisableControls;
  Close;
  Parameters.ParamByName('ID_DOC_TYPE').Value:=ID_DOC_TYPE;
  Parameters.ParamByName('D_FROM').Value:=D_From.DateTime;
  Parameters.ParamByName('D_TO').Value:=D_To.DateTime;
  if CBISDEL.Checked then
        Parameters.ParamByName('IS_DELETE').Value:=1
  else Parameters.ParamByName('IS_DELETE').Value:=0;
  Open;
  First;
  while not Eof do
  begin
    if FieldByName('NALOG_NAKL').AsInteger=0 then
    begin
      try
        OrderExcelPrint(FieldByName('ID_NAKLCAP').AsInteger, False, ID_DOC_TYPE);
        FSendMailDlg(DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger, True);
      except
      ;
      end;
    end;
    Next;
  end;

  EnableControls;
 end; // with DM1.ADS_Orders



 Timer1.Enabled:=True;
end;

end.
