object DM1: TDM1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 392
  Width = 583
  object ADOConnection1: TADOConnection
    CommandTimeout = 3600
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Vorra2016;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=NMK_EP;Data Source=C-17\MSSQLSRV17;' +
      'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096' +
      ';Workstation ID=DEVMAIN;Use Encryption for Data=False;Tag with c' +
      'olumn collation when possible=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 4
  end
  object ADODSUsers: TADODataSet
    AutoCalcFields = False
    Connection = ADOConnection1
    CommandText = 
      'select ID_USERS, NAME, LOGIN, STATUS, BIRTHDAY, IS_DELETE'#13#10'  fro' +
      'm USERS'#13#10'where IS_DELETE=:isdelete'#13#10' order by NAME'
    Parameters = <
      item
        Name = 'isdelete'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 78
    object ADODSUsersID_USERS: TAutoIncField
      FieldName = 'ID_USERS'
      ReadOnly = True
      Visible = False
    end
    object ADODSUsersNAME: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 50
      FieldName = 'NAME'
      Size = 50
    end
    object ADODSUsersLOGIN: TWideStringField
      DisplayLabel = #1051#1086#1075#1080#1085
      DisplayWidth = 15
      FieldName = 'LOGIN'
      Size = 50
    end
    object ADODSUsersSTATUS: TIntegerField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATUS'
    end
    object ADODSUsersBIRTHDAY: TDateTimeField
      DisplayLabel = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103
      FieldName = 'BIRTHDAY'
    end
    object ADODSUsersIS_DELETE: TIntegerField
      FieldName = 'IS_DELETE'
      Visible = False
    end
  end
  object DSUSERS: TDataSource
    DataSet = ADODSUsers
    Left = 74
    Top = 78
  end
  object Tb_USER_CONNECT: TADOTable
    Connection = ADOConnection1
    TableName = 'USER_CONNECT'
    Left = 127
    Top = 76
  end
  object DS_Orders: TDataSource
    DataSet = ADS_Orders
    Left = 296
    Top = 80
  end
  object ADS_Orders: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select NC.D, NC.NN, NC.PRICE_KATEG,'#13#10' NC.TOT_SUM, NC.TOT_NUM, NC' +
      '.D_CREATE, NC.D_DELETE,'#13#10' NC.COMMENT_DEL, NC.IS_DELETE, NC.SCH_D' +
      ', NC.SCH_K,'#13#10' CLD.CLIENT CLI_D, CLD.RS RS_D, CLD.MFO MFO_D, CLD.' +
      'OKPO OKPO_D, CLD.INN INN_D, CLD.RNN RNN_D, CLD.TEL TEL_D, CLD.DI' +
      'RECTOR DIRECTOR_D,'#13#10' CLD.ADRES ADRES_D, CLD.BANK BANK_D, CLD.BUH' +
      'GALTER BUHGALTER_D, CLD.AUX_INFO AUX_INFO_D, CLD.DOGOVOR DOGOVOR' +
      '_D, '#13#10' CLD.N_DOGOVOR N_DOGOVOR_D, CLD.D_DOGOVOR D_DOGOVOR_D, CLD' +
      '.EMAIL EMAIL_D,'#13#10#13#10' CLK.CLIENT CLI_K, CLK.RS RS_K, CLK.MFO MFO_K' +
      ', CLK.OKPO OKPO_K, CLK.INN INN_K, CLK.RNN RNN_K, CLK.TEL TEL_K, ' +
      'CLK.DIRECTOR DIRECTOR_K,'#13#10' CLK.ADRES ADRES_K, CLK.BANK BANK_K, C' +
      'LK.BUHGALTER BUHGALTER_K, CLK.AUX_INFO AUX_INFO_K, CLK.DOGOVOR D' +
      'OGOVOR_K, '#13#10' CLK.N_DOGOVOR N_DOGOVOR_K, CLK.D_DOGOVOR D_DOGOVOR_' +
      'K, CLK.EMAIL EMAIL_K,'#13#10#13#10' U."NAME" USERNAME,'#13#10' UD."NAME" USER_DE' +
      'L, NC.ID_NAKLCAP,'#13#10'NC.NALOG_NAKL,'#13#10'NC.ID_CLIENT,'#13#10'NC.ID_CLI_K,'#13#10 +
      'NC.ID_LINK_DOC'#13#10#13#10#13#10'from NAKLCAP NC'#13#10'left outer join CLIENTS CLD' +
      ' on NC.ID_CLIENT=CLD.ID_CLIENTS'#13#10'left outer join CLIENTS CLK on ' +
      'NC.ID_CLI_K=CLK.ID_CLIENTS'#13#10'left outer join USERS U on NC.ID_USE' +
      'RS=U.ID_USERS'#13#10'left outer join USERS UD on UD.ID_USERS=NC.ID_USE' +
      'R_DEL'#13#10'where  NC.ID_DOC_TYPE=:ID_DOC_TYPE'#13#10'and NC.D>=:D_FROM'#13#10'an' +
      'd NC.D<=:D_TO'#13#10'and NC.IS_DELETE=:IS_DELETE'
    Parameters = <
      item
        Name = 'ID_DOC_TYPE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'D_FROM'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'D_TO'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'IS_DELETE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 232
    Top = 80
    object ADS_OrdersD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'D'
      ReadOnly = True
    end
    object ADS_OrdersNN: TWideStringField
      DisplayLabel = #8470
      FieldName = 'NN'
      ReadOnly = True
      Size = 50
    end
    object ADS_OrdersPRICE_KATEG: TIntegerField
      DisplayLabel = #1062#1077#1085#1086#1074#1072#1103' '#1082#1072#1090#1077#1075
      FieldName = 'PRICE_KATEG'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersTOT_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'TOT_SUM'
      ReadOnly = True
    end
    object ADS_OrdersTOT_NUM: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'TOT_NUM'
      ReadOnly = True
    end
    object ADS_OrdersD_CREATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
      FieldName = 'D_CREATE'
      ReadOnly = True
    end
    object ADS_OrdersD_DELETE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1091#1076#1072#1083#1077#1085#1080#1103
      FieldName = 'D_DELETE'
      ReadOnly = True
    end
    object ADS_OrdersCOMMENT_DEL: TWideStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1091#1076#1072#1083#1077#1085#1080#1103
      FieldName = 'COMMENT_DEL'
      ReadOnly = True
      Size = 50
    end
    object ADS_OrdersIS_DELETE: TIntegerField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1091#1076#1072#1083#1077#1085#1085#1086#1075#1086
      FieldName = 'IS_DELETE'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersSCH_D: TStringField
      DisplayLabel = #1057#1095'.'#1044
      FieldName = 'SCH_D'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 10
    end
    object ADS_OrdersSCH_K: TStringField
      DisplayLabel = #1057#1095'.'#1050
      FieldName = 'SCH_K'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 10
    end
    object ADS_OrdersCLI_D: TWideStringField
      DisplayLabel = #1044#1077#1073#1080#1090#1086#1088
      DisplayWidth = 50
      FieldName = 'CLI_D'
      ReadOnly = True
      Size = 255
    end
    object ADS_OrdersRS_D: TWideStringField
      DisplayLabel = #1056'/'#1089' '#1076#1077#1073#1080#1090#1086#1088#1072
      FieldName = 'RS_D'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersMFO_D: TWideStringField
      FieldName = 'MFO_D'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersOKPO_D: TWideStringField
      FieldName = 'OKPO_D'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersINN_D: TWideStringField
      FieldName = 'INN_D'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersRNN_D: TWideStringField
      FieldName = 'RNN_D'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersTEL_D: TWideStringField
      FieldName = 'TEL_D'
      ReadOnly = True
      Visible = False
      Size = 15
    end
    object ADS_OrdersDIRECTOR_D: TWideStringField
      FieldName = 'DIRECTOR_D'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object ADS_OrdersADRES_D: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1076#1077#1073#1077#1090#1086#1088#1072
      DisplayWidth = 50
      FieldName = 'ADRES_D'
      ReadOnly = True
      Size = 255
    end
    object ADS_OrdersBANK_D: TWideStringField
      FieldName = 'BANK_D'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object ADS_OrdersBUHGALTER_D: TWideStringField
      FieldName = 'BUHGALTER_D'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object ADS_OrdersAUX_INFO_D: TWideStringField
      FieldName = 'AUX_INFO_D'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object ADS_OrdersDOGOVOR_D: TWideStringField
      FieldName = 'DOGOVOR_D'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object ADS_OrdersN_DOGOVOR_D: TWideStringField
      FieldName = 'N_DOGOVOR_D'
      ReadOnly = True
      Visible = False
      Size = 10
    end
    object ADS_OrdersD_DOGOVOR_D: TDateTimeField
      FieldName = 'D_DOGOVOR_D'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersEMAIL_D: TWideStringField
      DisplayLabel = 'EMAIL '#1076#1077#1073#1080#1090#1086#1088#1072
      DisplayWidth = 50
      FieldName = 'EMAIL_D'
      ReadOnly = True
      Size = 255
    end
    object ADS_OrdersCLI_K: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1086#1088
      DisplayWidth = 50
      FieldName = 'CLI_K'
      ReadOnly = True
      Size = 255
    end
    object ADS_OrdersRS_K: TWideStringField
      FieldName = 'RS_K'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersMFO_K: TWideStringField
      FieldName = 'MFO_K'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersOKPO_K: TWideStringField
      FieldName = 'OKPO_K'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersINN_K: TWideStringField
      FieldName = 'INN_K'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersRNN_K: TWideStringField
      FieldName = 'RNN_K'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersTEL_K: TWideStringField
      FieldName = 'TEL_K'
      ReadOnly = True
      Visible = False
      Size = 15
    end
    object ADS_OrdersDIRECTOR_K: TWideStringField
      FieldName = 'DIRECTOR_K'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object ADS_OrdersADRES_K: TWideStringField
      FieldName = 'ADRES_K'
      ReadOnly = True
      Visible = False
      Size = 255
    end
    object ADS_OrdersBANK_K: TWideStringField
      FieldName = 'BANK_K'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object ADS_OrdersBUHGALTER_K: TWideStringField
      FieldName = 'BUHGALTER_K'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object ADS_OrdersAUX_INFO_K: TWideStringField
      FieldName = 'AUX_INFO_K'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object ADS_OrdersDOGOVOR_K: TWideStringField
      FieldName = 'DOGOVOR_K'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object ADS_OrdersN_DOGOVOR_K: TWideStringField
      FieldName = 'N_DOGOVOR_K'
      ReadOnly = True
      Visible = False
      Size = 10
    end
    object ADS_OrdersD_DOGOVOR_K: TDateTimeField
      FieldName = 'D_DOGOVOR_K'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersEMAIL_K: TWideStringField
      DisplayLabel = 'EMAIL '#1082#1088#1077#1076#1080#1090#1086#1088#1072
      FieldName = 'EMAIL_K'
      ReadOnly = True
      Size = 255
    end
    object ADS_OrdersUSERNAME: TWideStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1089#1086#1079#1076#1072#1074#1096#1080#1081
      FieldName = 'USERNAME'
      ReadOnly = True
      Size = 50
    end
    object ADS_OrdersUSER_DEL: TWideStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1072#1074#1072#1090#1077#1083#1100' '#1091#1076#1072#1083#1080#1074#1096#1080#1081
      FieldName = 'USER_DEL'
      ReadOnly = True
      Size = 50
    end
    object ADS_OrdersID_NAKLCAP: TAutoIncField
      FieldName = 'ID_NAKLCAP'
      ReadOnly = True
      Visible = False
    end
    object ADS_OrdersNALOG_NAKL: TIntegerField
      FieldName = 'NALOG_NAKL'
      Visible = False
    end
    object ADS_OrdersID_CLIENT: TIntegerField
      FieldName = 'ID_CLIENT'
      ReadOnly = True
    end
    object ADS_OrdersID_CLI_K: TIntegerField
      FieldName = 'ID_CLI_K'
      ReadOnly = True
    end
    object ADS_OrdersID_LINK_DOC: TIntegerField
      FieldName = 'ID_LINK_DOC'
      ReadOnly = True
    end
  end
  object QOrder_Cap: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select NC.D, NC.NN, NC.PRICE_KATEG,'
      ' NC.TOT_SUM, NC.TOT_NUM, NC.D_CREATE, NC.D_DELETE,'
      ' NC.COMMENT_DEL, NC.IS_DELETE, NC.SCH_D, NC.SCH_K,'
      
        ' CLD.CLIENT CLI_D, CLD.RS RS_D, CLD.MFO MFO_D, CLD.OKPO OKPO_D, ' +
        'CLD.INN INN_D, CLD.RNN RNN_D, CLD.TEL TEL_D, CLD.DIRECTOR DIRECT' +
        'OR_D,'
      
        ' CLD.ADRES ADRES_D, CLD.BANK BANK_D, CLD.BUHGALTER BUHGALTER_D, ' +
        'CLD.AUX_INFO AUX_INFO_D, CLD.DOGOVOR DOGOVOR_D,'
      
        ' CLD.N_DOGOVOR N_DOGOVOR_D, CLD.D_DOGOVOR D_DOGOVOR_D, CLD.EMAIL' +
        ' EMAIL_D,'
      ''
      
        ' CLK.CLIENT CLI_K, CLK.RS RS_K, CLK.MFO MFO_K, CLK.OKPO OKPO_K, ' +
        'CLK.INN INN_K, CLK.RNN RNN_K, CLK.TEL TEL_K, CLK.DIRECTOR DIRECT' +
        'OR_K,'
      
        ' CLK.ADRES ADRES_K, CLK.BANK BANK_K, CLK.BUHGALTER BUHGALTER_K, ' +
        'CLK.AUX_INFO AUX_INFO_K, CLK.DOGOVOR DOGOVOR_K,'
      
        ' CLK.N_DOGOVOR N_DOGOVOR_K, CLK.D_DOGOVOR D_DOGOVOR_K, CLK.EMAIL' +
        ' EMAIL_K,'
      ''
      ' U."NAME" USERNAME,'
      ' UD."NAME" USER_DEL, NC.ID_NAKLCAP,'
      ' NC.ID_CLIENT ID_CLI_D,'
      ' NC.ID_CLI_K ID_CLI_K,'
      ''
      ' NC.ID_DOC_TYPE,'
      ' NC.MINUS,'
      ' NC.NDS,'
      ' CLD.ADRES,'
      ' CLD.AUX_INFO'
      ''
      'from NAKLCAP NC'
      'left outer join CLIENTS CLD on NC.ID_CLIENT=CLD.ID_CLIENTS'
      'left outer join CLIENTS CLK on NC.ID_CLI_K=CLK.ID_CLIENTS'
      'left outer join USERS U on NC.ID_USERS=U.ID_USERS'
      'left outer join USERS UD on UD.ID_USERS=NC.ID_USER_DEL'
      'where  NC.ID_NAKLCAP=:ID_NAKLCAP')
    Left = 168
    Top = 136
  end
  object QOrder_Tov: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_NAKLCAP'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select NT.ID_TOV, G.GRUPTOV, T.[NAME], T.EDIZM, NT.NUMB, NT.[PRI' +
        'CE] from NAKLTOV NT'
      'left outer join TOV T on T.ID_TOV=NT.ID_TOV'
      'left outer join GRTOV G on G.ID_GRTOV=T.ID_GRTOV'
      'where NT.ID_NAKLCAP=:ID_NAKLCAP'
      'order by G.GRUPTOV, T.[NAME]'
      '')
    Left = 296
    Top = 136
    object QOrder_TovGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 20
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object QOrder_TovNAME: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 255
    end
    object QOrder_TovEDIZM: TWideStringField
      DisplayLabel = #1045#1076'.'#1080#1079#1084
      FieldName = 'EDIZM'
      Size = 5
    end
    object QOrder_TovNUMB: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'NUMB'
      DisplayFormat = '0.000'
    end
    object QOrder_TovPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      DisplayFormat = '0.00'
    end
    object QOrder_TovID_TOV: TIntegerField
      FieldName = 'ID_TOV'
      Visible = False
    end
  end
  object DS_QOrder_Cap: TDataSource
    DataSet = QOrder_Cap
    Left = 264
    Top = 136
  end
  object DS_QOrder_Tov: TDataSource
    DataSet = QOrder_Tov
    Left = 336
    Top = 136
  end
  object Q_Get_Email_Cli: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_CLI'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select [EMAIL], [CLIENT] from [dbo].[CLIENTS]'
      'where [ID_CLIENTS]=:ID_CLI'
      '')
    Left = 64
    Top = 184
  end
  object QDocType_View: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'ID_CHAR_FROM'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_CHAR_TO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select DT.ID_DOC_TYPE, DT.NAMEDOC, DT.NEXT_NO,'
      'DT.ID_SCH_D, DT.ID_SCH_K, DT.ID_CLI_D, DT.ID_CLI_K,'
      
        'CLD.CLIENT CLI_D, CLK.CLIENT CLI_K, DT.ID_CHAR_DOC, DC.CHAR_DOC,' +
        ' DT.NDS_PER, DT.ID_PROV_CASE,'
      'DT.ID_GRTOV, GT.GRUPTOV,'
      'DT.ID_KATEG_CLI, KC.KATEGOR,'
      'DT.SALES_CATEGOR, DT.WITH_NDS, DT.TIME_DEFAULT, DT.FORM_PRN,'
      'DT.ID_KATEG_CLI_K, KCK.KATEGOR KATEGOR_K, DT.ID_LINK_DOC,'
      
        'DT.ID_SCH, DT.ID_CLI, CL.CLIENT CLI, DT.ID_KATEG_CL, KCL.KATEGOR' +
        ' KATEGOR_CL,'
      'DT.ID_DOC_TYPE_LINK_2, DTL2.NAMEDOC NAMEDOC_LINK_2, DT.IS_SLAVE'
      ''
      'from DOC_TYPE DT '
      'left outer join CLIENTS CLD ON CLD.ID_CLIENTS=DT.ID_CLI_D'
      'left outer join CLIENTS CLK ON CLK.ID_CLIENTS=DT.ID_CLI_K'
      'left outer join CLIENTS CL ON CL.ID_CLIENTS=DT.ID_CLI'
      'left  outer join DOC_CHAR DC ON DC.ID_CHAR_DOC=DT.ID_CHAR_DOC'
      'left outer join GRTOV GT on GT.ID_GRTOV=DT.ID_GRTOV '
      'left outer join KATEG_CLI KC on KC.ID_KATEGOR=DT.ID_KATEG_CLI'
      
        'left outer join KATEG_CLI KCK on KCK.ID_KATEGOR=DT.ID_KATEG_CLI_' +
        'K'
      'left outer join KATEG_CLI KCL on KCL.ID_KATEGOR=DT.ID_KATEG_CL'
      
        'left outer join DOC_TYPE DTL2 on DTL2.ID_DOC_TYPE=DT.ID_DOC_TYPE' +
        '_LINK_2'
      'where DT.ID_CHAR_DOC between :ID_CHAR_FROM AND  :ID_CHAR_TO'
      'ORDER BY NAMEDOC')
    Left = 407
    Top = 46
    object QDocType_ViewID_DOC_TYPE: TAutoIncField
      FieldName = 'ID_DOC_TYPE'
      ReadOnly = True
      Visible = False
    end
    object QDocType_ViewNAMEDOC: TWideStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'NAMEDOC'
      Size = 50
    end
    object QDocType_ViewNEXT_NO: TIntegerField
      DisplayLabel = #1057#1083#1077#1076#1091#1102#1097'.'#8470
      FieldName = 'NEXT_NO'
    end
    object QDocType_ViewID_SCH_D: TStringField
      DisplayLabel = #1057#1095#1077#1090' '#1044
      FieldName = 'ID_SCH_D'
      FixedChar = True
      Size = 10
    end
    object QDocType_ViewID_SCH_K: TStringField
      DisplayLabel = #1057#1095#1077#1090' '#1050
      FieldName = 'ID_SCH_K'
      FixedChar = True
      Size = 10
    end
    object QDocType_ViewID_CLI_D: TIntegerField
      FieldName = 'ID_CLI_D'
      Visible = False
    end
    object QDocType_ViewID_CLI_K: TIntegerField
      FieldName = 'ID_CLI_K'
      Visible = False
    end
    object QDocType_ViewCLI_D: TWideStringField
      DisplayLabel = #1044#1077#1073#1080#1090#1086#1088
      DisplayWidth = 50
      FieldName = 'CLI_D'
      Size = 255
    end
    object QDocType_ViewCLI_K: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1086#1088
      DisplayWidth = 50
      FieldName = 'CLI_K'
      Size = 255
    end
    object QDocType_ViewID_CHAR_DOC: TIntegerField
      FieldName = 'ID_CHAR_DOC'
      Visible = False
    end
    object QDocType_ViewCHAR_DOC: TWideStringField
      DisplayLabel = #1061#1072#1088#1072#1082#1090#1077#1088' '#1076#1086#1082
      FieldName = 'CHAR_DOC'
      Size = 50
    end
    object QDocType_ViewNDS_PER: TFloatField
      DisplayLabel = '% '#1057#1090#1072#1074#1082#1072' '#1053#1044#1057
      FieldName = 'NDS_PER'
    end
    object QDocType_ViewID_PROV_CASE: TIntegerField
      DisplayLabel = #1042#1072#1088'.'#1087#1088#1086#1074
      FieldName = 'ID_PROV_CASE'
    end
    object QDocType_ViewID_GRTOV: TIntegerField
      FieldName = 'ID_GRTOV'
      Visible = False
    end
    object QDocType_ViewGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1072
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object QDocType_ViewID_KATEG_CLI: TIntegerField
      FieldName = 'ID_KATEG_CLI'
      Visible = False
    end
    object QDocType_ViewKATEGOR: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1082#1083#1080#1077#1085#1090#1072' '#1044
      DisplayWidth = 20
      FieldName = 'KATEGOR'
      Size = 50
    end
    object QDocType_ViewSALES_CATEGOR: TIntegerField
      DisplayLabel = #1062#1077#1085#1086#1074#1072#1103' '#1082#1072#1090#1077#1088#1086#1088#1080#1103
      FieldName = 'SALES_CATEGOR'
    end
    object QDocType_ViewWITH_NDS: TIntegerField
      DisplayLabel = #1057' '#1053#1044#1057' - 1 '#1073#1077#1079' - 0'
      FieldName = 'WITH_NDS'
    end
    object QDocType_ViewTIME_DEFAULT: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      FieldName = 'TIME_DEFAULT'
    end
    object QDocType_ViewFORM_PRN: TIntegerField
      DisplayLabel = #1055#1077#1095#1072#1090#1085#1072#1103' '#1092#1086#1088#1084#1072
      FieldName = 'FORM_PRN'
    end
    object QDocType_ViewID_KATEG_CLI_K: TIntegerField
      FieldName = 'ID_KATEG_CLI_K'
      Visible = False
    end
    object QDocType_ViewKATEGOR_K: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1082#1083#1080#1077#1085#1090#1072' '#1050
      DisplayWidth = 20
      FieldName = 'KATEGOR_K'
      Size = 50
    end
    object QDocType_ViewID_LINK_DOC: TIntegerField
      FieldName = 'ID_LINK_DOC'
      Visible = False
    end
    object QDocType_ViewID_SCH: TWideStringField
      DisplayLabel = #1048#1085#1074#1077#1085#1090' '#1089#1095#1077#1090
      FieldName = 'ID_SCH'
      Size = 10
    end
    object QDocType_ViewID_CLI: TIntegerField
      FieldName = 'ID_CLI'
      Visible = False
    end
    object QDocType_ViewCLI: TWideStringField
      DisplayLabel = #1048#1085#1074#1077#1085#1090' '#1089#1082#1083#1072#1076
      DisplayWidth = 50
      FieldName = 'CLI'
      Size = 255
    end
    object QDocType_ViewID_KATEG_CL: TIntegerField
      FieldName = 'ID_KATEG_CL'
      Visible = False
    end
    object QDocType_ViewKATEGOR_CL: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088' '#1080#1085#1074#1077#1085#1090' '#1089#1082#1083
      FieldName = 'KATEGOR_CL'
      Size = 50
    end
    object QDocType_ViewID_DOC_TYPE_LINK_2: TIntegerField
      FieldName = 'ID_DOC_TYPE_LINK_2'
      Visible = False
    end
    object QDocType_ViewNAMEDOC_LINK_2: TWideStringField
      DisplayLabel = #1044#1086#1082'. '#1072#1074#1090#1086#1076#1091#1073#1083#1080#1082#1072#1090#1072
      FieldName = 'NAMEDOC_LINK_2'
      Size = 50
    end
    object QDocType_ViewIS_SLAVE: TIntegerField
      DisplayLabel = #1055#1086#1076#1095#1080#1085#1077#1085#1085#1099#1081' '#1072#1074#1090#1086#1076#1091#1073#1083#1080#1082#1072#1090
      FieldName = 'IS_SLAVE'
    end
  end
  object DSQDocType_View: TDataSource
    DataSet = QDocType_View
    Left = 455
    Top = 50
  end
  object ADODSKateg_cli: TADODataSet
    Connection = ADOConnection1
    CommandText = 
      'select ID_KATEGOR, KATEGOR, IS_DELETE from KATEG_CLI '#13#10'where IS_' +
      'DELETE=:isdelete'#13#10'order by KATEGOR'
    Parameters = <
      item
        Name = 'isdelete'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 280
    Top = 192
    object ADODSKateg_cliID_KATEGOR: TAutoIncField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_KATEGOR'
      ReadOnly = True
    end
    object ADODSKateg_cliKATEGOR: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      FieldName = 'KATEGOR'
      Size = 50
    end
    object ADODSKateg_cliIS_DELETE: TIntegerField
      FieldName = 'IS_DELETE'
      Visible = False
    end
  end
  object DSKateg_cli: TDataSource
    DataSet = ADODSKateg_cli
    Left = 316
    Top = 194
  end
  object SP_DELETE_KATEG_CLI: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'DELETE_KATEG_CLI;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_KATEGOR'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 359
    Top = 192
  end
  object SP_RESTORE_KATEG_CLI: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RESTORE_KATEG_CLI;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_KATEGOR'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 407
    Top = 190
  end
  object QClients_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = QClients_1CalcFields
    Parameters = <
      item
        Name = 'ID_K1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_K2'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select C.ID_CLIENTS, C.CLIENT, C.RS, C.MFO, C.OKPO, C.INN, C.RNN' +
        ','
      
        'C.TEL, C.DIRECTOR, C.BUHGALTER, C.ADRES, C.BANK, C.ID_KATEGOR, C' +
        '.AUX_INFO,'
      'KC.KATEGOR, C.PER_MINUS, C.PRICE_TIME,'
      'C.DOGOVOR,C.N_DOGOVOR,C.D_DOGOVOR,'
      
        'C.ID_PARENT , CP.CLIENT PARENT, C.IS_DELETE, C.EMAIL, C.FOLDER_N' +
        'AME'
      'from CLIENTS C'
      'inner join KATEG_CLI KC on  KC.ID_KATEGOR= C.ID_KATEGOR'
      'left outer join CLIENTS CP on CP. ID_CLIENTS=C.ID_PARENT'
      'where C.ID_KATEGOR>=:ID_K1'
      '     and C.ID_KATEGOR<=:ID_K2'
      '     and C.IS_DELETE=0'
      'order by C.CLIENT')
    Left = 428
    Top = 138
    object QClients_1ID_CLIENTS: TAutoIncField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_CLIENTS'
      LookupCache = True
      ReadOnly = True
    end
    object QClients_1CLIENT: TWideStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      DisplayWidth = 50
      FieldName = 'CLIENT'
      ReadOnly = True
      Size = 255
    end
    object QClients_1EMAIL: TWideStringField
      DisplayLabel = 'E-MAIL'
      DisplayWidth = 30
      FieldName = 'EMAIL'
      Size = 255
    end
    object QClients_1TEL: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'TEL'
      ReadOnly = True
      Size = 15
    end
    object QClients_1ADRES: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 50
      FieldName = 'ADRES'
      ReadOnly = True
      Size = 255
    end
    object QClients_1KATEGOR: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      DisplayWidth = 20
      FieldName = 'KATEGOR'
      ReadOnly = True
      Size = 50
    end
    object QClients_1RS: TWideStringField
      DisplayLabel = #1056'/'#1057
      FieldName = 'RS'
      ReadOnly = True
    end
    object QClients_1MFO: TWideStringField
      DisplayLabel = #1052#1060#1054
      FieldName = 'MFO'
      ReadOnly = True
    end
    object QClients_1OKPO: TWideStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'OKPO'
      ReadOnly = True
    end
    object QClients_1INN: TWideStringField
      DisplayLabel = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#8470
      FieldName = 'INN'
      ReadOnly = True
    end
    object QClients_1RNN: TWideStringField
      DisplayLabel = #8470' '#1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      FieldName = 'RNN'
      ReadOnly = True
    end
    object QClients_1DIRECTOR: TWideStringField
      DisplayLabel = #1044#1080#1088#1077#1082#1090#1086#1088
      DisplayWidth = 20
      FieldName = 'DIRECTOR'
      ReadOnly = True
      Size = 50
    end
    object QClients_1BUHGALTER: TWideStringField
      DisplayLabel = #1041#1091#1093#1075#1072#1083#1090#1077#1088
      DisplayWidth = 20
      FieldName = 'BUHGALTER'
      ReadOnly = True
      Size = 50
    end
    object QClients_1BANK: TWideStringField
      DisplayLabel = #1041#1072#1085#1082
      DisplayWidth = 20
      FieldName = 'BANK'
      ReadOnly = True
      Size = 50
    end
    object QClients_1ID_KATEGOR: TIntegerField
      FieldName = 'ID_KATEGOR'
      ReadOnly = True
      Visible = False
    end
    object QClients_1AUX_INFO: TWideStringField
      DisplayLabel = #1044#1086#1087'. '#1080#1085#1092#1086'.'
      DisplayWidth = 20
      FieldName = 'AUX_INFO'
      ReadOnly = True
      Size = 50
    end
    object QClients_1PER_MINUS: TFloatField
      DisplayLabel = '% '#1089#1082#1080#1076#1082#1080
      FieldName = 'PER_MINUS'
      ReadOnly = True
    end
    object QClients_1PRICE_TIME: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1095#1072#1089#1072' '#1086#1090#1075#1088#1091#1079#1082#1080
      FieldName = 'PRICE_TIME'
      ReadOnly = True
    end
    object QClients_1DOGOVOR: TWideStringField
      DisplayLabel = #1042#1080#1076' '#1076#1086#1075#1086#1074#1086#1088#1072
      DisplayWidth = 20
      FieldName = 'DOGOVOR'
      ReadOnly = True
      Size = 50
    end
    object QClients_1N_DOGOVOR: TWideStringField
      DisplayLabel = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
      FieldName = 'N_DOGOVOR'
      ReadOnly = True
      Size = 10
    end
    object QClients_1D_DOGOVOR: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
      FieldName = 'D_DOGOVOR'
      ReadOnly = True
    end
    object QClients_1ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      ReadOnly = True
      Visible = False
    end
    object QClients_1PARENT: TWideStringField
      DisplayLabel = #1055#1086#1087#1077#1095#1080#1090#1077#1083#1100
      DisplayWidth = 30
      FieldName = 'PARENT'
      ReadOnly = True
      Size = 255
    end
    object QClients_1IS_DELETE: TIntegerField
      FieldName = 'IS_DELETE'
      Visible = False
    end
    object QClients_1isdelete: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldKind = fkCalculated
      FieldName = 'isdelete'
      Size = 10
      Calculated = True
    end
    object QClients_1FOLDER_NAME: TWideStringField
      DisplayLabel = #1055#1072#1087#1082#1072' '#1076#1083#1103' '#1087#1080#1089#1077#1084' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      DisplayWidth = 30
      FieldName = 'FOLDER_NAME'
      Size = 255
    end
  end
  object DSClients_1: TDataSource
    DataSet = QClients_1
    Left = 460
    Top = 140
  end
  object ADODSGrTov: TADODataSet
    Connection = ADOConnection1
    CommandText = 
      'select ID_GRTOV, GRUPTOV, SEQUENTIAL, IS_DELETE from GRTOV where' +
      ' IS_DELETE=:isdelete'#13#10'order by GRUPTOV'
    IndexFieldNames = 'GRUPTOV'
    Parameters = <
      item
        Name = 'isdelete'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 204
    Top = 238
    object ADODSGrTovID_GRTOV: TAutoIncField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID_GRTOV'
      ReadOnly = True
    end
    object ADODSGrTovGRUPTOV: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object ADODSGrTovSEQUENTIAL: TIntegerField
      DisplayLabel = #8470' '#1087#1086#1089#1083#1077#1076#1086#1074'. '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
      FieldName = 'SEQUENTIAL'
    end
    object ADODSGrTovIS_DELETE: TIntegerField
      FieldName = 'IS_DELETE'
      Visible = False
    end
  end
  object DSGrTov: TDataSource
    DataSet = ADODSGrTov
    Left = 254
    Top = 240
  end
  object QTovList: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'IDG_FROM'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'IDG_TO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select T.ID_TOV, T."NAME", T.EDIZM, T.GOST, T.SROKREAL, T.CODE, ' +
        'T.ID_GRTOV,'
      
        ' GR.GRUPTOV, T.ID_VID, VP.VID, T.FLAG_SOCIAL, T.MAX_PRICE, T.IS_' +
        'USE,'
      
        ' T.COMPARE_PRICE, T.PART, AVAILABILITY, NOVELTY, RECOMMENDED, ID' +
        '_KATEGOR_CLI, BASETOV'
      'from TOV T '
      'left outer join GRTOV GR'
      ' on GR.ID_GRTOV=T.ID_GRTOV '
      'left outer join VID_PRODUCT VP on VP.ID_VID=T.ID_VID '
      'where T.ID_GRTOV>=:IDG_FROM'
      ' and T.ID_GRTOV<=:IDG_TO'
      ' and T.IS_DELETE=0'
      'order by T."NAME"')
    Left = 340
    Top = 246
    object QTovListID_TOV: TAutoIncField
      FieldName = 'ID_TOV'
      ReadOnly = True
      Visible = False
    end
    object QTovListGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 30
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object QTovListNAME: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 255
    end
    object QTovListEDIZM: TWideStringField
      DisplayLabel = #1048#1079#1084
      FieldName = 'EDIZM'
      Size = 5
    end
    object QTovListGOST: TWideStringField
      DisplayLabel = #1058#1059
      DisplayWidth = 30
      FieldName = 'GOST'
      Size = 50
    end
    object QTovListSROKREAL: TWideStringField
      DisplayLabel = #1057#1088#1086#1082' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
      DisplayWidth = 30
      FieldName = 'SROKREAL'
      Size = 50
    end
    object QTovListCODE: TWideStringField
      FieldName = 'CODE'
      Visible = False
    end
    object QTovListID_GRTOV: TIntegerField
      FieldName = 'ID_GRTOV'
      Visible = False
    end
    object QTovListID_VID: TIntegerField
      FieldName = 'ID_VID'
      Visible = False
    end
    object QTovListVID: TWideStringField
      FieldName = 'VID'
      Visible = False
      Size = 50
    end
    object QTovListFLAG_SOCIAL: TIntegerField
      FieldName = 'FLAG_SOCIAL'
      Visible = False
    end
    object QTovListMAX_PRICE: TFloatField
      FieldName = 'MAX_PRICE'
      Visible = False
    end
    object QTovListIS_USE: TIntegerField
      FieldName = 'IS_USE'
      Visible = False
    end
    object QTovListCOMPARE_PRICE: TWideStringField
      FieldName = 'COMPARE_PRICE'
      Visible = False
      Size = 2
    end
    object QTovListPART: TWideStringField
      FieldName = 'PART'
      Visible = False
      Size = 30
    end
    object QTovListAVAILABILITY: TIntegerField
      FieldName = 'AVAILABILITY'
      Visible = False
    end
    object QTovListNOVELTY: TIntegerField
      FieldName = 'NOVELTY'
      Visible = False
    end
    object QTovListRECOMMENDED: TIntegerField
      FieldName = 'RECOMMENDED'
      Visible = False
    end
    object QTovListID_KATEGOR_CLI: TIntegerField
      FieldName = 'ID_KATEGOR_CLI'
      Visible = False
    end
    object QTovListBASETOV: TIntegerField
      FieldName = 'BASETOV'
      Visible = False
    end
  end
  object DSQTovList: TDataSource
    DataSet = QTovList
    Left = 370
    Top = 244
  end
  object Q_Get_ID_CLI_For_Email: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'EMAIL'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'select CLP.[ID_CLIENTS], CLP.[CLIENT] from [dbo].[CLIENTS] CL'
      'inner join [dbo].[CLIENTS] CLP on CLP.ID_CLIENTS=CL.ID_PARENT'
      'where CL.[EMAIL]=:EMAIL'
      ''
      '')
    Left = 64
    Top = 232
  end
  object SP_SAVE_NAKL: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'SAVE_NAKL;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_NAKLCAP'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_DOC_TYPE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@D'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@NN'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@ID_CLIENT'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@CHEREZ'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@DOVER'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@OSNOV'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@UDOST'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@FORMOPL'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@TRANSP'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@TARA'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@PLUS'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@MINUS'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@ZATRNAME'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@ZATR'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@PRICE_KATEG'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IS_PRICE_WITHOUT_NDS'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_USER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_SUPPLYER'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@TOT_SUM'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@TOT_NUM'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@NUM_TARA'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@ID_TARA'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CLI_K'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@SCH_D'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@SCH_K'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@NDS'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@STAVKA_NDS'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@IS_DELETE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_LINK_DOC_NEW'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PER_NACENKA'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@ER_COMMENT'
        Attributes = [paNullable]
        DataType = ftWideString
        Direction = pdInputOutput
        Size = 255
        Value = Null
      end
      item
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_NC_NEW'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 208
    Top = 320
  end
end
