object SignatureCaptureForm: TSignatureCaptureForm
  Left = 0
  Top = 0
  Caption = 
    'TMS FNC Signature Capture Demo (Componente de Captura de Assinat' +
    'uras)'
  ClientHeight = 800
  ClientWidth = 979
  Color = clBtnFace
  Constraints.MinHeight = 799
  Constraints.MinWidth = 976
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 17
  object pnHeader: TPanel
    Left = 0
    Top = 0
    Width = 979
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Color = 5583379
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = -6
    ExplicitWidth = 960
    object lbTitle: TLabel
      Left = 20
      Top = 12
      Width = 503
      Height = 32
      Caption = 'Signature Capture (Captura de Assinaturas) '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSubtitle: TLabel
      Left = 20
      Top = 48
      Width = 413
      Height = 17
      Caption = 
        'TTMSFNCSignatureCapture | Draw, save, restore and export signatu' +
        'res'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object gBoxSettings: TGroupBox
    Left = 0
    Top = 80
    Width = 979
    Height = 96
    Align = alTop
    Caption = ' Pen and appearance '
    TabOrder = 1
    ExplicitLeft = 16
    ExplicitTop = 92
    ExplicitWidth = 928
    object lbPenColor: TLabel
      Left = 16
      Top = 24
      Width = 55
      Height = 17
      Caption = 'Pen color'
      FocusControl = cBoxPenColor
    end
    object lbPenWidth: TLabel
      Left = 176
      Top = 24
      Width = 56
      Height = 17
      Caption = 'Pen width'
      FocusControl = cBoxPenWidth
    end
    object lbHintText: TLabel
      Left = 280
      Top = 24
      Width = 48
      Height = 17
      Caption = 'Hint text'
      FocusControl = edtHintText
    end
    object lbHintPosition: TLabel
      Left = 520
      Top = 24
      Width = 74
      Height = 17
      Caption = 'Hint position'
      FocusControl = cBoxHintPosition
    end
    object cBoxPenColor: TColorBox
      Left = 16
      Top = 48
      Width = 144
      Height = 22
      Selected = clNavy
      Style = [cbStandardColors, cbPrettyNames]
      TabOrder = 0
      OnChange = SettingsChange
    end
    object cBoxPenWidth: TComboBox
      Left = 176
      Top = 48
      Width = 88
      Height = 25
      Style = csDropDownList
      ItemIndex = 1
      TabOrder = 1
      Text = '2'
      OnChange = SettingsChange
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '6'
        '8')
    end
    object edtHintText: TEdit
      Left = 280
      Top = 48
      Width = 224
      Height = 25
      TabOrder = 2
      Text = 'Sign here'
      OnChange = SettingsChange
    end
    object cBoxHintPosition: TComboBox
      Left = 520
      Top = 48
      Width = 168
      Height = 25
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      Text = 'Bottom center'
      OnChange = SettingsChange
      Items.Strings = (
        'Bottom center'
        'Top center'
        'Hidden')
    end
    object ckShowClearIcon: TCheckBox
      Left = 716
      Top = 50
      Width = 180
      Height = 21
      Caption = 'Show built-in clear icon'
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = SettingsChange
    end
  end
  object gBoxCapture: TGroupBox
    Left = 0
    Top = 176
    Width = 979
    Height = 360
    Align = alClient
    Caption = ' Draw your signature '
    TabOrder = 2
    ExplicitLeft = 1
    ExplicitTop = 171
    ExplicitWidth = 960
    ExplicitHeight = 97
    object SignatureCapture: TTMSFNCSignatureCapture
      Left = 2
      Top = 19
      Width = 975
      Height = 339
      Align = alClient
      ParentDoubleBuffered = False
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 0
      Pen.Color = clNavy
      Pen.Width = 2.000000000000000000
      TextPosition.Line.Color = clGray
      ClearSig.Position = cpBottomRight
      ClearSig.Image.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001800
        0000180806000000E0773DF8000000097048597300000EC300000EC301C76FA8
        640000015A4944415478DABD95817183300C456103466004BA01D92099A06483
        6682BA13944E906CD07482B0411881113242BE7A9F9E221B9B5C437CA723912D
        3DFB5B823C5B78E44F0338E74A3C3E6105EC077680EFF248C0371E6B3527C9BF
        E0774B01C6D1C356734F8375C59807BF0F56A23325B2E342481F495CE3F10A6B
        B8A90D7C436E1609444E524DE4D9CAAE4C4CC3C4355D2D7C3B4F221324BABFC7
        20DCF11E56D23F70AE0BDE4100523141E834BDF1B7B08FD03D25FB20719AE0AE
        EF021022729C025322D536163BE7046B4A554C2CF12E7E360081D2D96FCA251A
        8B1CB65F5EA64A78AA8A0A4A5299E4BFBDC0D2DCABB98190F425B37A4E4612AF
        D10290237C9B28606E72B55E008D7249F71E8380C8ABC20B8A403CA93440765E
        9BF81DFC6D961806E2BF2A28CDD9C4256B3C02F9ABAA11E0B2DB6EBD2B3973E8
        CAEBF07FA5015AFF9B23FE032285D13DFC9B4C88A8514AD93EEFA3BFD4B80259
        7AAE192BE517620000000049454E44AE426082}
      ExplicitLeft = 1
      ExplicitTop = 15
      ExplicitWidth = 956
      ExplicitHeight = 410
    end
  end
  object statusBar: TStatusBar
    Left = 0
    Top = 778
    Width = 979
    Height = 22
    Panels = <>
    SimplePanel = True
    ExplicitTop = 738
    ExplicitWidth = 960
  end
  object pnBody: TPanel
    Left = 0
    Top = 536
    Width = 979
    Height = 242
    Align = alBottom
    BevelOuter = bvNone
    Padding.Top = 10
    TabOrder = 4
    object gBoxMemory: TGroupBox
      Left = 641
      Top = 46
      Width = 338
      Height = 196
      Align = alRight
      Caption = ' Memory stream '
      TabOrder = 0
      ExplicitLeft = 640
      object lbMemoryHelp: TLabel
        Left = 13
        Top = 28
        Width = 305
        Height = 42
        AutoSize = False
        Caption = 
          'Store a copy, clear the pad, then restore it without using a fil' +
          'e.'
        WordWrap = True
      end
      object lbMemoryStatus: TLabel
        Left = 13
        Top = 128
        Width = 312
        Height = 34
        AutoSize = False
        Caption = 'No signature stored in memory.'
        WordWrap = True
      end
      object btnStoreMemory: TButton
        Left = 13
        Top = 80
        Width = 148
        Height = 34
        Caption = 'Store in &memory'
        TabOrder = 0
        OnClick = btnStoreMemoryClick
      end
      object btnRestoreMemory: TButton
        Left = 177
        Top = 80
        Width = 148
        Height = 34
        Caption = '&Restore'
        Enabled = False
        TabOrder = 1
        OnClick = btnRestoreMemoryClick
      end
    end
    object gBoxPreview: TGroupBox
      Left = 0
      Top = 46
      Width = 641
      Height = 196
      Align = alClient
      Caption = ' Export preview (click Update preview to refresh) '
      TabOrder = 1
      ExplicitLeft = 16
      ExplicitTop = 140
      ExplicitWidth = 568
      ExplicitHeight = 188
      object imgPreview: TImage
        Left = 2
        Top = 19
        Width = 637
        Height = 175
        Align = alClient
        Center = True
        Proportional = True
        Stretch = True
        ExplicitLeft = 16
        ExplicitTop = 28
        ExplicitWidth = 536
        ExplicitHeight = 144
      end
    end
    object pnActions: TPanel
      Left = 0
      Top = 10
      Width = 979
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 16
      ExplicitTop = 292
      ExplicitWidth = 928
      object btnClear: TButton
        Left = 0
        Top = 0
        Width = 120
        Height = 34
        Caption = '&Clear'
        TabOrder = 0
        OnClick = btnClearClick
      end
      object btnSave: TButton
        Left = 132
        Top = 0
        Width = 152
        Height = 34
        Caption = '&Save signature...'
        TabOrder = 1
        OnClick = btnSaveClick
      end
      object btnLoad: TButton
        Left = 296
        Top = 0
        Width = 152
        Height = 34
        Caption = '&Load signature...'
        TabOrder = 2
        OnClick = btnLoadClick
      end
      object btnPreview: TButton
        Left = 460
        Top = 0
        Width = 152
        Height = 34
        Caption = 'Update &preview'
        TabOrder = 3
        OnClick = btnPreviewClick
      end
      object btnExport: TButton
        Left = 624
        Top = 0
        Width = 152
        Height = 34
        Caption = '&Export PNG...'
        TabOrder = 4
        OnClick = btnExportClick
      end
    end
  end
  object dlgSaveSignature: TSaveDialog
    DefaultExt = 'sig'
    FileName = 'signature.sig'
    Filter = 'Signature files (*.sig)|*.sig'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Save signature data'
    Left = 384
    Top = 272
  end
  object dlgOpenSignature: TOpenDialog
    DefaultExt = 'sig'
    Filter = 'Signature files (*.sig)|*.sig'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Load signature data'
    Left = 496
    Top = 272
  end
  object dlgExportImage: TSaveDialog
    DefaultExt = 'png'
    FileName = 'signature.png'
    Filter = 'PNG images (*.png)|*.png'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Export signature as PNG'
    Left = 616
    Top = 272
  end
end
