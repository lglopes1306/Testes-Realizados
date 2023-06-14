object frmConsultaMusicaAutorNacionalidade: TfrmConsultaMusicaAutorNacionalidade
  Left = 0
  Top = 0
  Caption = 'Consulta M'#250'sica por Naconalidade e Autor'
  ClientHeight = 319
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 398
    Height = 319
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 447
    object Label1: TLabel
      Left = 8
      Top = 15
      Width = 35
      Height = 13
      Caption = 'AUTOR'
    end
    object cmbConsulta: TDBLookupComboBox
      Left = 8
      Top = 32
      Width = 281
      Height = 21
      KeyField = 'IDAUTOR'
      ListField = 'AUTOR'
      ListSource = dtsCmbPesquisa
      TabOrder = 0
    end
    object grdConsulta: TDBGrid
      Left = 1
      Top = 72
      Width = 396
      Height = 246
      Align = alBottom
      DataSource = dtsGrdConsulta
      Options = [dgTitles, dgColumnResize, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NACIONALIDADE'
          Width = 139
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDE'
          Title.Caption = 'QUANTIDADE'
          Width = 224
          Visible = True
        end>
    end
    object btnPesquisar: TButton
      Left = 304
      Top = 28
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesquisarClick
    end
  end
  object qryCmbConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT  idAutor, nome||'#39'('#39'||nome_artistico||'#39')'#39' as autor'
      '  FROM autor'
      '  ORDER BY nome')
    SQLConnection = ECAD.ConnectionECAD
    Left = 32
    Top = 104
    object qryCmbConsultaIDAUTOR: TFMTBCDField
      FieldName = 'IDAUTOR'
      Required = True
      Precision = 32
      Size = 0
    end
    object qryCmbConsultaAUTOR: TWideStringField
      FieldName = 'AUTOR'
      Size = 122
    end
  end
  object dstpCmbConsulta: TDataSetProvider
    DataSet = qryCmbConsulta
    Left = 120
    Top = 104
  end
  object cdsCmbConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dstpCmbConsulta'
    Left = 200
    Top = 104
  end
  object dtsCmbPesquisa: TDataSource
    DataSet = cdsCmbConsulta
    Left = 280
    Top = 104
  end
  object qryGrdConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idAutor'
        ParamType = ptInput
        Value = '50'
      end>
    SQL.Strings = (
      'Select  mus.Nacionalidade,'
      '        count(*) Qtde'
      '  from autor aut'
      ' inner join musica_autor mua'
      '    on mua.idAutor = aut.idautor'
      ' inner join musica mus'
      '    on mus.idMusica = mua.idmusica'
      ' where aut.idAutor = :idAutor'
      ' group by mus.Nacionalidade;')
    SQLConnection = ECAD.ConnectionECAD
    Left = 32
    Top = 184
  end
  object dstpGrdConsulta: TDataSetProvider
    DataSet = qryGrdConsulta
    Left = 120
    Top = 184
  end
  object cdsGrdConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dstpGrdConsulta'
    Left = 200
    Top = 184
  end
  object dtsGrdConsulta: TDataSource
    DataSet = cdsGrdConsulta
    Left = 280
    Top = 184
  end
end
