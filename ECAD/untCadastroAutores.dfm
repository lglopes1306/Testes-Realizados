object frmCadastroAutor: TfrmCadastroAutor
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Autores'
  ClientHeight = 418
  ClientWidth = 585
  Color = clBtnFace
  DefaultMonitor = dmMainForm
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
    Width = 585
    Height = 418
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
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 29
      Height = 13
      Caption = 'NOME'
    end
    object Label2: TLabel
      Left = 16
      Top = 91
      Width = 87
      Height = 13
      Caption = 'NOME ART'#205'STICO'
    end
    object Label6: TLabel
      Left = 16
      Top = 48
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Label11: TLabel
      Left = 161
      Top = 49
      Width = 61
      Height = 13
      Caption = 'IDENTIDADE'
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
    object grdAutor: TDBGrid
      Left = 1
      Top = 179
      Width = 583
      Height = 238
      Align = alBottom
      DataSource = ECAD.dtsAutor
      Options = [dgTitles, dgColumnResize, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      TabOrder = 16
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grdAutorDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_ARTISTICO'
          Title.Caption = 'NOME ART'#205'STICO'
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RG'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BANCO'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AGENCIA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDAUTOR'
          Visible = False
        end>
    end
    object edtNome: TEdit
      Left = 16
      Top = 22
      Width = 309
      Height = 21
      BiDiMode = bdLeftToRight
      CharCase = ecUpperCase
      Ctl3D = True
      ParentBiDiMode = False
      ParentCtl3D = False
      TabOrder = 11
    end
    object edtNomeArtistico: TEdit
      Left = 16
      Top = 107
      Width = 309
      Height = 21
      BiDiMode = bdLeftToRight
      CharCase = ecUpperCase
      ParentBiDiMode = False
      TabOrder = 14
    end
    object edtCPF: TEdit
      Left = 16
      Top = 64
      Width = 121
      Height = 21
      BiDiMode = bdLeftToRight
      CharCase = ecUpperCase
      ParentBiDiMode = False
      TabOrder = 12
    end
    object edtIdentidade: TEdit
      Left = 161
      Top = 64
      Width = 165
      Height = 21
      BiDiMode = bdLeftToRight
      CharCase = ecUpperCase
      ParentBiDiMode = False
      TabOrder = 13
    end
    object Panel2: TPanel
      Left = 332
      Top = 21
      Width = 237
      Height = 111
      BorderStyle = bsSingle
      Caption = 'Dados Banc'#225'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      VerticalAlignment = taAlignTop
      object Label5: TLabel
        Left = 103
        Top = 58
        Width = 35
        Height = 13
        Caption = 'CONTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 13
        Top = 59
        Width = 45
        Height = 13
        Caption = 'AGENCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 13
        Top = 13
        Width = 35
        Height = 13
        Caption = 'BANCO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtAgencia: TEdit
        Left = 13
        Top = 75
        Width = 69
        Height = 23
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        MaxLength = 10
        ParentBiDiMode = False
        TabOrder = 1
      end
      object cmbBanco: TComboBox
        Left = 13
        Top = 32
        Width = 197
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'ESCOLHA...'
        Items.Strings = (
          'SANTANDER'
          'ITAU'
          'NUBANK'
          'BRADESCO'
          'CAIXA'
          'BANCO DO BRASIL')
      end
      object edtConta: TEdit
        Left = 102
        Top = 75
        Width = 107
        Height = 23
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        MaxLength = 15
        ParentBiDiMode = False
        TabOrder = 2
      end
    end
    object btnSalvarAlterar: TButton
      Left = 494
      Top = 138
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 17
      OnClick = btnSalvarAlterarClick
    end
    object btnExcluirLimpar: TButton
      Left = 413
      Top = 138
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 18
      OnClick = btnSalvarAlterarClick
    end
  end
end
