object F_Main: TF_Main
  Left = 0
  Top = 0
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#1084#1080
  ClientHeight = 205
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 748
    Height = 164
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 90
    object Label1: TLabel
      Left = 40
      Top = 120
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object GroupBox2: TGroupBox
      Left = 6
      Top = 17
      Width = 113
      Height = 79
      Caption = #1056#1072#1089#1095#1077#1090#1085#1072#1103' '#1076#1072#1090#1072
      TabOrder = 0
      object D_Work: TDateTimePicker
        Left = 10
        Top = 18
        Width = 93
        Height = 21
        Date = 38613.999988425930000000
        Time = 38613.999988425930000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = D_WorkChange
        OnExit = D_WorkChange
      end
      object T_Work: TDateTimePicker
        Left = 10
        Top = 46
        Width = 91
        Height = 23
        Date = 38774.999988425930000000
        Time = 38774.999988425930000000
        Kind = dtkTime
        TabOrder = 1
        OnChange = T_WorkChange
        OnExit = T_WorkChange
      end
    end
    object GroupBox1: TGroupBox
      Left = 138
      Top = 17
      Width = 213
      Height = 79
      Caption = #1054#1090#1095#1077#1090#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
      TabOrder = 1
      object Label3: TLabel
        Left = 8
        Top = 22
        Width = 5
        Height = 13
        Caption = #1089
      end
      object Label4: TLabel
        Left = 6
        Top = 52
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object D_From: TDateTimePicker
        Left = 23
        Top = 20
        Width = 92
        Height = 21
        Date = 38613.000000000000000000
        Time = 38613.000000000000000000
        TabOrder = 0
      end
      object D_To: TDateTimePicker
        Left = 23
        Top = 46
        Width = 92
        Height = 21
        Date = 38613.999988425930000000
        Time = 38613.999988425930000000
        TabOrder = 1
      end
      object T_From: TDateTimePicker
        Left = 118
        Top = 20
        Width = 79
        Height = 21
        Date = 38774.000000000000000000
        Time = 38774.000000000000000000
        Kind = dtkTime
        TabOrder = 2
        OnChange = T_FromChange
        OnExit = T_FromChange
      end
      object T_To: TDateTimePicker
        Left = 118
        Top = 45
        Width = 79
        Height = 21
        Date = 38774.999988425930000000
        Time = 38774.999988425930000000
        Kind = dtkTime
        TabOrder = 3
        OnChange = T_ToChange
        OnExit = T_ToChange
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 164
    Width = 748
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 90
  end
  object MainMenu1: TMainMenu
    Left = 392
    Top = 96
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083#1099
      object N2: TMenuItem
        Action = Action_Exit
      end
    end
    object N3: TMenuItem
      Caption = #1058#1053#1055
      object N5: TMenuItem
        Action = Action_Orders
      end
      object N4: TMenuItem
        Action = Action_Nakl_Prihod
      end
      object N6: TMenuItem
        Action = Action_Nakl_Vozvrat
      end
      object N11: TMenuItem
        Caption = #1047#1072#1082#1072#1079#1099' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091' '#1058#1053#1055
        OnClick = N11Click
      end
    end
    object N7: TMenuItem
      Caption = #1050#1086#1083#1073#1072#1089#1072
      object N8: TMenuItem
        Action = Action_Nakl_Rashod_Kolbas
      end
    end
    object N10: TMenuItem
      Action = Action_Bank_Doc_Import
    end
  end
  object ActionList1: TActionList
    Left = 480
    Top = 96
    object Action_Exit: TAction
      Category = 'Files'
      Caption = #1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      OnExecute = Action_ExitExecute
    end
    object Action_Orders: TAction
      Category = 'TNP'
      Caption = #1047#1072#1082#1072#1079#1099' '#1058#1053#1055' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091
      OnExecute = Action_OrdersExecute
    end
    object Action_Nakl_Prihod: TAction
      Category = 'TNP'
      Caption = #1055#1088#1080#1093#1086#1076' '#1085#1072#1082#1083'. '#1058#1053#1055' '#1086#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      OnExecute = Action_Nakl_PrihodExecute
    end
    object Action_Nakl_Vozvrat: TAction
      Category = 'TNP'
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1058#1053#1055' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091' '#1085#1086#1074#1099#1081
      OnExecute = Action_Nakl_VozvratExecute
    end
    object Action_Nakl_Rashod_Kolbas: TAction
      Category = 'Klobasa'
      Caption = #1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
      OnExecute = Action_Nakl_Rashod_KolbasExecute
    end
    object Action_Bank_Doc_Import: TAction
      Category = 'Bank'
      Caption = #1048#1084#1087#1086#1088#1090' '#1073#1072#1085#1082#1086#1074#1089#1082#1080#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '
      OnExecute = Action_Bank_Doc_ImportExecute
    end
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 288
    Top = 114
  end
end
