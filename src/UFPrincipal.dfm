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
    object edtDiretorio: TEdit
      AlignWithMargins = True
      Left = 189
      Top = 4
      Width = 526
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
      ExplicitLeft = 4
      ExplicitWidth = 711
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
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 185
      Height = 47
      Align = alLeft
      Caption = 'Diret'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      ExplicitLeft = 9
      ExplicitTop = 2
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
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 101
    Width = 1052
    Height = 553
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
        Width = 373
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Diretorio'
        Width = 656
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 1058
    Height = 49
    Align = alTop
    TabOrder = 3
    ExplicitTop = 8
    object edtDiretorioMoni: TEdit
      AlignWithMargins = True
      Left = 189
      Top = 4
      Width = 865
      Height = 41
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 56
      ExplicitWidth = 998
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 185
      Height = 47
      Align = alLeft
      Caption = 'Pasta Monitorada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 96
      ExplicitTop = 8
      ExplicitHeight = 41
    end
  end
  object dsArquivos: TDataSource
    DataSet = cdsArquivos
    Left = 256
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
    Left = 328
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
    Left = 408
    Top = 296
  end
end
