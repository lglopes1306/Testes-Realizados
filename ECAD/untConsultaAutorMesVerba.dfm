object frmConsultaAutorMesVerba: TfrmConsultaAutorMesVerba
  Left = 0
  Top = 0
  Caption = 'Consulta Verba por Autor e M'#234's'
  ClientHeight = 364
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 490
    Height = 364
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 447
    ExplicitHeight = 319
    object Label1: TLabel
      Left = 8
      Top = 15
      Width = 35
      Height = 13
      Caption = 'AUTOR'
    end
    object Label2: TLabel
      Left = 320
      Top = 13
      Width = 20
      Height = 13
      Caption = 'M'#202'S'
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
      Top = 96
      Width = 488
      Height = 267
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
          FieldName = 'PERIODO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AUTOR'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MUSICA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAGO'
          Visible = True
        end>
    end
    object btnPesquisar: TButton
      Left = 398
      Top = 65
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesquisarClick
    end
    object cmbConsultaMes: TComboBox
      Left = 320
      Top = 32
      Width = 153
      Height = 21
      TabOrder = 3
      Items.Strings = (
        ''
        'JANEIRO'
        'FEVEREIRO'
        'MAR'#199'O'
        'ABRIL'
        'MAIO'
        'JUNHO'
        'JULHO'
        'AGOSTO'
        'SETEMBRO'
        'OUTUBRO'
        'NOVEMBRO'
        'DEZEMBRO')
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
    Left = 288
    Top = 104
  end
  object qryGrdConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idAutor'
        ParamType = ptInput
        Value = '50'
      end>
    SQL.Strings = (
      ' select ('#39'De '#39'||pp.dt_inicial||'#39' at'#233' '#39'|| pp.dt_final) periodo,'
      '        aut.Nome||'#39'('#39'||aut.nome_artistico||'#39')'#39' Autor,'
      '        m.Nome Musica,'
      '        SUM(pp.valorfinal) Pago'
      '   from pagamento_processado pp'
      '  inner join musica m '
      '     on m.idMusica = pp.idmusica'
      '  inner join autor aut'
      '     on aut.idautor = pp.idautor'
      '  where pp.Dt_Inicial LIKE '#39'%'#39' || :MES || '#39'%'#39
      '    and pp.idAutor = :idAutor'
      
        '  group by pp.dt_inicial, pp.dt_final, aut.Nome, aut.nome_artist' +
        'ico, m.Nome '
      
        '  order by pp.dt_inicial, pp.dt_final, aut.Nome, aut.nome_artist' +
        'ico, m.Nome ')
    SQLConnection = ECAD.ConnectionECAD
    Left = 32
    Top = 184
    object qryGrdConsultaPERIODO: TWideStringField
      FieldName = 'PERIODO'
      Size = 24
    end
    object qryGrdConsultaAUTOR: TWideStringField
      FieldName = 'AUTOR'
      Size = 122
    end
    object qryGrdConsultaMUSICA: TWideStringField
      FieldName = 'MUSICA'
      Size = 60
    end
    object qryGrdConsultaPAGO: TFMTBCDField
      FieldName = 'PAGO'
      Precision = 32
    end
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
