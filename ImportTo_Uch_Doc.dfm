object F_ImportTo_Uch_Doc: TF_ImportTo_Uch_Doc
  Left = 0
  Top = 0
  Caption = 'F_ImportTo_Uch_Doc'
  ClientHeight = 482
  ClientWidth = 913
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 913
    Height = 265
    Align = alTop
    TabOrder = 0
    object Label5: TLabel
      Left = 552
      Top = 244
      Width = 65
      Height = 13
      Caption = #1042#1089#1077#1075#1086' '#1082#1086#1083'-'#1082#1086
    end
    object L_Doc_NN_DD: TLabel
      Left = 19
      Top = 46
      Width = 117
      Height = 13
      Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'  '#1086#1090' '#1076#1072#1090#1072
    end
    object Label12: TLabel
      Left = 408
      Top = 48
      Width = 42
      Height = 13
      Caption = #8470' '#1091' '#1085#1072#1089
    end
    object Label13: TLabel
      Left = 560
      Top = 48
      Width = 55
      Height = 13
      Caption = #1044#1072#1090#1072' '#1091' '#1085#1072#1089
    end
    object BB_ImportTov: TBitBtn
      Left = 701
      Top = 210
      Width = 81
      Height = 25
      Caption = #1048#1084#1087#1086#1088#1090
      TabOrder = 0
      OnClick = BB_ImportTovClick
    end
    object BB_PrepTov: TBitBtn
      Left = 300
      Top = 10
      Width = 118
      Height = 25
      Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1080#1090#1100' '#1090#1086#1074#1072#1088#1099
      TabOrder = 1
      OnClick = BB_PrepTovClick
    end
    object DBNavigator4: TDBNavigator
      Left = 19
      Top = 11
      Width = 116
      Height = 25
      DataSource = DS_Q_IMPORT_NAKLTOV_TMP
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 18
      Top = 71
      Width = 318
      Height = 164
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082' '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1077
      TabOrder = 3
      object Label1: TLabel
        Left = 16
        Top = 26
        Width = 76
        Height = 13
        Caption = #1050#1086#1076' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
      end
      object Label2: TLabel
        Left = 16
        Top = 53
        Width = 69
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085' '#1080#1089#1090#1086#1095
      end
      object Label3: TLabel
        Left = 16
        Top = 80
        Width = 43
        Height = 13
        Caption = #1050#1086#1076' '#1085#1072#1096
      end
      object Label4: TLabel
        Left = 16
        Top = 107
        Width = 66
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085' '#1085#1072#1096#1077
      end
      object Label10: TLabel
        Left = 16
        Top = 132
        Width = 54
        Height = 13
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      end
      object E_ID_CLI_K_Source: TEdit
        Left = 105
        Top = 22
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'E_ID_CLI_K_Source'
      end
      object E_CLI_K_Dest: TEdit
        Left = 105
        Top = 103
        Width = 202
        Height = 21
        TabOrder = 1
        Text = 'E_CLI_K_Dest'
      end
      object E_ID_CLI_K_Dest: TEdit
        Left = 105
        Top = 76
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'E_ID_CLI_K_Dest'
      end
      object E_CLI_K_Source: TEdit
        Left = 105
        Top = 49
        Width = 202
        Height = 21
        TabOrder = 3
        Text = 'E_CLI_K_Source'
      end
      object BBSel_K: TBitBtn
        Left = 281
        Top = 76
        Width = 25
        Height = 25
        Hint = #1042#1099#1073#1086#1088' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
          000557777777777777750BBBBBBBBBBBBBB07F5555FFFFFFF5570BBBB0000000
          BBB07F5557777777FF570BBB077BBB770BB07F557755555775570BBBBBBBBBBB
          BBB07F5555FFFFFFF5570BBBB0000000BBB07F5557777777F5570BBBB0FFFFF0
          BBB07F5557FFFFF7F5570BBBB0000000BBB07F555777777755570BBBBBBBBBBB
          BBB07FFFFFFFFFFFFFF700000000000000007777777777777777500FFFFFFFFF
          F005577FF555FFFFF7755500FFF00000005555775FF7777777F5550F777FFFFF
          F055557F777FFF5557F5550000000FFF00555577777775FF77F5550777777000
          7055557FFFFFF777F7F555000000000000555577777777777755}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = BBSel_KClick
      end
      object E_Kateg_K_Dest: TEdit
        Left = 105
        Top = 130
        Width = 202
        Height = 21
        TabOrder = 5
        Text = 'E_Kateg_K_Dest'
      end
    end
    object GroupBox2: TGroupBox
      Left = 368
      Top = 71
      Width = 320
      Height = 164
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1077
      TabOrder = 4
      object Label6: TLabel
        Left = 16
        Top = 26
        Width = 76
        Height = 13
        Caption = #1050#1086#1076' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
      end
      object Label7: TLabel
        Left = 16
        Top = 53
        Width = 69
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085' '#1080#1089#1090#1086#1095
      end
      object Label8: TLabel
        Left = 16
        Top = 80
        Width = 43
        Height = 13
        Caption = #1050#1086#1076' '#1085#1072#1096
      end
      object Label9: TLabel
        Left = 16
        Top = 107
        Width = 66
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085' '#1085#1072#1096#1077
      end
      object Label11: TLabel
        Left = 16
        Top = 132
        Width = 54
        Height = 13
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      end
      object E_ID_CLI_D_Source: TEdit
        Left = 105
        Top = 22
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'E_ID_CLI_D_Source'
      end
      object E_CLI_D_Dest: TEdit
        Left = 105
        Top = 103
        Width = 202
        Height = 21
        TabOrder = 1
        Text = 'E_CLI_D_Dest'
      end
      object E_ID_CLI_D_Dest: TEdit
        Left = 105
        Top = 76
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'E_ID_CLI_D_Dest'
      end
      object E_CLI_D_Source: TEdit
        Left = 105
        Top = 49
        Width = 202
        Height = 21
        TabOrder = 3
        Text = 'E_CLI_D_Source'
      end
      object BBSel_D: TBitBtn
        Left = 282
        Top = 72
        Width = 26
        Height = 25
        Hint = #1042#1099#1073#1086#1088' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
          000557777777777777750BBBBBBBBBBBBBB07F5555FFFFFFF5570BBBB0000000
          BBB07F5557777777FF570BBB077BBB770BB07F557755555775570BBBBBBBBBBB
          BBB07F5555FFFFFFF5570BBBB0000000BBB07F5557777777F5570BBBB0FFFFF0
          BBB07F5557FFFFF7F5570BBBB0000000BBB07F555777777755570BBBBBBBBBBB
          BBB07FFFFFFFFFFFFFF700000000000000007777777777777777500FFFFFFFFF
          F005577FF555FFFFF7755500FFF00000005555775FF7777777F5550F777FFFFF
          F055557F777FFF5557F5550000000FFF00555577777775FF77F5550777777000
          7055557FFFFFF777F7F555000000000000555577777777777755}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = BBSel_DClick
      end
      object E_Kateg_D_Dest: TEdit
        Left = 105
        Top = 130
        Width = 202
        Height = 21
        TabOrder = 5
        Text = 'E_Kateg_D_Dest'
      end
    end
    object BBSetting: TBitBtn
      Left = 663
      Top = 10
      Width = 25
      Height = 25
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
        1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
        1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
        193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
        11155557F755F777777555000755033305555577755F75F77F55555555503335
        0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
        05555757F75F75557F5505000333555505557F777FF755557F55000000355557
        07557777777F55557F5555000005555707555577777FF5557F55553000075557
        0755557F7777FFF5755555335000005555555577577777555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BBSettingClick
    end
    object BitBtn1: TBitBtn
      Left = 560
      Top = 10
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 6
    end
    object BB_PrepCap: TBitBtn
      Left = 142
      Top = 10
      Width = 130
      Height = 25
      Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1080#1090#1100' '#1096#1072#1087#1082#1091
      TabOrder = 7
      OnClick = BB_PrepCapClick
    end
    object BBReCalcPrice: TBitBtn
      Left = 694
      Top = 85
      Width = 211
      Height = 25
      Hint = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1094#1077#1085#1099' '#1089#1086#1075#1083#1072#1089#1085#1086' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
      Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100' '#1094#1077#1085#1099' '#1087#1086' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = BBReCalcPriceClick
    end
    object E_NN: TEdit
      Left = 456
      Top = 44
      Width = 89
      Height = 21
      TabOrder = 9
      OnChange = E_NNChange
    end
    object DTP_NAKL: TDateTimePicker
      Left = 621
      Top = 44
      Width = 100
      Height = 21
      Date = 44500.000011574080000000
      Time = 44500.000011574080000000
      TabOrder = 10
      OnChange = DTP_NAKLChange
    end
    object BB_UpdateNameTov: TBitBtn
      Left = 694
      Top = 118
      Width = 211
      Height = 25
      Hint = 
        #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072' '#1090#1077#1082#1091#1097#1077#1081' '#1089#1090#1088#1086#1082#1080' '#1074' '#1085#1072#1096#1077#1084' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077' '#1087#1088#1080#1074#1077#1089#1090#1080' ' +
        #1074' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102' '#1090#1086#1074#1072#1088#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072' (ALT - '#1076#1083#1103' '#1074#1089#1077#1093' '#1090#1086 +
        #1074#1072#1088#1086#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1072')'
      Caption = #1055#1088#1080#1074#1077#1089#1090#1080' '#1074' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1085#1072#1079#1074#1072#1085#1080#1103
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = BB_UpdateNameTovClick
      OnMouseDown = BB_UpdateNameTovMouseDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 265
    Width = 913
    Height = 217
    Align = alClient
    TabOrder = 1
    object DBGrid4: TDBGrid
      Left = 1
      Top = 1
      Width = 911
      Height = 215
      Align = alClient
      DataSource = DS_Q_IMPORT_NAKLTOV_TMP
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid4CellClick
      OnDrawColumnCell = DBGrid4DrawColumnCell
      OnEditButtonClick = DBGrid4EditButtonClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ID_TOV_SOURCE'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GRTOV_SOURCE'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME_TOV_SOURCE'
          ReadOnly = True
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'NAME_TOV_DEST'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMB'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRICE'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRICE1'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_GRTOV_SOURCE'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PART_SOURCE'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_TOV_DEST'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_GRTOV_DEST'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'GRTOV_DEST'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PART_DEST'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_USER'
          ReadOnly = True
          Visible = False
        end>
    end
  end
  object Q_IMPORT_NAKLTOV_TMP: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_USER'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_VENDOR'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'D'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @ID_USER int'
      'set @ID_USER=:ID_USER'
      'declare @ID_VENDOR int'
      'set @ID_VENDOR=:ID_VENDOR'
      'declare @D datetime'
      'SET @D=:D'
      ''
      ''
      
        'select I.[ID], I.[ID_TOV_SOURCE], I.[NAME_TOV_SOURCE],  I.[ID_GR' +
        'TOV_SOURCE],  I.[GRTOV_SOURCE],'
      
        ' I.[PART_SOURCE], I.[ID_TOV_DEST], I.[NAME_TOV_DEST], I.[ID_GRTO' +
        'V_DEST], I.[GRTOV_DEST], I.[PART_DEST],'
      ' I.[NUMB], I.[PRICE], I.[ID_USER],'
      ' ('
      'select TOP 1 PRICE_DATE.PRICE1'
      'from PRICE_DATE'
      'where PRICE_DATE.D_START<=@D'
      'and PRICE_DATE.ID_TOV=I.[ID_TOV_DEST]'
      'and PRICE_DATE.IS_DELETE=0'
      'and PRICE_DATE.ID_CLI=@ID_VENDOR'
      'ORDER BY PRICE_DATE.D_START DESC'
      ') PRICE1,'
      ' I.[EDIZM_SOURCE],'
      ' I.[EDIZM_DEST]'
      ' from IMPORT_NAKLTOV_TMP I'
      ' where I.[ID_USER]=@ID_USER'
      ' order by  I.[GRTOV_SOURCE], I.[NAME_TOV_SOURCE]')
    Left = 229
    Top = 144
    object Q_IMPORT_NAKLTOV_TMPID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object Q_IMPORT_NAKLTOV_TMPNAME_TOV_SOURCE: TWideStringField
      DisplayLabel = #1058#1086#1074#1072#1088'-'#1080#1089#1090#1086#1095#1085#1080#1082
      DisplayWidth = 30
      FieldName = 'NAME_TOV_SOURCE'
      Size = 255
    end
    object Q_IMPORT_NAKLTOV_TMPEDIZM_SOURCE: TWideStringField
      DisplayLabel = #1080#1079#1084'-'#1080#1089#1090
      FieldName = 'EDIZM_SOURCE'
      Size = 5
    end
    object Q_IMPORT_NAKLTOV_TMPNAME_TOV_DEST: TWideStringField
      DisplayLabel = #1058#1086#1074#1072#1088'-'#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      DisplayWidth = 30
      FieldName = 'NAME_TOV_DEST'
      Size = 255
    end
    object Q_IMPORT_NAKLTOV_TMPEDIZM_DEST: TWideStringField
      DisplayLabel = #1080#1079#1084'-'#1085#1072#1079#1085
      FieldName = 'EDIZM_DEST'
      Size = 5
    end
    object Q_IMPORT_NAKLTOV_TMPNUMB: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      DisplayWidth = 10
      FieldName = 'NUMB'
      DisplayFormat = '0.000'
    end
    object Q_IMPORT_NAKLTOV_TMPPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      DisplayFormat = '0.000'
    end
    object Q_IMPORT_NAKLTOV_TMPPRICE1: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1086' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
      FieldName = 'PRICE1'
      ReadOnly = True
    end
    object Q_IMPORT_NAKLTOV_TMPGRTOV_SOURCE: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072'-'#1080#1089#1090#1086#1095#1085#1080#1082
      DisplayWidth = 15
      FieldName = 'GRTOV_SOURCE'
      Size = 50
    end
    object Q_IMPORT_NAKLTOV_TMPPART_SOURCE: TWideStringField
      DisplayLabel = #1040#1088#1090'.-'#1080#1089#1090
      DisplayWidth = 10
      FieldName = 'PART_SOURCE'
      Size = 30
    end
    object Q_IMPORT_NAKLTOV_TMPGRTOV_DEST: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072'-'#1085#1072#1079#1085#1072#1095'.'
      DisplayWidth = 15
      FieldName = 'GRTOV_DEST'
      Size = 50
    end
    object Q_IMPORT_NAKLTOV_TMPPART_DEST: TWideStringField
      DisplayLabel = #1040#1088#1090'.'#1085#1072#1079#1085
      DisplayWidth = 10
      FieldName = 'PART_DEST'
      Size = 30
    end
    object Q_IMPORT_NAKLTOV_TMPID_USER: TIntegerField
      FieldName = 'ID_USER'
      Visible = False
    end
    object Q_IMPORT_NAKLTOV_TMPID_GRTOV_SOURCE: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1075#1088#1091#1087#1087#1099' '#1080#1089#1090#1086#1095
      FieldName = 'ID_GRTOV_SOURCE'
      Visible = False
    end
    object Q_IMPORT_NAKLTOV_TMPID_TOV_SOURCE: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072' '#1080#1089#1090#1086#1095
      FieldName = 'ID_TOV_SOURCE'
    end
    object Q_IMPORT_NAKLTOV_TMPID_GRTOV_DEST: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1075#1088#1091#1087#1087#1099' '#1085#1072#1079#1085#1072#1095
      FieldName = 'ID_GRTOV_DEST'
      Visible = False
    end
    object Q_IMPORT_NAKLTOV_TMPID_TOV_DEST: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072' '#1085#1072#1079#1085#1072#1095
      FieldName = 'ID_TOV_DEST'
    end
  end
  object DS_Q_IMPORT_NAKLTOV_TMP: TDataSource
    DataSet = Q_IMPORT_NAKLTOV_TMP
    Left = 309
    Top = 160
  end
  object QCountTov: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_USER'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select sum(NUMB) S_NUMB from IMPORT_NAKLTOV_TMP'
      'where ID_USER=:ID_USER')
    Left = 540
    Top = 157
  end
  object SP_ADD_HOOKUP_CLI: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'ADD_HOOKUP_CLI;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CLI_SOURSE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CLI_DEST'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CLI'
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
    Left = 325
    Top = 280
  end
  object SP_ADD_LIST_TOV_IMPORT: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'ADD_LIST_TOV_IMPORT;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@XML_SOURCE_TOV'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 1073741823
        Value = Null
      end
      item
        Name = '@ID_CLI'
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
        Name = '@ER'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 429
    Top = 272
  end
  object QGetCli_Dest: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_Vendor'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ID_CLI_Source'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select H.[ID_CLI_OURS] ID_CLI_DEST , CL.CLIENT CLI_DEST, K.KATEG' +
        'OR KATEG_DEST'
      'from [dbo].[HOOKUP_CLI] H'
      'inner join [dbo].[CLIENTS] CL on CL.ID_CLIENTS=H.ID_CLI_OURS'
      'inner join [dbo].[KATEG_CLI] K on K.ID_KATEGOR=CL.ID_KATEGOR'
      'where [ID_CLI]=:ID_Vendor and [ID_CLI_CLI]=:ID_CLI_Source')
    Left = 600
    Top = 288
  end
  object SP_EDIT_LIST_TOV_IMPORT: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'EDIT_LIST_TOV_IMPORT;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
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
        Name = '@ID_LIST_TOV'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_TOV_DEST'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NAME_TOV_DEST'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = '@EDIZM_DEST'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 5
        Value = Null
      end
      item
        Name = '@ID_GRTOV_DEST'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@GRTOV_DEST'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
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
    Left = 133
    Top = 272
  end
  object SP_ADD_HOOKUP_TOV: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'ADD_HOOKUP_TOV;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_TOV_SOURSE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_TOV_DEST'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_CLI'
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
    Left = 237
    Top = 328
  end
  object SP_CREATE_DOC_FROM_IMPORT: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'CREATE_DOC_FROM_IMPORT;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
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
        Name = '@ID_CLI_D'
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
        Name = '@ID_NC_NEW'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
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
    Left = 717
    Top = 280
  end
  object ADOCommand_SetPrice_from_Specification: TADOCommand
    CommandText = 
      '--use NMK_EP'#13#10#13#10'declare @ID_USER int'#13#10'set @ID_USER=:ID_USER'#13#10'dec' +
      'lare @ID_VENDOR int'#13#10'set @ID_VENDOR=:ID_VENDOR'#13#10'declare @D datet' +
      'ime'#13#10'SET @D=:D'#13#10#13#10'update I set I.[PRICE]=isnull(('#13#10'select TOP 1 ' +
      'PRICE_DATE.PRICE1'#13#10'from PRICE_DATE'#13#10'where PRICE_DATE.D_START<=@D' +
      #13#10'and PRICE_DATE.ID_TOV=I.[ID_TOV_DEST]'#13#10'and PRICE_DATE.IS_DELET' +
      'E=0'#13#10'and PRICE_DATE.ID_CLI=@ID_VENDOR'#13#10'ORDER BY PRICE_DATE.D_STA' +
      'RT DESC'#13#10'),0.0)  from IMPORT_NAKLTOV_TMP I'#13#10' where I.[ID_USER]=@' +
      'ID_USER'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_USER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_VENDOR'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'D'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    Left = 472
    Top = 377
  end
  object ADOCommandUpdateOrder: TADOCommand
    CommandText = 
      '--use NMK_EP'#13#10'declare @D DateTime, @D_FROM datetime, @D_TO datet' +
      'ime, @ID_DOC_TYPE int, @ID_CLI_D int, @ID_CLI_K int, @ID_LINK_DO' +
      'C int'#13#10'set @D=:D'#13#10'set @ID_DOC_TYPE=:ID_DOC_TYPE'#13#10'set @ID_CLI_D=:' +
      'ID_CLI_D'#13#10'set @ID_CLI_K=:ID_CLI_K'#13#10'set @ID_LINK_DOC=:ID_LINK_DOC' +
      #13#10#13#10'set @D_FROM=CAST(@D AS DATE)'#13#10'set @D_TO=DATEADD(SECOND,-1,DA' +
      'TEADD(DAY,1,@D_FROM))'#13#10#13#10'update NC set NC.NALOG_NAKL=2,'#13#10'NC.ID_L' +
      'INK_DOC=@ID_LINK_DOC'#13#10'from NAKLCAP NC'#13#10'where  NC.ID_DOC_TYPE=@ID' +
      '_DOC_TYPE'#13#10'and NC.D>=@D_FROM'#13#10'and NC.D<=@D_TO'#13#10'and NC.IS_DELETE=' +
      '0'#13#10'and NC.ID_CLIENT=@ID_CLI_D'#13#10'and NC.ID_CLI_K=@ID_CLI_K'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'D'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_DOC_TYPE'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_CLI_D'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_CLI_K'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_LINK_DOC'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 696
    Top = 385
  end
  object ADOCommandUpdateNameTov: TADOCommand
    CommandText = 
      '--use NMK_EP'#13#10#13#10'declare @ID_USER int'#13#10'set @ID_USER=:ID_USER'#13#10#13#10' ' +
      'update T set T.NAME=LTRIM(RTRIM(IM.NAME_TOV_SOURCE)) '#13#10' from TOV' +
      ' T'#13#10' inner join IMPORT_NAKLTOV_TMP IM on IM.ID_TOV_DEST=T.ID_TOV' +
      ' '#13#10' where IM.ID_USER=@ID_USER'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID_USER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 800
    Top = 161
  end
  object ADOCommandUpdateNameTov_1: TADOCommand
    CommandText = 
      '--use NMK_EP'#13#10#13#10'declare @ID int'#13#10'set @ID=:ID'#13#10#13#10#13#10' update T set ' +
      'T.NAME=LTRIM(RTRIM(IM.NAME_TOV_SOURCE)) '#13#10' from TOV T'#13#10' inner jo' +
      'in IMPORT_NAKLTOV_TMP IM on IM.ID_TOV_DEST=T.ID_TOV '#13#10' where IM.' +
      'ID=@ID'
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ID'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 696
    Top = 153
  end
end
