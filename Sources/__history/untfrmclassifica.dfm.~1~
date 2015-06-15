object frmclassifica: Tfrmclassifica
  Left = 0
  Top = 0
  Width = 234
  Height = 330
  TabOrder = 0
  object cmdSalvar: TsButton
    Left = 145
    Top = 261
    Width = 66
    Height = 66
    Caption = 'Salvar'
    TabOrder = 0
    OnClick = cmdSalvarClick
    SkinData.SkinSection = 'BUTTON_HUGE'
  end
  object pnlAgenda: TsGroupBox
    Left = 5
    Top = 165
    Width = 220
    Height = 95
    Caption = 'Agendamento'
    Enabled = False
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object lblData: TsLabel
      Left = 10
      Top = 56
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object lblHora: TsLabel
      Left = 130
      Top = 56
      Width = 23
      Height = 13
      Caption = 'Hora'
    end
    object rdgAgenda: TsRadioGroup
      Left = 10
      Top = 15
      Width = 200
      Height = 38
      Caption = 'Tipo'
      ParentBackground = False
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      Columns = 2
      Items.Strings = (
        'Espec'#237'fico'
        'Grupo')
    end
    object dteAgenda: TsDateEdit
      Left = 10
      Top = 70
      Width = 86
      Height = 21
      AutoSize = False
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
      DialogTitle = 'Selecione uma data'
    end
    object hraAgenda: TsMaskEdit
      Left = 130
      Top = 70
      Width = 72
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 2
      Text = '  :  '
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
    end
  end
  object chkGravacao: TsCheckBox
    Left = 5
    Top = 265
    Width = 113
    Height = 20
    Caption = 'Solicitou Grava'#231#227'o?'
    TabOrder = 2
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object chkPausar: TsCheckBox
    Left = 5
    Top = 285
    Width = 99
    Height = 20
    Caption = 'Entrar em Pausa'
    TabOrder = 3
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object grpFila: TsGroupBox
    Left = 5
    Top = 1
    Width = 220
    Height = 40
    Caption = 'grpFila'
    TabOrder = 4
    SkinData.SkinSection = 'GROUPBOX'
    object cboFila: TsComboBox
      Left = 10
      Top = 15
      Width = 200
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
      Style = csDropDownList
      ItemIndex = -1
      TabOrder = 0
      OnChange = cboFilaChange
    end
  end
  object grpClassificacao: TsGroupBox
    Left = 5
    Top = 42
    Width = 220
    Height = 123
    Caption = 'grpClassificacao'
    TabOrder = 5
    SkinData.SkinSection = 'GROUPBOX'
    object lblObservacao: TsLabel
      Left = 10
      Top = 70
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object lblSubClass: TsLabel
      Left = 10
      Top = 36
      Width = 82
      Height = 13
      Caption = 'Sub Classifica'#231#227'o'
    end
    object cboClassifica: TsComboBox
      Left = 10
      Top = 15
      Width = 200
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
      Style = csDropDownList
      ItemIndex = -1
      TabOrder = 0
      OnChange = cboClassificaChange
    end
    object memObs: TsMemo
      Left = 10
      Top = 83
      Width = 200
      Height = 35
      ScrollBars = ssVertical
      TabOrder = 1
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
    end
    object cboSubClassifica: TsComboBox
      Left = 10
      Top = 49
      Width = 200
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
      Style = csDropDownList
      ItemIndex = -1
      TabOrder = 2
      OnChange = cboSubClassificaChange
    end
  end
  object chkLogoff: TsCheckBox
    Left = 5
    Top = 305
    Width = 90
    Height = 20
    Caption = 'Efetuar Logoff'
    TabOrder = 6
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
end
