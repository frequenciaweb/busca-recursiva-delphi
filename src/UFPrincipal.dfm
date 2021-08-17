object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Busca Recursiva'
  ClientHeight = 676
  ClientWidth = 1058
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1058
    Height = 49
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -16
    ExplicitTop = -3
    object edtDiretorio: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 711
      Height = 41
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'D:\'
      ExplicitWidth = 958
      ExplicitHeight = 33
    end
    object cbTipoArquivo: TComboBox
      AlignWithMargins = True
      Left = 721
      Top = 4
      Width = 145
      Height = 41
      Align = alRight
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 1
      Text = 'pdf'
      Items.Strings = (
        'pdf'
        'txt'
        'xml'
        'json'
        'docx'
        'xlsx'
        'csv'
        'pas'
        'dpr'
        'dfm')
      ExplicitLeft = 817
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 872
      Top = 4
      Width = 182
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object btnCancelar: TButton
        AlignWithMargins = True
        Left = -69
        Top = 3
        Width = 75
        Height = 35
        Align = alRight
        Caption = 'Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnClick = btnCancelarClick
        ExplicitLeft = 84
      end
      object btnBuscar: TButton
        AlignWithMargins = True
        Left = 12
        Top = 3
        Width = 86
        Height = 35
        Align = alRight
        Caption = 'Buscar'
        TabOrder = 1
        OnClick = btnBuscarClick
        ExplicitLeft = 968
        ExplicitTop = 5
        ExplicitHeight = 41
      end
      object btnExportar: TButton
        AlignWithMargins = True
        Left = 104
        Top = 3
        Width = 75
        Height = 35
        Align = alRight
        Caption = 'Exportar'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnExportarClick
        ExplicitLeft = 107
        ExplicitTop = 7
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 657
    Width = 1058
    Height = 19
    Panels = <
      item
        Text = 'Registros (0)'
        Width = 100
      end
      item
        Text = 'Status: Parado'
        Width = 100
      end
      item
        Width = 200
      end>
    ExplicitLeft = 672
    ExplicitTop = 496
    ExplicitWidth = 0
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 52
    Width = 1052
    Height = 602
    Align = alClient
    DataSource = dsArquivos
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Arquivo'
        Width = 292
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Diretorio'
        Title.Caption = 'Diret'#243'rio'
        Width = 750
        Visible = True
      end>
  end
  object dsArquivos: TDataSource
    DataSet = cdsArquivos
    Left = 368
    Top = 296
  end
  object cdsArquivos: TClientDataSet
    PersistDataPacket.Data = {
      540000009619E0BD010000001800000002000000000003000000540009446972
      65746F72696F020049000000010005574944544802000200FF00074172717569
      766F020049000000010005574944544802000200FF000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 296
    object cdsArquivosDiretorio: TStringField
      FieldName = 'Diretorio'
      Size = 255
    end
    object cdsArquivosArquivo: TStringField
      FieldName = 'Arquivo'
      Size = 255
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = '*.csv|Arquivo CSV'
    Left = 512
    Top = 296
  end
end
