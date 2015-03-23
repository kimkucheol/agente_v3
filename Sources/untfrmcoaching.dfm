object frmCoaching: TfrmCoaching
  Left = 0
  Top = 0
  Width = 234
  Height = 119
  TabOrder = 0
  object cboCoaching: TsComboBox
    Left = 14
    Top = 16
    Width = 207
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
  end
  object cmdCoaching: TsButton
    Left = 84
    Top = 43
    Width = 66
    Height = 66
    Caption = 'Coaching'
    TabOrder = 1
    OnClick = cmdCoachingClick
    SkinData.SkinSection = 'BUTTON_HUGE'
  end
end
