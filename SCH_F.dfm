object F_sch: TF_sch
  Left = 196
  Top = 175
  Caption = #1055#1083#1072#1085' '#1089#1095#1077#1090#1086#1074
  ClientHeight = 419
  ClientWidth = 938
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 43
    Width = 938
    Height = 341
    Align = alClient
    DataSource = DSSCH
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_SCH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCH_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_SCH_TYPE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ID_UCHET'
        Visible = False
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'UCHET'
        ReadOnly = True
        Width = 64
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'SCH_TYPE'
        ReadOnly = True
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IN_BALANS'
        PickList.Strings = (
          '1'
          '0')
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_VISIBLE'
        PickList.Strings = (
          '1'
          '0')
        Width = 64
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 938
    Height = 43
    Align = alTop
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 5
      Top = 12
      Width = 192
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel]
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 276
      Top = 2
      Width = 233
      Height = 39
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 1
      object Edit1: TEdit
        Left = 8
        Top = 12
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
    object BBRefresh: TBitBtn
      Left = 198
      Top = 12
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
      TabOrder = 2
      OnClick = BBRefreshClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 384
    Width = 938
    Height = 35
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 28
      Top = 4
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1086#1088
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
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
  object ADODSSCH: TADODataSet
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select SCH.ID_SCH, SCH.SCH_NAME, SCH.ID_SCH_TYPE, SCH.ID_UCHET, ' +
      'UCH.UCHET, SCH_TYPE.SCH_TYPE, SCH.IN_BALANS, SCH.IS_VISIBLE'#13#10' fr' +
      'om SCH'#13#10'inner join  UCH on UCH.ID_UCHET=SCH.ID_UCHET'#13#10'inner join' +
      ' SCH_TYPE on SCH_TYPE.ID_SCH_TYPE=SCH.ID_SCH_TYPE'#13#10
    Parameters = <>
    Left = 246
    Top = 158
    object ADODSSCHID_SCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'ID_SCH'
      FixedChar = True
      Size = 10
    end
    object ADODSSCHSCH_NAME: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'SCH_NAME'
      Size = 50
    end
    object ADODSSCHID_SCH_TYPE: TIntegerField
      FieldName = 'ID_SCH_TYPE'
      Visible = False
    end
    object ADODSSCHID_UCHET: TIntegerField
      FieldName = 'ID_UCHET'
      Visible = False
    end
    object ADODSSCHUCHET: TWideStringField
      DisplayLabel = #1059#1095#1077#1090
      DisplayWidth = 25
      FieldName = 'UCHET'
      Size = 50
    end
    object ADODSSCHSCH_TYPE: TWideStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 25
      FieldName = 'SCH_TYPE'
      Size = 50
    end
    object ADODSSCHIN_BALANS: TIntegerField
      DisplayLabel = #1042' '#1073#1072#1083#1072#1085#1089
      FieldName = 'IN_BALANS'
    end
    object ADODSSCHIS_VISIBLE: TIntegerField
      DisplayLabel = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1074' '#1092#1086#1088#1084#1077' '#1073#1072#1083#1072#1085#1089#1072
      FieldName = 'IS_VISIBLE'
    end
  end
  object DSSCH: TDataSource
    DataSet = ADODSSCH
    Left = 292
    Top = 156
  end
end
