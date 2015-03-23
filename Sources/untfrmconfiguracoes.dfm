object frmConfiguracoes: TfrmConfiguracoes
  Left = 0
  Top = 0
  Width = 201
  Height = 64
  TabOrder = 0
  object sLabel1: TsLabel
    Left = 9
    Top = 11
    Width = 19
    Height = 13
    Caption = 'Skin'
  end
  object cbskin: TsComboBox
    Left = 9
    Top = 30
    Width = 189
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
    OnChange = cbskinChange
  end
end
