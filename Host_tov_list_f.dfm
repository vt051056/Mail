object FHost_Tov_list: TFHost_Tov_list
  Left = 255
  Top = 116
  Caption = #1057#1087#1080#1089#1086#1082' '#1090#1086#1074#1072#1088#1086#1074' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
  ClientHeight = 621
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 97
    Align = alTop
    TabOrder = 0
    object LGrup: TLabel
      Left = 8
      Top = 4
      Width = 42
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 53
      Width = 101
      Height = 13
      Caption = #1044#1072#1090#1072' '#1072#1089#1089#1086#1088#1090#1080#1084#1077#1085#1090#1072
    end
    object Label2: TLabel
      Left = 127
      Top = 53
      Width = 58
      Height = 13
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    end
    object L_Kateg_Cli: TLabel
      Left = 202
      Top = 53
      Width = 53
      Height = 13
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
    end
    object DBNavigator1: TDBNavigator
      Left = 5
      Top = 22
      Width = 184
      Height = 25
      DataSource = DS_QHostPrice
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 288
      Top = 8
      Width = 233
      Height = 39
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 1
      object Edit1: TEdit
        Left = 8
        Top = 14
        Width = 79
        Height = 21
        TabOrder = 0
        OnChange = Edit1Change
      end
      object BBSearchDown: TBitBtn
        Left = 98
        Top = 10
        Width = 25
        Height = 25
        Hint = #1055#1086#1080#1089#1082' '#1074#1085#1080#1079
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
          33333333373F33333333333330B03333333333337F7F33333333333330F03333
          333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
          333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
          333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
          3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
          33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
          33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
          03333337777777F7F33333330000000003333337777777773333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BBSearchDownClick
      end
      object BBSearchUp: TBitBtn
        Left = 128
        Top = 10
        Width = 25
        Height = 25
        Hint = #1055#1086#1080#1089#1082' '#1074#1074#1077#1088#1093
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          333333777777777F33333330B00000003333337F7777777F3333333000000000
          333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
          333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
          03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
          03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
          3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
          333333333377F7F33333333333330F03333333333337F7F33333333333330B03
          3333333333373733333333333333303333333333333373333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BBSearchUpClick
      end
      object CheckBox1: TCheckBox
        Left = 158
        Top = 14
        Width = 67
        Height = 17
        Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1085#1090#1077#1082#1089#1090#1091
        Caption = #1082#1086#1085#1090#1077#1082#1089#1090
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = CheckBox1Click
      end
    end
    object BBGrTovSel: TBitBtn
      Left = 230
      Top = 22
      Width = 25
      Height = 25
      Hint = #1042#1099#1073#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1090#1086#1074#1072#1088#1086#1074
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
        00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
        00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
        03FF33337FFF77777333333300000333333F3333777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BBGrTovSelClick
    end
    object BBAllGrTovSel: TBitBtn
      Left = 260
      Top = 22
      Width = 25
      Height = 25
      Hint = #1042#1099#1073#1086#1088' '#1074#1089#1077#1093' '#1075#1088#1091#1087#1087' '#1090#1086#1074#1072#1088#1086#1074
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
        000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
        99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
        0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
        FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
        0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
        000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
        00FF33337FFF7FF77733333300000000033F3333777777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BBAllGrTovSelClick
    end
    object BBRefresh: TBitBtn
      Left = 198
      Top = 22
      Width = 25
      Height = 25
      Hint = #1054#1089#1074#1077#1078#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BBRefreshClick
    end
    object DTP_Price: TDateTimePicker
      Left = 8
      Top = 70
      Width = 113
      Height = 21
      Date = 43229.999988425920000000
      Time = 43229.999988425920000000
      TabOrder = 5
    end
    object E_Cli_HostPrice: TEdit
      Left = 127
      Top = 68
      Width = 361
      Height = 21
      ReadOnly = True
      TabOrder = 6
      Text = 'E_Cli_HostPrice'
    end
    object BBSel_Client: TBitBtn
      Left = 494
      Top = 66
      Width = 27
      Height = 25
      Hint = #1042#1099#1073#1086#1088' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103' - Ctrl-F1'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
        BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
        BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
        BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
        BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
        EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
        EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
        EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
        EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BBSel_ClientClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 536
    Height = 489
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 534
      Height = 487
      Align = alClient
      DataSource = DS_QHostPrice
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 586
    Width = 536
    Height = 35
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 28
      Top = 5
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1086#1088
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 122
      Top = 4
      Width = 75
      Height = 25
      Caption = #1057#1073#1088#1086#1089
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object QHostPrice: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_CLI_HOST'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'isdel'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_GRTOV'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @D datetime'
      'set @D=:D;'
      ''
      'declare @ID_CLI int'
      'set @ID_CLI=:ID_CLI_HOST'
      ''
      'declare @isdel int'
      'set @isdel=:isdel'
      ''
      ''
      'declare @ID_GRTOV INT'
      'set @ID_GRTOV=:ID_GRTOV'
      ''
      
        'create table #price_tmp (ID_TOV int, ID_GRTOV INT, GRUPTOV nvarc' +
        'har(255), TOV_NAME nvarchar(255),'
      'EDIZM nvarchar(10),'
      
        'P1 float, P2 float, P3 float, P4 float, D_START datetime, ID_CLI' +
        ' int, ID_PRICE_DATE int,'
      'AVAILABILITY int, NOVELTY int, RECOMMENDED int, IS_USE int)'
      ''
      ''
      'declare @ID_TOV int'
      ''
      'DECLARE price_cursor CURSOR  '
      'FOR'
      #9'select PD.ID_TOV from PRICE_DATE PD'
      #9'where'
      #9#9'PD.D_START<=@D'
      #9#9'and PD.ID_CLI=@ID_CLI'
      #9'GROUP BY PD.ID_TOV'
      '     '
      'OPEN price_cursor '
      ''
      'FETCH NEXT FROM price_cursor INTO  @ID_TOV'
      'WHILE (@@FETCH_STATUS = 0) '
      'BEGIN'
      ''
      ''
      'insert #price_tmp'
      
        'select TOP 1 PD.ID_TOV, TOV.ID_GRTOV, GRTOV.GRUPTOV, TOV.NAME, T' +
        'OV.EDIZM,'
      'isnull(PD.PRICE1, 0.0) P1,'
      'isnull(PD.PRICE2, 0.0) P2,'
      'isnull(PD.PRICE3, 0.0) P3,'
      'isnull(PD.PRICE4, 0.0) P4,'
      'PD.D_START, PD.ID_CLI, PD.ID_PRICE_DATE,'
      'TOV.AVAILABILITY, TOV.NOVELTY, TOV.RECOMMENDED, TOV.IS_USE'
      '  from PRICE_DATE PD'
      '  inner join TOV on TOV.ID_TOV= PD.ID_TOV'
      '  inner join GRTOV on GRTOV.ID_GRTOV=TOV.ID_GRTOV'
      '  inner join CLIENTS CL on CL.ID_CLIENTS=PD.ID_CLI'
      '  where'
      '  PD.D_START<=@D'
      '  and PD.IS_DELETE=@isdel'
      '  and PD.ID_CLI=@ID_CLI'
      '  and PD.ID_TOV=@ID_TOV'
      '  ORDER BY PD.D_START DESC'
      ''
      ''
      ''
      ''
      #9'FETCH NEXT FROM price_cursor INTO  @ID_TOV'
      'END '
      'CLOSE price_cursor'
      'DEALLOCATE price_cursor'
      ''
      ''
      'if @ID_GRTOV=-1'
      'begin'
      'select ID_TOV, ID_GRTOV, GRUPTOV, TOV_NAME, EDIZM,'
      'P1, P2, P3, P4, D_START, ID_CLI, ID_PRICE_DATE,'
      'AVAILABILITY, NOVELTY, RECOMMENDED, IS_USE from #price_tmp'
      'order by  GRUPTOV, TOV_NAME'
      'end'
      'else'
      'begin'
      'select ID_TOV, ID_GRTOV, GRUPTOV, TOV_NAME, EDIZM,'
      'P1, P2, P3, P4, D_START, ID_CLI, ID_PRICE_DATE,'
      'AVAILABILITY, NOVELTY, RECOMMENDED, IS_USE from #price_tmp'
      'where ID_GRTOV=@ID_GRTOV'
      'order by  GRUPTOV, TOV_NAME'
      'end;'
      ''
      'drop table #price_tmp '
      '')
    Left = 232
    Top = 129
    object QHostPriceGRUPTOV: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 15
      FieldName = 'GRUPTOV'
      Size = 50
    end
    object QHostPriceNAME: TWideStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 50
      FieldName = 'TOV_NAME'
      Size = 255
    end
    object QHostPriceEDIZM: TWideStringField
      DisplayLabel = #1048#1079#1084
      DisplayWidth = 5
      FieldName = 'EDIZM'
      Size = 10
    end
    object QHostPriceP1: TFloatField
      DisplayLabel = #1062#1077#1085#1072' 1'
      DisplayWidth = 8
      FieldName = 'P1'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QHostPriceP2: TFloatField
      DisplayLabel = #1062#1077#1085#1072' 2'
      DisplayWidth = 8
      FieldName = 'P2'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QHostPriceP3: TFloatField
      DisplayLabel = #1062#1077#1085#1072' 3'
      DisplayWidth = 8
      FieldName = 'P3'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QHostPriceP4: TFloatField
      DisplayLabel = #1062#1077#1085#1072' 4'
      DisplayWidth = 8
      FieldName = 'P4'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object QHostPriceD_START: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1090#1072#1088#1090#1072
      DisplayWidth = 12
      FieldName = 'D_START'
    end
    object QHostPriceAVAILABILITY: TIntegerField
      DisplayLabel = #1042' '#1085#1072#1083#1080#1095#1080#1077
      DisplayWidth = 8
      FieldName = 'AVAILABILITY'
      Visible = False
    end
    object QHostPriceNOVELTY: TIntegerField
      DisplayLabel = #1053#1086#1074#1080#1085#1082#1072
      DisplayWidth = 8
      FieldName = 'NOVELTY'
      Visible = False
    end
    object QHostPriceRECOMMENDED: TIntegerField
      DisplayLabel = #1056#1077#1082#1086#1084#1077#1085#1076#1091#1077#1084#1099#1081
      DisplayWidth = 8
      FieldName = 'RECOMMENDED'
      Visible = False
    end
    object QHostPriceIS_USE: TIntegerField
      DisplayLabel = #1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103
      FieldName = 'IS_USE'
      Visible = False
    end
    object QHostPriceAV_TXT: TStringField
      DisplayLabel = #1053#1072#1083#1080#1095#1080#1077
      FieldKind = fkLookup
      FieldName = 'AV_TXT'
      LookupDataSet = Tb_AVAILABILITY_TXT
      LookupKeyFields = 'ID_AVAILABILITY'
      LookupResultField = 'AV_TXT'
      KeyFields = 'AVAILABILITY'
      Lookup = True
    end
    object QHostPriceNOV_TXT: TStringField
      DisplayLabel = #1053#1086#1074#1080#1085#1082#1072
      FieldKind = fkLookup
      FieldName = 'NOV_TXT'
      LookupDataSet = Tb_NOVELTY_TXT
      LookupKeyFields = 'ID_NOVELTY'
      LookupResultField = 'NOV_TXT'
      KeyFields = 'NOVELTY'
      Lookup = True
    end
    object QHostPriceRECOM_TXT: TStringField
      DisplayLabel = #1056#1077#1082#1086#1084#1077#1085#1076#1072#1094#1080#1103
      FieldKind = fkLookup
      FieldName = 'RECOM_TXT'
      LookupDataSet = Tb_RECOMMEND_TXT
      LookupKeyFields = 'ID_RECOMMEND'
      LookupResultField = 'RECOM_TXT'
      KeyFields = 'RECOMMENDED'
      Lookup = True
    end
    object QHostPriceID_PRICE_DATE: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1094#1077#1085#1099
      FieldName = 'ID_PRICE_DATE'
    end
    object QHostPriceID_CLI: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      FieldName = 'ID_CLI'
    end
    object QHostPriceID_TOV: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
      FieldName = 'ID_TOV'
    end
    object QHostPriceID_GRTOV: TIntegerField
      FieldName = 'ID_GRTOV'
      Visible = False
    end
  end
  object DS_QHostPrice: TDataSource
    DataSet = QHostPrice
    Left = 272
    Top = 129
  end
  object Tb_AVAILABILITY_TXT: TADOTable
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    TableName = 'AVAILABILITY_TXT'
    Left = 356
    Top = 140
  end
  object Tb_NOVELTY_TXT: TADOTable
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    TableName = 'NOVELTY_TXT'
    Left = 348
    Top = 204
  end
  object Tb_RECOMMEND_TXT: TADOTable
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    TableName = 'RECOMMEND_TXT'
    Left = 340
    Top = 266
  end
end
