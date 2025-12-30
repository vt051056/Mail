object FReadMail: TFReadMail
  Left = 0
  Top = 0
  Caption = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1087#1086#1095#1090#1099
  ClientHeight = 579
  ClientWidth = 1184
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
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 579
    Align = alLeft
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 498
      Height = 124
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 29
        Width = 98
        Height = 13
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1085#1086' '#1087#1080#1089#1077#1084
      end
      object Label3: TLabel
        Left = 1
        Top = 85
        Width = 31
        Height = 13
        Caption = 'Label3'
      end
      object Label1: TLabel
        Left = 8
        Top = 4
        Width = 31
        Height = 13
        Caption = 'Label1'
      end
      object Label4: TLabel
        Left = 139
        Top = 60
        Width = 7
        Height = 13
        Caption = 'C'
      end
      object Label5: TLabel
        Left = 243
        Top = 60
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object Label6: TLabel
        Left = 8
        Top = 60
        Width = 12
        Height = 13
        Caption = #1047#1072
      end
      object Label7: TLabel
        Left = 71
        Top = 60
        Width = 19
        Height = 13
        Caption = #1076#1085#1103
      end
      object Label8: TLabel
        Left = 1
        Top = 106
        Width = 31
        Height = 13
        Caption = 'Label8'
      end
      object BBSetting: TBitBtn
        Left = 357
        Top = 24
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
        TabOrder = 0
        OnClick = BBSettingClick
      end
      object BB_Read_message: TBitBtn
        Left = 205
        Top = 24
        Width = 26
        Height = 25
        Hint = #1054#1090#1082#1088#1099#1090#1100' '#1087#1080#1089#1100#1084#1086
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
          0000777777777777777707FFFFFFFFFFFF70773FF33333333F770F77FFFFFFFF
          77F07F773FF3333F77370FFF77FFFF77FFF07F33773FFF7733370FFFFF0000FF
          FFF07F333F77773FF3370FFF70EEEE07FFF07F3F773333773FF70F707FFFFFF7
          07F07F77333333337737007EEEEEEEEEE70077FFFFFFFFFFFF77077777777777
          77707777777777777777307EEEEEEEEEE7033773FF333333F77333707FFFFFF7
          0733333773FF33F773333333707EE707333333333773F7733333333333700733
          3333333333377333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BB_Read_messageClick
      end
      object BB_ReadInBox: TBitBtn
        Left = 167
        Top = 24
        Width = 32
        Height = 25
        Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1087#1086#1095#1090#1091
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00550B30555000
          0000557F57F557777777550B305508888880557F57F575555557550B30508888
          8805557F57F7FFFFFF75550B300000000055557F5777777777F5550300000000
          0055557F777F555F77F555007800000070555F77557F5F7757F5007888000077
          70557755557F775557F508888800777770557F555577555557F5088808077777
          70557FF5757F555557F5098988077777705577F7557F555557F5999888077777
          705577755575F55557550988888077770555775555575FFF7555088888888000
          55557F55555577775555088888880755555575F5555F77555555508888075555
          5555575FFF775555555555000755555555555577775555555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BB_ReadInBoxClick
      end
      object E_max_send: TEdit
        Left = 120
        Top = 26
        Width = 41
        Height = 21
        Hint = #1063#1080#1089#1083#1086' '#1087#1086#1089#1083#1077#1076#1085#1080#1093' '#1087#1080#1089#1077#1084' '#1086#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = '2'
        OnExit = E_max_sendExit
      end
      object BitBtn1: TBitBtn
        Left = 396
        Top = 24
        Width = 75
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        Kind = bkClose
        NumGlyphs = 2
        TabOrder = 4
      end
      object DTP_From_Mail: TDateTimePicker
        Left = 153
        Top = 55
        Width = 84
        Height = 21
        Date = 44488.000000000000000000
        Time = 44488.000000000000000000
        TabOrder = 5
        OnChange = DTP_From_MailChange
      end
      object DTP_To_Mail: TDateTimePicker
        Left = 261
        Top = 55
        Width = 81
        Height = 21
        Date = 44488.999988425920000000
        Time = 44488.999988425920000000
        TabOrder = 6
        OnChange = DTP_From_MailChange
      end
      object E_Dep_Days: TEdit
        Left = 26
        Top = 58
        Width = 39
        Height = 21
        TabOrder = 7
        Text = '2'
        OnExit = E_Dep_DaysExit
      end
      object BB_Remove_mess_To_Arhive: TBitBtn
        Left = 243
        Top = 24
        Width = 26
        Height = 25
        Hint = ' '#1040#1088#1093#1080#1074#1080#1088#1086#1074#1072#1090#1100' '#1087#1080#1089#1100#1084#1086
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = BB_Remove_mess_To_ArhiveClick
      end
      object CB_IncludArhive: TCheckBox
        Left = 348
        Top = 58
        Width = 97
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1072#1103' '#1072#1088#1093#1080#1074
        TabOrder = 9
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 125
      Width = 498
      Height = 276
      Align = alClient
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 1
        Top = 26
        Width = 496
        Height = 249
        Align = alClient
        DataSource = DS_INBOX
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnTitleClick = DBGrid1TitleClick
      end
      object DBNavigator1: TDBNavigator
        Left = 1
        Top = 1
        Width = 496
        Height = 25
        DataSource = DS_INBOX
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alTop
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 401
      Width = 498
      Height = 177
      Align = alBottom
      TabOrder = 2
      object DBGrid2: TDBGrid
        Left = 1
        Top = 33
        Width = 496
        Height = 143
        Align = alClient
        DataSource = DS_Attach_Files
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawDataCell = DBGrid2DrawDataCell
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 496
        Height = 32
        Align = alTop
        TabOrder = 1
        object BB_OpenAttach_file: TBitBtn
          Left = 128
          Top = 4
          Width = 25
          Height = 25
          Hint = #1054#1090#1082#1088#1099#1090#1100' Exel '#1092#1072#1081#1083' '#1074#1083#1086#1078#1077#1085#1080#1103
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
          TabOrder = 0
          OnClick = BB_OpenAttach_fileClick
        end
        object DBNavigator2: TDBNavigator
          Left = 7
          Top = 3
          Width = 84
          Height = 25
          DataSource = DS_Attach_Files
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 1
        end
        object BBImportTo_Uch_Doc: TBitBtn
          Left = 204
          Top = 4
          Width = 25
          Height = 25
          Hint = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1091#1095#1077#1090#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1080#1079' Exel '#1092#1072#1081#1083#1072' '#1074#1083#1086#1078#1077#1085#1080#1103
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = BBImportTo_Uch_DocClick
        end
      end
    end
  end
  object Panel6: TPanel
    Left = 500
    Top = 0
    Width = 684
    Height = 579
    Align = alClient
    TabOrder = 1
    object WebBrowser1: TWebBrowser
      Left = 1
      Top = 1
      Width = 682
      Height = 577
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 473
      ExplicitHeight = 417
      ControlData = {
        4C0000007D460000A23B00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':143'
    MaxLineAction = maException
    Port = 143
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 309
    Top = 88
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
    Left = 416
    Top = 88
  end
  object IdIMAP41: TIdIMAP4
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    SASLMechanisms = <>
    MilliSecsToWaitToClearBuffer = 10
    Left = 216
    Top = 88
  end
  object ADS_INBOX: TADODataSet
    Connection = DM1.ADOConnection1
    AfterScroll = ADS_INBOXAfterScroll
    CommandText = 
      'select ID, UID_MESSAGE, ADRESS as '#1040#1076#1088#1077#1089' , NAME as '#1054#1090'_'#1082#1086#1075#1086', SUBJE' +
      'CT_TEXT as '#1058#1077#1084#1072','#13#10' D as '#1044#1072#1090#1072', MAIL_BOX_NAME as '#1055#1072#1087#1082#1072','#13#10'ID_PARENT' +
      ' from #mail_inbox'#13#10'order by D, ID'
    Parameters = <>
    Left = 328
    Top = 168
  end
  object DS_INBOX: TDataSource
    DataSet = ADS_INBOX
    Left = 376
    Top = 168
  end
  object ADOC_CreateInBox: TADOCommand
    CommandText = 
      'create table #mail_inbox (ID int IDENTITY(1,1) NOT NULL, UID_MES' +
      'SAGE nvarchar(255), '#13#10'ADRESS nvarchar(255), NAME nvarchar(255), ' +
      'SUBJECT_TEXT nvarchar(255), D datetime, MAIL_BOX_NAME nvarchar(5' +
      '0),'#13#10'ID_PARENT int);'
    Connection = DM1.ADOConnection1
    Parameters = <>
    Left = 104
    Top = 168
  end
  object ADOC_DropInBox: TADOCommand
    CommandText = 'drop table #mail_inbox;'
    Connection = DM1.ADOConnection1
    Parameters = <>
    Left = 248
    Top = 168
  end
  object ADOC_Create_Attach_files: TADOCommand
    CommandText = 
      'create table #attach_files (ID int IDENTITY(1,1) NOT NULL, UID n' +
      'varchar(255), F_NAME nvarchar(255),'#13#10' F_PATH nvarchar(255), F_FU' +
      'LL_NAME nvarchar(255), IS_COMPLETE int default 0);'#13#10#13#10
    Connection = DM1.ADOConnection1
    Parameters = <>
    Left = 192
    Top = 224
  end
  object ADOC_Drop_Attach_Files: TADOCommand
    CommandText = 'drop table #attach_files;'
    Connection = DM1.ADOConnection1
    Parameters = <>
    Left = 264
    Top = 224
  end
  object ADS_Attach_Files: TADODataSet
    Connection = DM1.ADOConnection1
    AfterScroll = ADS_Attach_FilesAfterScroll
    CommandText = 
      'select ID , UID, F_NAME as '#1060#1072#1081#1083','#13#10' F_PATH as '#1055#1091#1090#1100', F_FULL_NAME a' +
      's '#1055#1086#1083#1085#1086#1077'_'#1080#1084#1103', IS_COMPLETE as '#1048#1084#1087#1086#1088#1090' from #attach_files'#13#10'order by' +
      ' ID, F_NAME'
    Parameters = <>
    Left = 328
    Top = 224
  end
  object DS_Attach_Files: TDataSource
    DataSet = ADS_Attach_Files
    Left = 368
    Top = 224
  end
  object ADOC_Delete_Attach_Files: TADOCommand
    CommandText = 'delete #attach_files;'
    Connection = DM1.ADOConnection1
    Parameters = <>
    Left = 264
    Top = 272
  end
  object ADOC_DeleteInBox: TADOCommand
    CommandText = 'delete #mail_inbox;'
    Connection = DM1.ADOConnection1
    Parameters = <>
    Left = 248
    Top = 136
  end
  object Q_Mail_Firm_List: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_PARENT'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '--use NMK_EP'
      'declare @ID_PARENT int'
      'set @ID_PARENT=:ID_PARENT'
      'if @ID_PARENT<>-1'
      'begin'
      
        #9'select CLIENT as CLI, EMAIL, FOLDER_NAME, CL.[ID_PARENT] from C' +
        'LIENTS CL where CL.[ID_PARENT]=@ID_PARENT'
      'end'
      'else'
      'begin'
      
        #9'select CLIENT as CLI, EMAIL, FOLDER_NAME, CL.[ID_PARENT] from C' +
        'LIENTS CL'
      
        #9'where CL.ID_KATEGOR in (45,46) -- '#1055#1086#1089#1090#1072#1074#1097#1080#1082#1080' '#1058#1053#1055' '#1085#1072' '#1058#1057' '#1080' '#1052#1077#1085#1077#1076#1078 +
        #1077#1088#1099' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074' '#1058#1053#1055' '#1085#1072' '#1058#1057
      '  and CL.IS_DELETE=0 and ISNULL(EMAIL,'#39#39') <> '#39#39
      #9'order by CLIENT'
      'end;')
    Left = 361
    Top = 329
  end
end
