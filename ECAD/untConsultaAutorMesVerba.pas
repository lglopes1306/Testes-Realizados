unit untConsultaAutorMesVerba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.ExtCtrls, Data.FMTBcd, Data.SqlExpr, Vcl.StdCtrls,
  Datasnap.DBClient, Datasnap.Provider;

type
  TfrmConsultaAutorMesVerba = class(TForm)
    Panel1: TPanel;
    cmbConsulta: TDBLookupComboBox;
    grdConsulta: TDBGrid;
    qryCmbConsulta: TSQLQuery;
    dstpCmbConsulta: TDataSetProvider;
    cdsCmbConsulta: TClientDataSet;
    dtsCmbPesquisa: TDataSource;
    qryCmbConsultaIDAUTOR: TFMTBCDField;
    qryCmbConsultaAUTOR: TWideStringField;
    Label1: TLabel;
    btnPesquisar: TButton;
    qryGrdConsulta: TSQLQuery;
    dstpGrdConsulta: TDataSetProvider;
    cdsGrdConsulta: TClientDataSet;
    dtsGrdConsulta: TDataSource;
    Label2: TLabel;
    cmbConsultaMes: TComboBox;
    qryGrdConsultaPERIODO: TWideStringField;
    qryGrdConsultaAUTOR: TWideStringField;
    qryGrdConsultaMUSICA: TWideStringField;
    qryGrdConsultaPAGO: TFMTBCDField;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaAutorMesVerba: TfrmConsultaAutorMesVerba;

implementation
uses dtmECAD;
{$R *.dfm}

procedure TfrmConsultaAutorMesVerba.btnPesquisarClick(Sender: TObject);
begin
    if cmbConsulta.Text = '' then
    begin
       Application.MessageBox('Escolha um Autor','Aten��o',MB_OK+MB_ICONEXCLAMATION);
       cmbConsulta.SetFocus;
       exit;
    end;

    if cmbConsultaMes.ItemIndex < 1 then
    begin
       Application.MessageBox('Escolha um M�s','Aten��o',MB_OK+MB_ICONEXCLAMATION);
       cmbConsultaMes.SetFocus;
       exit;
    end;



    try

      qryGrdConsulta.Close;
      qryGrdConsulta.ParamByName('MES').AsString      := IntToStr(cmbConsultaMes.ItemIndex);
      qryGrdConsulta.ParamByName('idAutor').AsInteger := cmbConsulta.KeyValue;
      qryGrdConsulta.Open;

      cdsGrdConsulta.Close;
      cdsGrdConsulta.Open;


    Except on E: Exception do
      begin
           Application.MessageBox(pchar('ERROR: '+E.Message),'Consulta', MB_OK);
           FreeAndNil(ECAD);
           CloseModal;
      end;

    end;



end;



procedure TfrmConsultaAutorMesVerba.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(ECAD);
end;

procedure TfrmConsultaAutorMesVerba.FormCreate(Sender: TObject);
begin

    Application.CreateForm(TECAD,ECAD);

    try

      qryCmbConsulta.Close;
      qryCmbConsulta.Open;

      cdsCmbConsulta.Close;
      cdsCmbConsulta.Open;


    Except on E: Exception do
      begin
           Application.MessageBox(pchar('ERROR: '+E.Message),'Consulta', MB_OK);
           FreeAndNil(ECAD);
           CloseModal;
      end;

    end;

end;

end.