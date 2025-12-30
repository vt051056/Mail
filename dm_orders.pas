unit dm_orders;

interface

uses
  System.SysUtils, System.Classes, DB, ADODB;

type
  TDM1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADODSUsers: TADODataSet;
    ADODSUsersID_USERS: TAutoIncField;
    ADODSUsersNAME: TWideStringField;
    ADODSUsersLOGIN: TWideStringField;
    ADODSUsersSTATUS: TIntegerField;
    ADODSUsersBIRTHDAY: TDateTimeField;
    ADODSUsersIS_DELETE: TIntegerField;
    DSUSERS: TDataSource;
    Tb_USER_CONNECT: TADOTable;
    DS_Orders: TDataSource;
    ADS_Orders: TADODataSet;
    QOrder_Cap: TADOQuery;
    QOrder_Tov: TADOQuery;
    DS_QOrder_Cap: TDataSource;
    DS_QOrder_Tov: TDataSource;
    QOrder_TovID_TOV: TIntegerField;
    QOrder_TovGRUPTOV: TWideStringField;
    QOrder_TovNAME: TWideStringField;
    QOrder_TovEDIZM: TWideStringField;
    QOrder_TovNUMB: TFloatField;
    QOrder_TovPRICE: TFloatField;
    ADS_OrdersD: TDateTimeField;
    ADS_OrdersNN: TWideStringField;
    ADS_OrdersPRICE_KATEG: TIntegerField;
    ADS_OrdersTOT_SUM: TFloatField;
    ADS_OrdersTOT_NUM: TFloatField;
    ADS_OrdersD_CREATE: TDateTimeField;
    ADS_OrdersD_DELETE: TDateTimeField;
    ADS_OrdersCOMMENT_DEL: TWideStringField;
    ADS_OrdersIS_DELETE: TIntegerField;
    ADS_OrdersSCH_D: TStringField;
    ADS_OrdersSCH_K: TStringField;
    ADS_OrdersCLI_D: TWideStringField;
    ADS_OrdersRS_D: TWideStringField;
    ADS_OrdersMFO_D: TWideStringField;
    ADS_OrdersOKPO_D: TWideStringField;
    ADS_OrdersINN_D: TWideStringField;
    ADS_OrdersRNN_D: TWideStringField;
    ADS_OrdersTEL_D: TWideStringField;
    ADS_OrdersDIRECTOR_D: TWideStringField;
    ADS_OrdersADRES_D: TWideStringField;
    ADS_OrdersBANK_D: TWideStringField;
    ADS_OrdersBUHGALTER_D: TWideStringField;
    ADS_OrdersAUX_INFO_D: TWideStringField;
    ADS_OrdersDOGOVOR_D: TWideStringField;
    ADS_OrdersN_DOGOVOR_D: TWideStringField;
    ADS_OrdersD_DOGOVOR_D: TDateTimeField;
    ADS_OrdersEMAIL_D: TWideStringField;
    ADS_OrdersCLI_K: TWideStringField;
    ADS_OrdersRS_K: TWideStringField;
    ADS_OrdersMFO_K: TWideStringField;
    ADS_OrdersOKPO_K: TWideStringField;
    ADS_OrdersINN_K: TWideStringField;
    ADS_OrdersRNN_K: TWideStringField;
    ADS_OrdersTEL_K: TWideStringField;
    ADS_OrdersDIRECTOR_K: TWideStringField;
    ADS_OrdersADRES_K: TWideStringField;
    ADS_OrdersBANK_K: TWideStringField;
    ADS_OrdersBUHGALTER_K: TWideStringField;
    ADS_OrdersAUX_INFO_K: TWideStringField;
    ADS_OrdersDOGOVOR_K: TWideStringField;
    ADS_OrdersN_DOGOVOR_K: TWideStringField;
    ADS_OrdersD_DOGOVOR_K: TDateTimeField;
    ADS_OrdersEMAIL_K: TWideStringField;
    ADS_OrdersUSERNAME: TWideStringField;
    ADS_OrdersUSER_DEL: TWideStringField;
    ADS_OrdersID_NAKLCAP: TAutoIncField;
    ADS_OrdersNALOG_NAKL: TIntegerField;
    Q_Get_Email_Cli: TADOQuery;
    QDocType_View: TADOQuery;
    QDocType_ViewID_DOC_TYPE: TAutoIncField;
    QDocType_ViewNAMEDOC: TWideStringField;
    QDocType_ViewNEXT_NO: TIntegerField;
    QDocType_ViewID_SCH_D: TStringField;
    QDocType_ViewID_SCH_K: TStringField;
    QDocType_ViewID_CLI_D: TIntegerField;
    QDocType_ViewID_CLI_K: TIntegerField;
    QDocType_ViewCLI_D: TWideStringField;
    QDocType_ViewCLI_K: TWideStringField;
    QDocType_ViewID_CHAR_DOC: TIntegerField;
    QDocType_ViewCHAR_DOC: TWideStringField;
    QDocType_ViewNDS_PER: TFloatField;
    QDocType_ViewID_PROV_CASE: TIntegerField;
    QDocType_ViewID_GRTOV: TIntegerField;
    QDocType_ViewGRUPTOV: TWideStringField;
    QDocType_ViewID_KATEG_CLI: TIntegerField;
    QDocType_ViewKATEGOR: TWideStringField;
    QDocType_ViewSALES_CATEGOR: TIntegerField;
    QDocType_ViewWITH_NDS: TIntegerField;
    QDocType_ViewTIME_DEFAULT: TDateTimeField;
    QDocType_ViewFORM_PRN: TIntegerField;
    QDocType_ViewID_KATEG_CLI_K: TIntegerField;
    QDocType_ViewKATEGOR_K: TWideStringField;
    QDocType_ViewID_LINK_DOC: TIntegerField;
    QDocType_ViewID_SCH: TWideStringField;
    QDocType_ViewID_CLI: TIntegerField;
    QDocType_ViewCLI: TWideStringField;
    QDocType_ViewID_KATEG_CL: TIntegerField;
    QDocType_ViewKATEGOR_CL: TWideStringField;
    QDocType_ViewID_DOC_TYPE_LINK_2: TIntegerField;
    QDocType_ViewNAMEDOC_LINK_2: TWideStringField;
    QDocType_ViewIS_SLAVE: TIntegerField;
    DSQDocType_View: TDataSource;
    ADODSKateg_cli: TADODataSet;
    ADODSKateg_cliID_KATEGOR: TAutoIncField;
    ADODSKateg_cliKATEGOR: TWideStringField;
    ADODSKateg_cliIS_DELETE: TIntegerField;
    DSKateg_cli: TDataSource;
    SP_DELETE_KATEG_CLI: TADOStoredProc;
    SP_RESTORE_KATEG_CLI: TADOStoredProc;
    QClients_1: TADOQuery;
    QClients_1ID_CLIENTS: TAutoIncField;
    QClients_1isdelete: TStringField;
    QClients_1CLIENT: TWideStringField;
    QClients_1RS: TWideStringField;
    QClients_1MFO: TWideStringField;
    QClients_1OKPO: TWideStringField;
    QClients_1INN: TWideStringField;
    QClients_1RNN: TWideStringField;
    QClients_1TEL: TWideStringField;
    QClients_1DIRECTOR: TWideStringField;
    QClients_1BUHGALTER: TWideStringField;
    QClients_1ADRES: TWideStringField;
    QClients_1BANK: TWideStringField;
    QClients_1ID_KATEGOR: TIntegerField;
    QClients_1AUX_INFO: TWideStringField;
    QClients_1KATEGOR: TWideStringField;
    QClients_1PER_MINUS: TFloatField;
    QClients_1PRICE_TIME: TFloatField;
    QClients_1DOGOVOR: TWideStringField;
    QClients_1N_DOGOVOR: TWideStringField;
    QClients_1D_DOGOVOR: TDateTimeField;
    QClients_1ID_PARENT: TIntegerField;
    QClients_1PARENT: TWideStringField;
    QClients_1IS_DELETE: TIntegerField;
    DSClients_1: TDataSource;
    ADODSGrTov: TADODataSet;
    ADODSGrTovID_GRTOV: TAutoIncField;
    ADODSGrTovGRUPTOV: TWideStringField;
    ADODSGrTovSEQUENTIAL: TIntegerField;
    ADODSGrTovIS_DELETE: TIntegerField;
    DSGrTov: TDataSource;
    QTovList: TADOQuery;
    QTovListID_TOV: TAutoIncField;
    QTovListGRUPTOV: TWideStringField;
    QTovListNAME: TWideStringField;
    QTovListEDIZM: TWideStringField;
    QTovListGOST: TWideStringField;
    QTovListSROKREAL: TWideStringField;
    QTovListCODE: TWideStringField;
    QTovListID_GRTOV: TIntegerField;
    QTovListID_VID: TIntegerField;
    QTovListVID: TWideStringField;
    QTovListFLAG_SOCIAL: TIntegerField;
    QTovListMAX_PRICE: TFloatField;
    QTovListIS_USE: TIntegerField;
    QTovListCOMPARE_PRICE: TWideStringField;
    QTovListPART: TWideStringField;
    QTovListAVAILABILITY: TIntegerField;
    QTovListNOVELTY: TIntegerField;
    QTovListRECOMMENDED: TIntegerField;
    QTovListID_KATEGOR_CLI: TIntegerField;
    QTovListBASETOV: TIntegerField;
    DSQTovList: TDataSource;
    QClients_1EMAIL: TWideStringField;
    Q_Get_ID_CLI_For_Email: TADOQuery;
    ADS_OrdersID_CLIENT: TIntegerField;
    ADS_OrdersID_CLI_K: TIntegerField;
    QClients_1FOLDER_NAME: TWideStringField;
    ADS_OrdersID_LINK_DOC: TIntegerField;
    SP_SAVE_NAKL: TADOStoredProc;
    procedure DataModuleCreate(Sender: TObject);
    procedure QClients_1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    is_connected:boolean;
  end;

