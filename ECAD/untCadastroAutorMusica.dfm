object frmCadastroAutorMusica: TfrmCadastroAutorMusica
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro Partipa'#231#227'o M'#250'sica'
  ClientHeight = 364
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 364
    Align = alClient
    TabOrder = 0
    object Label7: TLabel
      Left = 144
      Top = 704
      Width = 84
      Height = 13
      Caption = 'NOM_ARTISTICO'
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 144
      Top = 1152
      Width = 35
      Height = 13
      Caption = 'BANCO'
      FocusControl = DBEdit8
    end
    object Label9: TLabel
      Left = 144
      Top = 1600
      Width = 45
      Height = 13
      Caption = 'AGENCIA'
      FocusControl = DBEdit9
    end
    object Label10: TLabel
      Left = 144
      Top = 2048
      Width = 35
      Height = 13
      Caption = 'CONTA'
      FocusControl = DBEdit10
    end
    object Label13: TLabel
      Left = 208
      Top = 736
      Width = 84
      Height = 13
      Caption = 'NOM_ARTISTICO'
      FocusControl = DBEdit13
    end
    object Label14: TLabel
      Left = 208
      Top = 1184
      Width = 35
      Height = 13
      Caption = 'BANCO'
      FocusControl = DBEdit14
    end
    object Label15: TLabel
      Left = 208
      Top = 1632
      Width = 45
      Height = 13
      Caption = 'AGENCIA'
      FocusControl = DBEdit15
    end
    object Label16: TLabel
      Left = 208
      Top = 2080
      Width = 35
      Height = 13
      Caption = 'CONTA'
      FocusControl = DBEdit16
    end
    object lblNomeMusica: TLabel
      Left = 16
      Top = 8
      Width = 80
      Height = 23
      Caption = 'M'#218'SICA: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -16
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 48
      Width = 35
      Height = 13
      Caption = 'AUTOR'
    end
    object Label11: TLabel
      Left = 249
      Top = 45
      Width = 76
      Height = 13
      Caption = 'PARTICIPA'#199#195'O'
    end
    object DBEdit1: TDBEdit
      Left = 144
      Top = 472
      Width = 784
      Height = 21
      DataField = 'NOME'
      TabOrder = 0
    end
    object DBEdit7: TDBEdit
      Left = 144
      Top = 920
      Width = 784
      Height = 21
      DataField = 'NOM_ARTISTICO'
      TabOrder = 1
    end
    object DBEdit8: TDBEdit
      Left = 144
      Top = 1368
      Width = 394
      Height = 21
      DataField = 'BANCO'
      TabOrder = 2
    end
    object DBEdit9: TDBEdit
      Left = 144
      Top = 1816
      Width = 69
      Height = 21
      DataField = 'AGENCIA'
      TabOrder = 3
    end
    object DBEdit10: TDBEdit
      Left = 144
      Top = 2264
      Width = 134
      Height = 21
      DataField = 'CONTA'
      TabOrder = 4
    end
    object DBEdit11: TDBEdit
      Left = 184
      Top = 464
      Width = 784
      Height = 21
      DataField = 'NOM_ARTISTICO'
      TabOrder = 5
    end
    object DBEdit12: TDBEdit
      Left = 208
      Top = 504
      Width = 784
      Height = 21
      DataField = 'NOME'
      TabOrder = 6
    end
    object DBEdit13: TDBEdit
      Left = 208
      Top = 952
      Width = 784
      Height = 21
      DataField = 'NOM_ARTISTICO'
      TabOrder = 7
    end
    object DBEdit14: TDBEdit
      Left = 208
      Top = 1400
      Width = 394
      Height = 21
      DataField = 'BANCO'
      TabOrder = 8
    end
    object DBEdit15: TDBEdit
      Left = 208
      Top = 1848
      Width = 69
      Height = 21
      DataField = 'AGENCIA'
      TabOrder = 9
    end
    object DBEdit16: TDBEdit
      Left = 208
      Top = 2296
      Width = 134
      Height = 21
      DataField = 'CONTA'
      TabOrder = 10
    end
    object grdParticipacao: TDBGrid
      Left = 1
      Top = 141
      Width = 339
      Height = 222
      Align = alBottom
      BiDiMode = bdLeftToRight
      DataSource = dtsGridParticipacao
      Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      ParentBiDiMode = False
      TabOrder = 11
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grdParticipacaoDblClick
      Columns = <
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'ID'
          Visible = False
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'IDAUTOR'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AUTOR'
          Width = 250
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'PERCENTUAL'
          Width = 75
          Visible = True
        end>
    end
    object btnSalvarAlterar: TButton
      Left = 249
      Top = 110
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 12
      OnClick = btnSalvarAlterarClick
    end
    object btnExcluirLimpar: TButton
      Left = 168
      Top = 110
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 13
      OnClick = btnSalvarAlterarClick
    end
    object cmbPercentual: TComboBox
      Left = 249
      Top = 64
      Width = 75
      Height = 21
      ItemIndex = 10
      TabOrder = 14
      Text = '100'
      Items.Strings = (
        '-'
        '10'
        '20'
        '30'
        '40'
        '50'
        '60'
        '70'
        '80'
        '90'
        '100')
    end
    object cmbAutorParticipacao: TDBLookupComboBox
      Left = 16
      Top = 64
      Width = 227
      Height = 21
      KeyField = 'IDAUTOR'
      ListField = 'AUTOR'
      ListSource = dtsCmbAutor
      TabOrder = 15
    end
  end
  object qryGridParticipacao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idMusica'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT ma.id,'
      '            ma.idAutor,'
      '             a.nome||'#39'('#39'||a.nome_artistico||'#39')'#39' as Autor,'
      '             ma.percentual'
      '  FROM musica m'
      ' INNER JOIN musica_autor ma ON m.idmusica = ma.idmusica'
      ' INNER JOIN autor a ON ma.idautor = a.idautor'
      ' WHERE m.idmusica = :idMusica')
    SQLConnection = ECAD.ConnectionECAD
    Left = 16
    Top = 168
    object qryGridParticipacaoID: TFMTBCDField
      FieldName = 'ID'
      Required = True
      Precision = 32
      Size = 0
    end
    object qryGridParticipacaoIDAUTOR: TFMTBCDField
      FieldName = 'IDAUTOR'
      Precision = 32
      Size = 0
    end
    object qryGridParticipacaoAUTOR: TWideStringField
      FieldName = 'AUTOR'
      Size = 122
    end
    object qryGridParticipacaoPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      Precision = 32
      Size = 0
    end
  end
  object dtspGridParticipacao: TDataSetProvider
    DataSet = qryGridParticipacao
    Left = 112
    Top = 168
  end
  object dtsGridParticipacao: TDataSource
    DataSet = cdtsGridParticipacao
    Left = 104
    Top = 232
  end
  object cdtsGridParticipacao: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dtspGridParticipacao'
    Left = 16
    Top = 232
  end
  object qryCmbAutor: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT  idAutor, nome||'#39'('#39'||nome_artistico||'#39')'#39' as autor'
      '  FROM autor'
      '  ORDER BY nome')
    SQLConnection = ECAD.ConnectionECAD
    Left = 200
    Top = 168
  end
  object dtspCmbAutor: TDataSetProvider
    DataSet = qryCmbAutor
    Left = 280
    Top = 168
  end
  object cdtsCmbAutor: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dtspCmbAutor'
    Left = 192
    Top = 232
  end
  object dtsCmbAutor: TDataSource
    DataSet = cdtsCmbAutor
    Left = 280
    Top = 232
  end
  object qryPerc_Total: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idMusica'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT m.idmusica, sum(ma.percentual) as Perc_Total'
      '  FROM musica m'
      ' INNER JOIN musica_autor ma ON m.idmusica = ma.idmusica'
      ' INNER JOIN autor a ON ma.idautor = a.idautor'
      ' WHERE m.idmusica = :idMusica'
      ' group by m.idmusica')
    SQLConnection = ECAD.ConnectionECAD
    Left = 144
    Top = 296
    object qryPerc_TotalIDMUSICA: TFMTBCDField
      FieldName = 'IDMUSICA'
      Precision = 32
    end
    object qryPerc_TotalPERC_TOTAL: TFMTBCDField
      FieldName = 'PERC_TOTAL'
      Precision = 32
    end
  end
end
