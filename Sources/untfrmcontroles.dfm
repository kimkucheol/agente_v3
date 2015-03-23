object frmcontroles: Tfrmcontroles
  Left = 0
  Top = 0
  Width = 235
  Height = 251
  TabOrder = 0
  object sWebLabel1: TsWebLabel
    Left = 35
    Top = 3
    Width = 47
    Height = 13
    Caption = 'Microfone'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HoverFont.Charset = DEFAULT_CHARSET
    HoverFont.Color = clWindowText
    HoverFont.Height = -11
    HoverFont.Name = 'Tahoma'
    HoverFont.Style = []
  end
  object sWebLabel2: TsWebLabel
    Left = 133
    Top = 3
    Width = 74
    Height = 13
    Caption = 'Fone de ouvido'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HoverFont.Charset = DEFAULT_CHARSET
    HoverFont.Color = clWindowText
    HoverFont.Height = -11
    HoverFont.Name = 'Tahoma'
    HoverFont.Style = []
  end
  object sBevel1: TsBevel
    Left = 113
    Top = 0
    Width = 6
    Height = 198
    Shape = bsLeftLine
    Style = bsRaised
  end
  object cbmudo: TsCheckBox
    Left = 3
    Top = 205
    Width = 46
    Height = 20
    Caption = 'Mudo'
    TabOrder = 0
    OnClick = cbmudoClick
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object tbvolumeout: TsTrackBar
    Left = 35
    Top = 22
    Width = 43
    Height = 184
    Orientation = trVertical
    PageSize = 1
    Position = 5
    ShowSelRange = False
    TabOrder = 1
    TickMarks = tmBoth
    OnChange = tbvolumeoutChange
    SkinData.SkinSection = 'TRACKBAR'
  end
  object tbvolumein: TsTrackBar
    Left = 152
    Top = 22
    Width = 43
    Height = 184
    Orientation = trVertical
    PageSize = 1
    Position = 5
    ShowSelRange = False
    TabOrder = 2
    TickMarks = tmBoth
    OnChange = tbvolumeinChange
    SkinData.SkinSection = 'TRACKBAR'
  end
  object cbdnd: TsCheckBox
    Left = 3
    Top = 226
    Width = 84
    Height = 20
    Caption = 'N'#227'o Perturbe'
    TabOrder = 3
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
end
