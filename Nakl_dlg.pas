unit Nakl_dlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TF_Nakl = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
     ID_NAKLCAP:longint;
  end;

var
  F_Nakl: TF_Nakl;

implementation

{$R *.dfm}


function F_NaklDlg(vID_NAKLCAP:longint):integer;
begin
 F_Nakl:=TF_Nakl.Create(Application);
 with F_Nakl do
 begin
  try
    ID_NAKLCAP :=vID_NAKLCAP;
    result:=ShowModal;
  finally
   Free;
   F_Nakl:=Nil;
  end;
 end;
end;

 (*
QPriceListTmp:=TADOQuery.Create(self);
  QPriceListTmp.Connection:=ADOConnectionTmp;
  if ID_HOST_SELECT=id_NMK then
  begin
    QPriceListTmp.SQL.Add('select G.GRUPTOV,  T.NAME, T.EDIZM, 0 NUMB,');
    QPriceListTmp.SQL.Add(' T.AVAILABILITY, T.NOVELTY, T.RECOMMENDED, T.ID_TOV, T.ID_GRTOV');
    QPriceListTmp.SQL.Add(' from TOV T inner join GRTOV G on G.ID_GRTOV=T.ID_GRTOV');
    QPriceListTmp.SQL.Add(' where (T.ID_GRTOV=5');   // условие выборки изменить под данную БД
    QPriceListTmp.SQL.Add(' or T.ID_GRTOV=8 or T.ID_GRTOV=15 or T.ID_GRTOV=19 or T.ID_GRTOV=22 or T.ID_GRTOV=16)');

    QPriceListTmp.SQL.Add(' and ( T.ID_KATEGOR_CLI='+IntToStr(ID_KATEGOR_TRADEPOINT)+
      ' or  T.ID_KATEGOR_CLI=0 or T.ID_KATEGOR_CLI=1 )'  );
    QPriceListTmp.SQL.Add(' order by NOVELTY desc, RECOMMENDED desc, AVAILABILITY desc, GRUPTOV asc, NAME asc');

  end
  else
  begin
    QPriceListTmp.SQL.Add('select G.GRUPTOV,  T.NAME, T.EDIZM, 0 NUMB,');
    QPriceListTmp.SQL.Add(' T.AVAILABILITY, T.NOVELTY, T.RECOMMENDED, T.ID_TOV, T.ID_GRTOV');
    QPriceListTmp.SQL.Add(' from PRICE_DATE PD');
    QPriceListTmp.SQL.Add(' inner join TOV T on T.ID_TOV=PD.ID_TOV');
    QPriceListTmp.SQL.Add(' inner join GRTOV G on G.ID_GRTOV=T.ID_GRTOV');
    QPriceListTmp.SQL.Add(' where PD.ID_CLI='+IntToStr(ID_HOST_SELECT));
    QPriceListTmp.SQL.Add(' GROUP BY G.GRUPTOV,  T.NAME, T.EDIZM,   T.AVAILABILITY, T.NOVELTY, T.RECOMMENDED, T.ID_TOV, T.ID_GRTOV');
    QPriceListTmp.SQL.Add(' order by NOVELTY desc, RECOMMENDED desc, AVAILABILITY desc, GRUPTOV asc, NAME asc');
  end;


 QPriceListTmp.Close;
  QPriceListTmp.Open;
         *)

end.