var
  DM1: TDM1;

 const сID_DOC_TYPE_Prihod_TNP_Nakl= 219; // яяя POS Приход ТНП на ТС от поставщика
       сID_DOC_TYPE_Zakaz_TNP= 163;  //  Заказы киосков на ТНП
       сID_DOC_TYPE_Zakaz_Vozvrat_TNP= 305;  //  Заказы на возврат ТНП
       сID_DOC_TYPE_Vozvrat_TNP= 220;  // яяя POS Возврат ТНП с ТС поставщику
    //   сID_DOC_TYPE_Vozvrat_TNP_OLD=170;   // Возврат киосков ТНП (инет)
       сID_DOC_TYPE_Rashod_Kolbas_realiz= 17; // 02 Расход продукции покупателю

       c_FOLDER_ARHIVE='INBOX.Обработанные';

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
uses reg_server, users_f, Vcl.Dialogs, System.UITypes,myfuncs;

procedure TDM1.DataModuleCreate(Sender: TObject);
var is_work_user:boolean;
begin

  ADOConnection1.Connected:=False;
  ADOConnection1.ConnectionString:=Connect_info;
  try

   ADODSUsers.Parameters.ParamByName('isdelete').Value:=0;
   ADODSUsers.Active:=True;
   if ADODSUsers.Locate('LOGIN',Login,[loPartialKey]) then
   begin
    ID_user_select:=ADODSUsers.FieldByName('ID_USERS').Asinteger;
    user_select:=ADODSUsers.FieldByName('NAME').AsString;
    status_user:=ADODSUsers.FieldByName('STATUS').Asinteger;
    user_birthday:=ADODSUsers.FieldByName('BIRTHDAY').AsFloat;

    with Tb_USER_CONNECT do
    begin
     Open;
     first;
     is_work_user:=False;
     while not EOF do
     begin
      if fieldbyname('ID_USER').AsInteger=ID_user_select  then
      begin
        is_work_user:=true;
        break;
      end;
      next;
     end;
     if is_work_user then
     begin
      MessageDlg('Пользователь БД с логином '+Login+' уже работает!',
     mtError, [mbOk], 0);
      if status_user=2 then
      begin
        if MessageDlg('Войти с систему?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes   then


         is_connected:=True
        else is_connected:=False;
      end
      else   is_connected:=False;
     end
     else
      begin
       is_connected:=True;
       Append;
       fieldbyname('ID_USER').AsInteger:=ID_user_select;
       post;
      end;
     Close;
    end;  // with Tb_USER_CONNECT do

   end
   else
    begin
    ID_user_select:=Unknown_code;
    user_select:=Unknown_str;
    status_user:=Unknown_code;
    user_birthday:=0.0;
     MessageDlg('Пользователь БД с логином '+Login+' не зарегистрирован в приложении!',
     mtError, [mbOk], 0);
     is_connected:=False;
   end;
   ADODSUsers.Active:=False;
  except
     MessageDlg('Соединение с сервером БД отсутствует',
     mtError, [mbOk], 0);
     is_connected:=False;
  end;

end;

procedure TDM1.QClients_1CalcFields(DataSet: TDataSet);
begin
 if TADOQuery(DataSet).FieldByName('IS_DELETE').AsInteger=1 then
 begin
  QClients_1isdelete.Value:='Удален'
 end;
end;

end.
