program POrdersMail;

uses
  Vcl.Forms,
  Main_f in 'Main_f.pas' {F_Main},
  reg_server in 'reg_server.pas' {FReg_serv},
  myfuncs in 'myfuncs.pas',
  dm_orders in 'dm_orders.pas' {DM1: TDataModule},
  USERS_F in 'USERS_F.PAS' {F_users},
  Orders_f in 'Orders_f.pas' {FOrders},
  ORDER_REP in 'ORDER_REP.pas',
  SendMail in 'SendMail.pas' {FSendMail},
  ReadMail in 'ReadMail.pas' {FReadMail},
  ImportTo_Uch_Doc in 'ImportTo_Uch_Doc.pas' {F_ImportTo_Uch_Doc},
  doctypeView in 'doctypeView.pas' {F_doctypeView},
  CLIENT_F1 in 'CLIENT_F1.pas' {F_client_1},
  kateg_cli_f in 'kateg_cli_f.pas' {F_kateg_cli},
  Host_tov_list_f in 'Host_tov_list_f.pas' {FHost_Tov_list},
  GRTOV_F in 'GRTOV_F.PAS' {F_grtov},
  import_bank in 'import_bank.pas' {F_Import_Bank},
  MSXML2_TLB in 'MSXML2_TLB.pas',
  SCH_F in 'SCH_F.PAS' {F_sch};

{$R *.res}

begin
  Application.Initialize;

  if  FReg_servShowModal=1 then
  begin
    Application.CreateForm(TDM1, DM1);
  if DM1.is_connected then
    begin
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TF_Main, F_Main);
      Application.Run;
    end;
  end;


end.
