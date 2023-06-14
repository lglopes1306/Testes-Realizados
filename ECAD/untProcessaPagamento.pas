unit untProcessaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr;

type
  TfrmProcessaPagamento = class(TForm)
    Panel1: TPanel;
    dtpDt_Inicial: TDateTimePicker;
    dtpDt_Final: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    grdPagamento: TDBGrid;
    btnProcessar: TButton;
    qryGrdPagamento: TSQLQuery;
    qryGrdPagamentoPERIODO: TWideStringField;
    qryGrdPagamentoMUSICA: TWideStringField;
    qryGrdPagamentoAUTOR: TWideStringField;
    qryGrdPagamentoPAGO: TBCDField;
    dstpGridPagamento: TDataSetProvider;
    cdsGridPagamento: TClientDataSet;
    dtsGrdPagamento: TDataSource;
    Label3: TLabel;
    edtValor: TEdit;
    qryProcessa: TSQLQuery;
    spProcessa: TSQLStoredProc;
    procedure btnProcessarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcessaPagamento: TfrmProcessaPagamento;

implementation
uses dtmECAD, untPublic;
{$R *.dfm}

procedure TfrmProcessaPagamento.btnProcessarClick(Sender: TObject);
begin
   Application.CreateForm(TECAD,ECAD);

   TRY

      spProcessa.Close;
      spProcessa.ParamByName('vDt_Inicial').AsString := DateToStr(dtpDt_Inicial.Date);
      spProcessa.ParamByName('vDt_Final').AsString   := DateToStr(dtpDt_Final.Date);
      spProcessa.ParamByName('VVERBA').AsFloat       := StrToFloat(edtValor.Text);
      spProcessa.ExecProc;


      Application.MessageBox('Pagamento Gerado Com Sucesso!','Atenção!',MB_OK);


      qryGrdPagamento.Close;
      qryGrdPagamento.ParamByName('Dt_Inicial').AsString := DateToStr(dtpDt_Inicial.Date);
      qryGrdPagamento.ParamByName('Dt_Final').AsString   := DateToStr(dtpDt_Final.Date);
      qryGrdPagamento.Open;

      cdsGridPagamento.Close;
      cdsGridPagamento.Open;

   EXCEPT on E: Exception do
      begin
           Application.MessageBox(pchar('ERROR: '+E.Message),'Processa Pagamento', MB_OK);
           FreeAndNil(ECAD);
           CloseModal;
      end;

   END;

  // FreeAndNil(ECAD);
end;

procedure TfrmProcessaPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 FreeAndNil(ECAD);
end;

end.
