unit Main_f;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,Vcl.ActnList, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, System.Actions, Vcl.OleServer, Excel2000;


type
  TF_Main = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    N1: TMenuItem;
    N2: TMenuItem;
    Action_Exit: TAction;
    Action_Orders: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    Action_Nakl_Prihod: TAction;
    GroupBox2: TGroupBox;
    D_Work: TDateTimePicker;
    T_Work: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    D_From: TDateTimePicker;
    D_To: TDateTimePicker;
    T_From: TDateTimePicker;
    T_To: TDateTimePicker;
    ExcelApplication1: TExcelApplication;
    Label1: TLabel;
    N5: TMenuItem;
    N6: TMenuItem;
    Action_Nakl_Vozvrat: TAction;
    N7: TMenuItem;
    Action_Nakl_Rashod_Kolbas: TAction;
    N8: TMenuItem;
    Action_Bank_Doc_Import: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    procedure Action_ExitExecute(Sender: TObject);
    procedure T_FromChange(Sender: TObject);
    procedure T_ToChange(Sender: TObject);
    procedure T_WorkChange(Sender: TObject);
    procedure Action_OrdersExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure D_WorkChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Action_Nakl_PrihodExecute(Sender: TObject);
    procedure Action_Nakl_VozvratExecute(Sender: TObject);
    procedure Action_Nakl_Rashod_KolbasExecute(Sender: TObject);
    procedure Action_Bank_Doc_ImportExecute(Sender: TObject);
    procedure N11Click(Sender: TObject);


  private
    { Private declarations }

  protected
    procedure WndProc(var Message: TMessage); override;
  public
    { Public declarations }
  end;

var
  F_Main: TF_Main;


implementation

{$R *.dfm}

uses Orders_f, dm_orders, users_f, ReadMail, myfuncs, import_bank;

procedure TF_Main.WndProc(var Message: TMessage);
begin
  inherited;
  case Message.Msg of
    WM_MY_MESSAGE:
    begin
      with DM1.Q_Get_Email_Cli do
      begin
        Close;
        Parameters.ParamByName('ID_CLI').Value:=Message.LParam;
        Open;
        //FReadMailDlg(FieldByName('EMAIL').AsString, DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger );
        FReadMailDlg(Message.LParam,FieldByName('CLIENT').AsString, DM1.ADS_Orders.FieldByName('ID_NAKLCAP').AsInteger );
        Close;
      end;
     // ShowMessageFmt('Получил %d и %d.', [Message.WParam, Message.LParam]);
     // FReadMailDlg(vEMailRead:string):integer;
    end;

  end;
end;

procedure TF_Main.Action_Bank_Doc_ImportExecute(Sender: TObject);
begin
// импорт банковских документов с системы банк-клиент в учетную
  F_Import_Bank_Dlg();
end;

procedure TF_Main.Action_ExitExecute(Sender: TObject);
begin
 Close;
end;

procedure TF_Main.Action_Nakl_PrihodExecute(Sender: TObject);
begin
   F_OrdersDlg(сID_DOC_TYPE_Prihod_TNP_Nakl);  //  10_1 Приход ТНП на торговую сеть
end;

procedure TF_Main.Action_Nakl_Rashod_KolbasExecute(Sender: TObject);
begin
  F_OrdersDlg(сID_DOC_TYPE_Rashod_Kolbas_realiz);  // 17; 02 Расход продукции покупателю
end;

procedure TF_Main.Action_Nakl_VozvratExecute(Sender: TObject);
begin
  F_OrdersDlg(сID_DOC_TYPE_Vozvrat_TNP);  //  Заказы киосков на ТНП
end;

procedure TF_Main.Action_OrdersExecute(Sender: TObject);
begin
  F_OrdersDlg(сID_DOC_TYPE_Zakaz_TNP);  //  Заказы ТНП поставщику
end;

procedure TF_Main.D_WorkChange(Sender: TObject);
begin
D_From.Date:=D_Work.Date;
D_To.Date:=D_Work.Date;
end;

procedure TF_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  with DM1.Tb_USER_CONNECT do
  begin
    Open;
    while not EOF do
    begin
      if fieldbyname('ID_USER').AsInteger=ID_user_select  then
      begin
        Delete;
        break;
      end;
      next;
    end;
    close;
  end;


  DM1.ADOConnection1.Connected:=False;

end;

procedure TF_Main.FormCreate(Sender: TObject);
begin
  D_Work.Date:=Date;
  D_From.Date:=D_Work.Date;
  D_To.Date:=D_Work.Date;
end;

procedure TF_Main.N11Click(Sender: TObject);
begin
  F_OrdersDlg(сID_DOC_TYPE_Zakaz_Vozvrat_TNP);  //  Заказы на возврат поставщику ТНП
end;

procedure TF_Main.T_FromChange(Sender: TObject);
begin
  D_From.Time:=T_From.Time;
end;

procedure TF_Main.T_ToChange(Sender: TObject);
begin
  D_To.Time:=T_To.Time;
end;

procedure TF_Main.T_WorkChange(Sender: TObject);
begin
  D_Work.Time:=T_Work.Time;
end;

end.
