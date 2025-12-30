object FSendMail: TFSendMail
  Left = 0
  Top = 0
  Caption = #1054#1090#1087#1088#1072#1074#1082#1072' '#1087#1086#1095#1090#1099
  ClientHeight = 440
  ClientWidth = 892
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 60
    Width = 892
    Height = 380
    Align = alClient
    TabOrder = 0
    object Panel3: TPanel
      Left = 298
      Top = 1
      Width = 593
      Height = 378
      Align = alClient
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 1
        Top = 26
        Width = 591
        Height = 351
        Align = alClient
        DataSource = DM1.DS_QOrder_Tov
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBNavigator1: TDBNavigator
        Left = 1
        Top = 1
        Width = 591
        Height = 25
        DataSource = DM1.DS_QOrder_Tov
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alTop
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 297
      Height = 378
      Align = alLeft
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 5
        Width = 91
        Height = 13
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1087#1080#1089#1100#1084#1072
      end
      object Label2: TLabel
        Left = 16
        Top = 51
        Width = 102
        Height = 13
        Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1087#1080#1089#1100#1084#1072
      end
      object Label3: TLabel
        Left = 16
        Top = 287
        Width = 107
        Height = 13
        Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072' '#1074#1083#1086#1078#1077#1085#1080#1103
      end
      object E_Title: TEdit
        Left = 16
        Top = 24
        Width = 275
        Height = 21
        TabOrder = 0
        Text = 'E_Title'
      end
      object M_Content: TMemo
        Left = 16
        Top = 70
        Width = 275
        Height = 211
        Lines.Strings = (
          'M_Content')
        TabOrder = 1
      end
      object E_File_Attach: TEdit
        Left = 16
        Top = 306
        Width = 208
        Height = 21
        TabOrder = 2
        Text = 'E_File_Attach'
      end
      object BBAttachFile: TBitBtn
        Left = 240
        Top = 306
        Width = 29
        Height = 25
        Hint = #1042#1099#1073#1086#1088' '#1092#1072#1081#1083#1072' '#1074#1083#1086#1078#1077#1085#1080#1103
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BBAttachFileClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 892
    Height = 60
    Align = alTop
    TabOrder = 1
    object Label4: TLabel
      Left = 24
      Top = 8
      Width = 128
      Height = 13
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100' ('#1079#1072#1082#1072#1079#1095#1080#1082') '
    end
    object Label5: TLabel
      Left = 24
      Top = 27
      Width = 128
      Height = 13
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' ('#1087#1086#1089#1090#1072#1074#1097#1080#1082')'
    end
    object Label6: TLabel
      Left = 394
      Top = 8
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object Label7: TLabel
      Left = 394
      Top = 33
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object E_Sender: TEdit
      Left = 176
      Top = 5
      Width = 201
      Height = 21
      TabOrder = 0
      Text = 'E_Sender'
    end
    object E_Recipient: TEdit
      Left = 176
      Top = 32
      Width = 201
      Height = 21
      TabOrder = 1
      Text = 'E_Recipient'
    end
    object E_mail_Sender: TEdit
      Left = 428
      Top = 5
      Width = 165
      Height = 21
      TabOrder = 2
      Text = 'E_mail_Sender'
    end
    object E_mail_Recipient: TEdit
      Left = 428
      Top = 32
      Width = 165
      Height = 21
      TabOrder = 3
      Text = 'E_mail_Recipient'
    end
    object CB_Edit: TCheckBox
      Left = 640
      Top = 37
      Width = 97
      Height = 17
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 4
      OnClick = CB_EditClick
    end
    object BBSendMail: TBitBtn
      Left = 759
      Top = 29
      Width = 26
      Height = 25
      Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0000377777777777777707FFFFFFFFFFFF70773FF33333333F770F77FFFFFFFF
        77F07F773FFFFFFF77F70FFF7700000000007F337777777777770FFFFF0FFFFF
        FFF07F333F7F3FFFF3370FFF700F0000FFF07F3F777F777733370F707F0FFFFF
        FFF07F77337F3FFFFFF7007EEE0F000000F077FFFF7F777777370777770FFFFF
        FFF07777777F3FFFFFF7307EEE0F000000F03773FF7F7777773733707F0FFFFF
        FFF03337737F3FFF33373333700F000FFFF03333377F77733FF73333330FFFFF
        00003333337F3FF377773333330F00FF0F033333337F77337F733333330FFFFF
        00333333337FFFFF773333333300000003333333337777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BBSendMailClick
    end
    object BitBtn1: TBitBtn
      Left = 800
      Top = 29
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 6
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' Excel|*.xls;*.xlsx|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Title = #1042#1099#1073#1086#1088' '#1092#1072#1081#1083#1072' '#1076#1083#1103' '#1074#1083#1086#1078#1077#1085#1080#1103' '#1082' '#1087#1080#1089#1100#1084#1091
    Left = 177
    Top = 333
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 600
    Top = 184
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 472
    Top = 176
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 352
    Top = 192
  end
end
