unit untConsultaMusicaAutorNacionalidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.ExtCtrls, Data.FMTBcd, Data.SqlExpr, Vcl.StdCtrls,
  Datasnap.DBClient, Datasnap.Provider;

type
  TfrmConsultaMusicaAutorNacionalidade = class(TForm)
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
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaMusicaAutorNacionalidade: TfrmConsultaMusicaAutorNacionalidade;

implementation
uses dtmECAD;
{$R *.dfm}

procedure TfrmConsultaMusicaAutorNacionalidade.btnPesquisarClick(Sender: TObject);
begin
    if cmbConsulta.Text = '' then
    begin
       Application.MessageBox('Escolha um Autor','Aten��o',MB_OK+MB_ICONEXCLAMATION);
       cmbConsulta.SetFocus;
       exit;
    end;

    try

      qryGrdConsulta.Close;
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

procedure TfrmConsultaMusicaAutorNacionalidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(ECAD);
end;

procedure TfrmConsultaMusicaAutorNacionalidade.FormCreate(Sender: TObject);
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
