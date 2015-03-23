object frmXFer: TfrmXFer
  Left = 0
  Top = 0
  Width = 234
  Height = 160
  TabOrder = 0
  object tabXFer: TsTabControl
    Left = 3
    Top = 3
    Width = 228
    Height = 155
    MultiLine = True
    TabOrder = 0
    Tabs.Strings = (
      'Fila'
      'Ura'
      'Agente'
      'Pesquisa'
      'Virtual'
      'Consulta')
    TabIndex = 0
    OnChange = tabXFerChange
    SkinData.SkinSection = 'PAGECONTROL'
    object lblSelecioneXFer: TsLabel
      Left = 13
      Top = 45
      Width = 73
      Height = 13
      Caption = 'Selecione a Fila'
    end
    object btnXFer: TsButton
      Left = 76
      Top = 85
      Width = 66
      Height = 66
      Caption = 'Transferir'
      TabOrder = 0
      OnClick = btnXFerClick
      SkinData.SkinSection = 'BUTTON_HUGE'
    end
    object cboXFer: TsComboBox
      Left = 13
      Top = 60
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
      TabOrder = 1
    end
  end
end
