object frmConsultaMusicaData: TfrmConsultaMusicaData
  Left = 0
  Top = 0
  Caption = 'Consulta M'#250'sica por Data'
  ClientHeight = 319
  ClientWidth = 302
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
    Width = 302
    Height = 319
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 398
    object Label1: TLabel
      Left = 8
      Top = 15
      Width = 27
      Height = 13
      Caption = 'DATA'
    end
    object grdConsulta: TDBGrid
      Left = 1
      Top = 72
      Width = 300
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
          FieldName = 'NOME_MUSICA'
          Title.Caption = 'M'#218'SICA'
          Visible = True
        end>
    end
    object btnPesquisar: TButton
      Left = 216
      Top = 28
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
    object dtpConsulta: TDateTimePicker
      Left = 8
      Top = 32
      Width = 186
      Height = 21
      Date = 44852.000000000000000000
      Time = 0.910188171299523700
      TabOrder = 2
    end
  end
  object qryGrdConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'Dt_Consulta'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT mu.Nome nome_musica '
      '  FROM EXEC_MUSICA emu'
      '  inner join musica mu '
      '   on mu.idMusica = emu.idMusica'
      '   where dt_tocou = to_date(:Dt_Consulta,'#39'DD-MM-YYYY'#39');')
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
