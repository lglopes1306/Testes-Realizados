object frmConsultaMesAutorVerba: TfrmConsultaMesAutorVerba
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Consulta Verba Total do M'#234's'
  ClientHeight = 319
  ClientWidth = 381
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 381
    Height = 319
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 272
    object Label1: TLabel
      Left = 8
      Top = 15
      Width = 20
      Height = 13
      Caption = 'M'#202'S'
    end
    object grdConsulta: TDBGrid
      Left = 1
      Top = 72
      Width = 379
      Height = 246
      Align = alBottom
      DataSource = dtsGrdConsulta
      Options = [dgTitles, dgColumnResize, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PERIODO'
          Title.Caption = 'PER'#205'ODO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AUTOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAGO'
          Visible = True
        end>
    end
    object btnPesquisar: TButton
      Left = 184
      Top = 28
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
    object cmbConsultaMes: TComboBox
      Left = 8
      Top = 30
      Width = 153
      Height = 21
      TabOrder = 2
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
  object qryGrdConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptInput
      end>
    SQL.Strings = (
      ' select ('#39'De '#39'||pp.dt_inicial||'#39' at'#233' '#39'|| pp.dt_final) periodo,'
      '        aut.Nome||'#39'('#39'||aut.nome_artistico||'#39')'#39' Autor,'
      '        SUM(pp.valorfinal) Pago'
      '   from pagamento_processado pp'
      '  inner join musica m '
      '     on m.idMusica = pp.idmusica'
      '  inner join autor aut'
      '     on aut.idautor = pp.idautor'
      '  where pp.Dt_Inicial LIKE '#39'%'#39' || :MES || '#39'%'#39
      
        '  group by pp.dt_inicial, pp.dt_final, aut.Nome, aut.nome_artist' +
        'ico'
      
        '  order by pp.dt_inicial, pp.dt_final, aut.Nome, aut.nome_artist' +
        'ico')
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
    Left = 184
    Top = 240
  end
end
