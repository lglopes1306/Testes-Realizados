object ECAD: TECAD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 323
  Width = 335
  object qryAutores: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT IdAutor,'
      '             Nome,'
      '             Nome_Artistico,'
      '             CPF,'
      '             RG,'
      '             Banco,'
      '            Agencia,'
      '            Conta'
      ' FROM Autor'
      'ORDER BY Nome')
    SQLConnection = ConnectionECAD
    Left = 104
    Top = 16
    object qryAutoresNOME: TWideStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object qryAutoresNOME_ARTISTICO: TWideStringField
      FieldName = 'NOME_ARTISTICO'
      Size = 60
    end
    object qryAutoresCPF: TWideStringField
      FieldName = 'CPF'
      Size = 12
    end
    object qryAutoresRG: TWideStringField
      FieldName = 'RG'
      Size = 15
    end
    object qryAutoresBANCO: TWideStringField
      FieldName = 'BANCO'
      Size = 30
    end
    object qryAutoresAGENCIA: TWideStringField
      FieldName = 'AGENCIA'
      Size = 5
    end
    object qryAutoresCONTA: TWideStringField
      FieldName = 'CONTA'
      Size = 10
    end
    object qryAutoresIDAUTOR: TFMTBCDField
      FieldName = 'IDAUTOR'
      Required = True
      Precision = 32
      Size = 0
    end
  end
  object qryAlterar: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nome_artistico'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cpf'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'rg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'banco'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'agencia'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'conta'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'Insert Into autor(nome,nome_artistico,cpf,rg,banco,agencia,conta' +
        ')'
      
        '    values (:nome,:nome_artistico,:cpf,:rg,:banco,:agencia,:cont' +
        'a)')
    SQLConnection = ConnectionECAD
    Left = 72
    Top = 264
  end
  object dspAutor: TDataSetProvider
    DataSet = qryAutores
    Left = 160
    Top = 16
  end
  object cdtsAutor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAutor'
    Left = 216
    Top = 16
  end
  object dtsAutor: TDataSource
    DataSet = cdtsAutor
    Left = 280
    Top = 16
  end
  object qryMusica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT idMusica,'
      '             Nome,'
      '             nacionalidade,'
      '             dt_inscricao'
      '  FROM Musica'
      ' ORDER BY Nome')
    SQLConnection = ConnectionECAD
    Left = 88
    Top = 72
    object qryMusicaNOME: TWideStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryMusicaNACIONALIDADE: TWideStringField
      FieldName = 'NACIONALIDADE'
    end
    object qryMusicaDT_INSCRICAO: TSQLTimeStampField
      FieldName = 'DT_INSCRICAO'
    end
    object qryMusicaIDMUSICA: TFMTBCDField
      FieldName = 'IDMUSICA'
      Required = True
      Precision = 32
      Size = 0
    end
  end
  object dspMusica: TDataSetProvider
    DataSet = qryMusica
    Left = 144
    Top = 72
  end
  object cdtsMusica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMusica'
    Left = 200
    Top = 72
  end
  object dtsMusica: TDataSource
    DataSet = cdtsMusica
    Left = 264
    Top = 72
  end
  object dspExec_Musica: TDataSetProvider
    DataSet = qryExec_Musica
    Left = 144
    Top = 120
  end
  object qryExec_Musica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT em.idExec_Musica id,'
      '       em.idmusica,'
      '       m.nome,'
      '       em.dt_tocou,'
      '       em.qtde'
      ' FROM EXEC_MUSICA EM'
      'INNER JOIN MUSICA M '
      '   ON m.idmusica = em.idmusica')
    SQLConnection = ConnectionECAD
    Left = 88
    Top = 120
    object qryExec_MusicaID: TFMTBCDField
      FieldName = 'ID'
      Required = True
      Precision = 32
      Size = 0
    end
    object qryExec_MusicaIDMUSICA: TFMTBCDField
      FieldName = 'IDMUSICA'
      Precision = 32
      Size = 0
    end
    object qryExec_MusicaNOME: TWideStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryExec_MusicaDT_TOCOU: TSQLTimeStampField
      FieldName = 'DT_TOCOU'
    end
    object qryExec_MusicaQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 32
      Size = 0
    end
  end
  object cdtsExec_Musica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExec_Musica'
    Left = 200
    Top = 120
  end
  object dtsExec_Musica: TDataSource
    DataSet = cdtsExec_Musica
    Left = 264
    Top = 120
  end
  object ConnectionECAD: TSQLConnection
    ConnectionName = 'ConnectionECAD'
    DriverName = 'DevartOracleDirect'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'DataBase=xe'
      'ErrorResourceFile='
      'HostName=localhost:1521'
      'LocaleCode=0000'
      'Password=LUIZ_ECAD'
      'Oracle TransIsolation=ReadCommitted'
      'User_Name=system'
      'UseQuoteChar=False'
      'UseUnicode=True'
      'GetDriverFunc=getSQLDriverORADirect'
      'LibraryName=dbexpoda41.dll'
      'VendorLib=dbexpoda41.dll'
      'ProductName=DevartOracle'
      'IPVersion=IPv4'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver260.' +
        'bpl'
      
        'MetaDataPackageLoader=TDBXDevartOracleMetaDataCommandFactory,Dbx' +
        'DevartOracleDriver260.bpl'
      'DriverUnit=DBXDevartOracle')
    Connected = True
    Left = 32
    Top = 16
  end
end
