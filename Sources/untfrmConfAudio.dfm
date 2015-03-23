object frmConfAudio: TfrmConfAudio
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 257
  ClientWidth = 869
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  GlassFrame.Enabled = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 5
    Top = 5
    Width = 860
    Height = 250
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object cmdCancelar: TsButton
      Left = 722
      Top = 180
      Width = 66
      Height = 66
      Caption = 'Cancelar'
      TabOrder = 2
      SkinData.SkinSection = 'BUTTON_HUGE'
    end
    object cmdFechar: TsButton
      Left = 790
      Top = 180
      Width = 66
      Height = 66
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = cmdFecharClick
      SkinData.SkinSection = 'BUTTON_HUGE'
    end
    object cmdSalvar: TsButton
      Left = 654
      Top = 180
      Width = 66
      Height = 66
      Caption = 'Salvar'
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON_HUGE'
    end
    object grpIn: TsGroupBox
      Left = 5
      Top = 5
      Width = 315
      Height = 230
      Caption = 'grpIn'
      TabOrder = 3
      SkinData.SkinSection = 'GROUPBOX'
      object lblTotalIn: TsLabel
        Left = 15
        Top = 25
        Width = 44
        Height = 13
        Caption = 'lblTotalIn'
      end
      object lblDeviceIn: TsLabel
        Left = 16
        Top = 56
        Width = 52
        Height = 13
        Caption = 'lblDeviceIn'
      end
      object txtTotalIn: TsEdit
        Left = 112
        Top = 24
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 0
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object cboDeviceIn: TsComboBox
        Left = 104
        Top = 53
        Width = 145
        Height = 21
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        ItemIndex = -1
        TabOrder = 1
      end
    end
    object Memo1: TMemo
      Left = 384
      Top = 27
      Width = 185
      Height = 89
      TabOrder = 4
    end
  end
  object sSkinManager1: TsSkinManager
    Effects.AllowGlowing = False
    IsDefault = False
    Active = False
    InternalSkins = <>
    MenuSupport.IcoLineSkin = 'ICOLINE'
    MenuSupport.ExtraLineFont.Charset = DEFAULT_CHARSET
    MenuSupport.ExtraLineFont.Color = clWindowText
    MenuSupport.ExtraLineFont.Height = -11
    MenuSupport.ExtraLineFont.Name = 'Tahoma'
    MenuSupport.ExtraLineFont.Style = []
    SkinDirectory = 'D:\Componentes\AlphaControls_7.60\Skins'
    SkinName = 'Cold'
    SkinInfo = 'N/A'
    ThirdParty.ThirdEdits = ' '
    ThirdParty.ThirdButtons = 'TButton'
    ThirdParty.ThirdBitBtns = ' '
    ThirdParty.ThirdCheckBoxes = ' '
    ThirdParty.ThirdGroupBoxes = ' '
    ThirdParty.ThirdListViews = ' '
    ThirdParty.ThirdPanels = ' '
    ThirdParty.ThirdGrids = ' '
    ThirdParty.ThirdTreeViews = ' '
    ThirdParty.ThirdComboBoxes = ' '
    ThirdParty.ThirdWWEdits = ' '
    ThirdParty.ThirdVirtualTrees = ' '
    ThirdParty.ThirdGridEh = ' '
    ThirdParty.ThirdPageControl = ' '
    ThirdParty.ThirdTabControl = ' '
    ThirdParty.ThirdToolBar = ' '
    ThirdParty.ThirdStatusBar = ' '
    ThirdParty.ThirdSpeedButton = ' '
    ThirdParty.ThirdScrollControl = ' '
    ThirdParty.ThirdUpDown = ' '
    Left = 776
    Top = 24
  end
end
