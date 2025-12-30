object F_Import_Bank: TF_Import_Bank
  Left = 100
  Top = 117
  Caption = #1048#1084#1087#1086#1088#1090' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1080#1079' '#1089#1080#1089#1090#1077#1084#1099' '#1082#1083#1080#1077#1085#1090'-'#1073#1072#1085#1082
  ClientHeight = 501
  ClientWidth = 1168
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1168
    Height = 41
    Align = alTop
    TabOrder = 0
    object BB_BANK_Vypiska: TBitBtn
      Left = 617
      Top = 10
      Width = 191
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1073#1072#1085#1082#1086#1074#1089#1082#1086#1081' '#1074#1099#1087#1080#1089#1082#1080
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
      TabOrder = 0
      Visible = False
      OnClick = BB_BANK_VypiskaClick
    end
    object DBNavigator1: TDBNavigator
      Left = 859
      Top = 10
      Width = 224
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel]
      TabOrder = 1
    end
    object BBCreateDocs: TBitBtn
      Left = 297
      Top = 10
      Width = 179
      Height = 25
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1074' '#1091#1095#1077#1090
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = BBCreateDocsClick
    end
    object BBDeleteImportData: TBitBtn
      Left = 680
      Top = 10
      Width = 170
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080#1084#1087#1086#1088#1090#1072
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      TabOrder = 3
      OnClick = BBDeleteImportDataClick
    end
    object BBRefresh: TBitBtn
      Left = 1089
      Top = 10
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
    object BBDeleteImportRec: TBitBtn
      Left = 1127
      Top = 10
      Width = 27
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        300033FFFFFF3333377739999993333333333777777F3333333F399999933333
        3300377777733333337733333333333333003333333333333377333333333333
        3333333333333333333F333333333333330033333F33333333773333C3333333
        330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
        333333377F33333333FF3333C333333330003333733333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BBDeleteImportRecClick
    end
    object E_FileName: TEdit
      Left = 6
      Top = 12
      Width = 247
      Height = 21
      TabOrder = 6
    end
    object BBPath: TBitBtn
      Left = 262
      Top = 10
      Width = 29
      Height = 25
      Hint = #1055#1091#1090#1100' '#1080' '#1080#1084#1103' XML- '#1092#1072#1081#1083#1072' '#1074#1099#1087#1080#1089#1082#1080' '#1073#1072#1085#1082#1072' '
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
        333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
        300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
        333337F373F773333333303330033333333337F3377333333333303333333333
        333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
        333337777F337F33333330330BB00333333337F373F773333333303330033333
        333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
        333377777F77377733330BBB0333333333337F337F33333333330BB003333333
        333373F773333333333330033333333333333773333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BBPathClick
    end
    object BBSelectAll: TBitBtn
      Left = 500
      Top = 10
      Width = 87
      Height = 25
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      TabOrder = 8
      OnClick = BBSelectAllClick
    end
    object BB_NotImp: TBitBtn
      Left = 596
      Top = 10
      Width = 77
      Height = 25
      Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1082#1072#1082' '#1085#1077' '#1080#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1085#1085#1099#1077
      Caption = #1053#1077' '#1080#1084#1087#1086#1088#1090
      TabOrder = 9
      OnClick = BB_NotImpClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 1168
    Height = 460
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 1065
      Height = 458
      Align = alClient
      DataSource = DS_IMPORT_BANK_TMP
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnEditButtonClick = DBGrid1EditButtonClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_IMPORT_DOC'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DK'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ID_USER'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'deb_kred'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOT_SUM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMMENT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_DOC_TYPE'
          Visible = False
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'CLI_D_MY'
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'CLI_K_MY'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAMEDOC'
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'SCH_D_PROV'
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'SCH_K_PROV'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_SCH_D'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ID_SCH_K'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CLI_D'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OKPO_D'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RS_D'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_CLI_D'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CLI_K'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OKPO_K'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RS_K'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_CLI_K'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IS_IMPORTED'
          Visible = False
        end>
    end
    object Panel3: TPanel
      Left = 1066
      Top = 1
      Width = 101
      Height = 458
      Align = alRight
      TabOrder = 1
      object BBLinkClient: TBitBtn
        Left = 4
        Top = 12
        Width = 92
        Height = 25
        Hint = #1059#1082#1072#1079#1072#1090#1100' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072' '#1080#1079' '#1091#1095#1077#1090#1085#1086#1075#1086' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
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
        TabOrder = 0
        OnClick = BBLinkClientClick
      end
      object BBLinkDocType: TBitBtn
        Left = 4
        Top = 44
        Width = 92
        Height = 25
        Hint = #1059#1082#1072#1079#1072#1090#1100' '#1090#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1080#1079' '#1091#1095#1077#1090#1085#1086#1075#1086' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084'.'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
          000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
          FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
          FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
          0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
          05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
          55557F7777777555555500000005555555557777777555555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BBLinkDocTypeClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'XML '#1092#1072#1081#1083#1099'|*.xml'
    Left = 516
    Top = 125
  end
  object ADS_IMPORT_BANK_TMP: TADODataSet
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT IB.[ID_IMPORT_DOC]'#13#10'      ,IB.[ID_USER]'#13#10'      ,IB.[ID_CL' +
      'I_D]'#13#10'      ,IB.[RS_D]'#13#10'      ,IB.[OKPO_D]'#13#10'      ,IB.[CLI_D]'#13#10' ' +
      '     ,IB.[ID_CLI_K]'#13#10'      ,IB.[RS_K]'#13#10'      ,IB.[OKPO_K]'#13#10'     ' +
      ' ,IB.[CLI_K]'#13#10'      ,IB.[D]'#13#10'      ,IB.[NN]'#13#10'      ,IB.[TOT_SUM]' +
      #13#10'      ,IB.[COMMENT]'#13#10'      ,IB.[ID_DOC_TYPE]'#13#10',IB.[IS_IMPORTED' +
      ']'#13#10',IB.[DK]'#13#10',IB.SCH_D_PROV'#13#10',IB.SCH_K_PROV'#13#10#13#10#9'  ,CLD.CLIENT CL' +
      'I_D_MY'#13#10#9'  ,CLK.CLIENT CLI_K_MY'#13#10#9'  ,DT.NAMEDOC'#13#10#9'  ,DT.ID_SCH_D' +
      #13#10#9'  ,DT.ID_SCH_K'#13#10'  FROM [IMPORT_BANK_TMP] IB'#13#10'left outer join ' +
      'CLIENTS CLD on CLD.ID_CLIENTS=IB.ID_CLI_D '#13#10'left outer join CLIE' +
      'NTS CLK on CLK.ID_CLIENTS=IB.ID_CLI_K '#13#10'left outer join [DOC_TYP' +
      'E] DT on DT.ID_DOC_TYPE=IB.[ID_DOC_TYPE]'#13#10'  WHERE [ID_USER]=:idu' +
      'ser'#13#10'ORDER BY   IB.[DK], IB.[D], IB.[NN]'
    Parameters = <
      item
        Name = 'IDUSER'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 200
    Top = 182
    object ADS_IMPORT_BANK_TMPID_IMPORT_DOC: TAutoIncField
      FieldName = 'ID_IMPORT_DOC'
      Visible = False
    end
    object ADS_IMPORT_BANK_TMPDK: TIntegerField
      DisplayLabel = #1044'/'#1050
      FieldName = 'DK'
      Visible = False
    end
    object ADS_IMPORT_BANK_TMPID_USER: TIntegerField
      FieldName = 'ID_USER'
      Visible = False
    end
    object ADS_IMPORT_BANK_TMPdeb_kred: TStringField
      DisplayLabel = #1044#1077#1073'/'#1050#1088#1077#1076
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'deb_kred'
      Size = 10
      Calculated = True
    end
    object ADS_IMPORT_BANK_TMPD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'D'
    end
    object ADS_IMPORT_BANK_TMPNN: TWideStringField
      DisplayLabel = #8470#1076#1086#1082
      DisplayWidth = 10
      FieldName = 'NN'
      Size = 50
    end
    object ADS_IMPORT_BANK_TMPTOT_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'TOT_SUM'
    end
    object ADS_IMPORT_BANK_TMPCOMMENT: TWideStringField
      DisplayLabel = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
      DisplayWidth = 50
      FieldName = 'COMMENT'
      Size = 255
    end
    object ADS_IMPORT_BANK_TMPID_DOC_TYPE: TIntegerField
      FieldName = 'ID_DOC_TYPE'
      Visible = False
    end
    object ADS_IMPORT_BANK_TMPCLI_D_MY: TWideStringField
      DisplayLabel = #1044#1077#1073#1080#1090#1086#1088' ('#1085#1072#1096' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082')'
      DisplayWidth = 30
      FieldName = 'CLI_D_MY'
      ReadOnly = True
      Size = 255
    end
    object ADS_IMPORT_BANK_TMPCLI_K_MY: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1086#1088' ('#1085#1072#1096' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082')'
      DisplayWidth = 30
      FieldName = 'CLI_K_MY'
      ReadOnly = True
      Size = 255
    end
    object ADS_IMPORT_BANK_TMPNAMEDOC: TWideStringField
      DisplayLabel = #1055#1088#1080#1074#1103#1079#1072#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      DisplayWidth = 30
      FieldName = 'NAMEDOC'
      ReadOnly = True
      Size = 50
    end
    object ADS_IMPORT_BANK_TMPSCH_D_PROV: TWideStringField
      DisplayLabel = #1057#1095'.'#1044' '#1082' '#1087#1088#1086#1074#1086#1076#1082#1077
      FieldName = 'SCH_D_PROV'
      ReadOnly = True
      Size = 10
    end
    object ADS_IMPORT_BANK_TMPSCH_K_PROV: TWideStringField
      DisplayLabel = #1057#1095'.'#1050' '#1082' '#1087#1088#1086#1074#1086#1076#1082#1077
      FieldName = 'SCH_K_PROV'
      ReadOnly = True
      Size = 10
    end
    object ADS_IMPORT_BANK_TMPID_SCH_D: TStringField
      DisplayLabel = #1057#1095'.'#1044
      FieldName = 'ID_SCH_D'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 10
    end
    object ADS_IMPORT_BANK_TMPID_SCH_K: TStringField
      DisplayLabel = #1057#1095'.'#1050
      FieldName = 'ID_SCH_K'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 10
    end
    object ADS_IMPORT_BANK_TMPCLI_D: TWideStringField
      DisplayLabel = #1044#1077#1073#1080#1090#1086#1088' '#1087#1086' '#1076#1072#1085#1085#1099#1084' '#1073#1072#1085#1082#1072
      DisplayWidth = 30
      FieldName = 'CLI_D'
      Size = 255
    end
    object ADS_IMPORT_BANK_TMPOKPO_D: TWideStringField
      DisplayLabel = #1054#1050#1055#1054' '#1076#1077#1073#1080#1090#1086#1088#1072
      FieldName = 'OKPO_D'
    end
    object ADS_IMPORT_BANK_TMPRS_D: TWideStringField
      DisplayLabel = #1088'/'#1089' '#1076#1077#1073#1080#1090#1086#1088#1072
      FieldName = 'RS_D'
    end
    object ADS_IMPORT_BANK_TMPID_CLI_D: TIntegerField
      FieldName = 'ID_CLI_D'
      Visible = False
    end
    object ADS_IMPORT_BANK_TMPCLI_K: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1086#1088' '#1087#1086' '#1076#1072#1085#1085#1099#1084' '#1073#1072#1085#1082#1072
      DisplayWidth = 30
      FieldName = 'CLI_K'
      Size = 255
    end
    object ADS_IMPORT_BANK_TMPOKPO_K: TWideStringField
      DisplayLabel = #1054#1050#1055#1054' '#1082#1088#1077#1076#1080#1090#1086#1088#1072
      FieldName = 'OKPO_K'
    end
    object ADS_IMPORT_BANK_TMPRS_K: TWideStringField
      DisplayLabel = #1088'/'#1089' '#1082#1088#1077#1076#1080#1090#1086#1088#1072
      FieldName = 'RS_K'
    end
    object ADS_IMPORT_BANK_TMPID_CLI_K: TIntegerField
      FieldName = 'ID_CLI_K'
      Visible = False
    end
    object ADS_IMPORT_BANK_TMPIS_IMPORTED: TIntegerField
      FieldName = 'IS_IMPORTED'
      Visible = False
    end
  end
  object DS_IMPORT_BANK_TMP: TDataSource
    DataSet = ADS_IMPORT_BANK_TMP
    Left = 302
    Top = 174
  end
  object SP_DEL_IMPORT_BANK_USER: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'DEL_IMPORT_BANK_USER;1'
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
        Name = '@ID_IMPORT_DOC'
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
    Left = 390
    Top = 198
  end
  object Tb_CLIENTS: TADOTable
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    TableName = 'CLIENTS'
    Left = 196
    Top = 92
  end
  object DS_Tb_CLIENTS: TDataSource
    DataSet = Tb_CLIENTS
    Left = 276
    Top = 96
  end
  object QDefaultSetting: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'SELECT DF.ID_SCH ID_SCH_DEF, '
      'DF.ID_CLIENT ID_CLI_DEF, CLI_DEF.CLIENT CLIENT_DEF,'
      'DF.ID_TOV ID_TOV_DEF, TOV_DEF."NAME" TOVAR_DEF,'
      'DF.ID_SUPPLYER ID_SUPPLYER_DEF, SUPP_DEF.CLIENT SUPPLYER_DEF,'
      
        'DF.ID_OUR_FIRM , OUR_FIRM_DEF.CLIENT FIRM_OUR_DEF, OUR_FIRM_DEF.' +
        'ADRES,'
      
        '  OUR_FIRM_DEF.BANK, OUR_FIRM_DEF.RS, OUR_FIRM_DEF.MFO, OUR_FIRM' +
        '_DEF.OKPO,'
      '  OUR_FIRM_DEF.INN, OUR_FIRM_DEF.RNN, '
      'DF.ID_SCH_PRVO, DF.ID_PRVO, OUR_PRVO_DEF.CLIENT PRVO_OUR_DEF,'
      'DF.ID_MAT_SCH, DF.ID_MAT_SCLAD, SCLAD_MAT_DEF.CLIENT SCLAD_MAT,'
      
        'DF.ID_KATEGOR_SOTR, KC.KATEGOR, DF.ID_NOT_DEF_CLI, NDC.CLIENT NO' +
        'T_DEF_CLI,'
      'DF.ID_NALOG_ORG, NAL1.CLIENT NALOG_ORG'
      ''
      'FROM  DEFAULT_PARAMS DF'
      
        'left outer join CLIENTS CLI_DEF on DF.ID_CLIENT=CLI_DEF.ID_CLIEN' +
        'TS'
      
        'left outer join CLIENTS SUPP_DEF on DF.ID_SUPPLYER=SUPP_DEF.ID_C' +
        'LIENTS'
      
        'left outer join CLIENTS OUR_FIRM_DEF on DF.ID_OUR_FIRM=OUR_FIRM_' +
        'DEF.ID_CLIENTS'
      
        'left outer join CLIENTS OUR_PRVO_DEF on DF.ID_PRVO=OUR_PRVO_DEF.' +
        'ID_CLIENTS'
      'left outer join TOV TOV_DEF on DF.ID_TOV=TOV_DEF.ID_TOV'
      
        'left outer join CLIENTS SCLAD_MAT_DEF on DF.ID_MAT_SCLAD=SCLAD_M' +
        'AT_DEF.ID_CLIENTS'
      'left outer join KATEG_CLI KC on KC.ID_KATEGOR=DF.ID_KATEGOR_SOTR'
      'left outer join CLIENTS NDC on NDC.ID_CLIENTS=DF.ID_NOT_DEF_CLI'
      'left outer join CLIENTS NAL1 on NAL1.ID_CLIENTS=DF.ID_NALOG_ORG'
      ''
      '')
    Left = 156
    Top = 292
  end
  object DSQDefaultSetting: TDataSource
    DataSet = QDefaultSetting
    Left = 218
    Top = 298
  end
end
