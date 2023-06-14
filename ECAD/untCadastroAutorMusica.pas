unit untCadastroAutorMusica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Data.FMTBcd,
  Data.SqlExpr, Datasnap.DBClient, Datasnap.Provider;

type
  TfrmCadastroAutorMusica = class(TForm)
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    grdParticipacao: TDBGrid;
    lblNomeMusica: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    btnSalvarAlterar: TButton;
    btnExcluirLimpar: TButton;
    qryGridParticipacao: TSQLQuery;
    cmbPercentual: TComboBox;
    dtspGridParticipacao: TDataSetProvider;
    dtsGridParticipacao: TDataSource;
    cdtsGridParticipacao: TClientDataSet;
    qryCmbAutor: TSQLQuery;
    dtspCmbAutor: TDataSetProvider;
    cdtsCmbAutor: TClientDataSet;
    dtsCmbAutor: TDataSource;
    qryGridParticipacaoID: TFMTBCDField;
    qryGridParticipacaoAUTOR: TWideStringField;
    qryGridParticipacaoPERCENTUAL: TFMTBCDField;
    qryPerc_Total: TSQLQuery;
    qryPerc_TotalIDMUSICA: TFMTBCDField;
    qryPerc_TotalPERC_TOTAL: TFMTBCDField;
    cmbAutorParticipacao: TDBLookupComboBox;
    qryGridParticipacaoIDAUTOR: TFMTBCDField;
    procedure BotaoClicado(NomeBotao : string);
    procedure btnSalvarAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //procedure grdMusicaDblClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdParticipacaoDblClick(Sender: TObject);
    function RetornaPercent(idMusica : integer): integer;

  private
    { Private declarations }
  public
    idAutorMusica, idMusicaParticipacao: string;
    Tot_Perc : Integer;
    { Public declarations }
  end;

var
  frmCadastroAutorMusica: TfrmCadastroAutorMusica;

implementation
uses dtmECAD, untPrincipal, untPublic, untCadastroMusica;
{$R *.dfm}

procedure TfrmCadastroAutorMusica.BotaoClicado(NomeBotao : string);
var
   Query, Autor: string;
begin

    try

        if (NomeBotao = 'Excluir') then
        begin
          if (Application.MessageBox(pchar('Deseja Excluir o M�sica '+Autor+'?'),'Aten��o!',MB_YESNO+MB_ICONWARNING) = ID_YES) then
           begin

            Query :=         'delete from musica_autor';
            Query := Query + ' where id = '+ idAutorMusica;
            Query := Query + '   and idMusica = '+ idMusicaParticipacao;

            AlteraDados(Query);

            Application.MessageBox('Participa��o Exclu�da Com Sucesso!','Cadastro Autor',MB_OK);

            Limpar(frmCadastroAutorMusica);

            qryGridParticipacao.Close;
            qryGridParticipacao.Open;

            cdtsGridParticipacao.Close;
            cdtsGridParticipacao.Open;

            Exit;

           end;
        end;

        if (cmbPercentual.Text = '-') OR (cmbAutorParticipacao.Text = '') then
        begin
          Application.MessageBox('Todos os Campos S�o Obrigat�rios!','Aten��o!',MB_OK);
          exit;
        end;

        Tot_Perc := RetornaPercent(StrToInt(idMusicaParticipacao));

        if (Tot_Perc + StrToInt(cmbPercentual.Text) > 100) then
        begin
          Application.MessageBox('Total de Participa��o maior que 100%','Aten��o"',MB_OK+MB_ICONEXCLAMATION);
          cmbPercentual.SetFocus;
          exit;
        end;

        Tot_Perc      := Tot_Perc + StrToInt(cmbPercentual.Text);
        Autor         := cmbAutorParticipacao.Text;
        idAutorMusica := IntToStr(cmbAutorParticipacao.KeyValue);


        if (NomeBotao = 'Salvar') then
         begin

            Query := 'Insert Into musica_autor(idMusica,idAutor,percentual) values (';
            Query := Query + ''''+idMusicaParticipacao+''',';
            Query := Query + ''''+idAutorMusica+''',';
            Query := Query + ''''+cmbPercentual.Text+''')';

            AlteraDados(Query);

            Application.MessageBox('Participa��o Inclu�da Com Sucesso!','Aten��o!',MB_OK);

         end


    Except on E: Exception do
     begin
        Application.MessageBox(pchar('ERROR: '+E.Message),'Cadastro Participa��o', MB_OK);
        FreeAndNil(ECAD);
        CloseModal;
     end;

    end;

     Limpar(frmCadastroAutorMusica);

     qryGridParticipacao.Close;
     qryGridParticipacao.Open;

     cdtsGridParticipacao.Close;
     cdtsGridParticipacao.Open;


end;

procedure TfrmCadastroAutorMusica.btnLimparClick(Sender: TObject);
begin
   Limpar(frmCadastroAutorMusica);

end;

procedure TfrmCadastroAutorMusica.btnSalvarAlterarClick(Sender: TObject);
begin
    BotaoClicado(TButton(sender).Caption);
end;

procedure TfrmCadastroAutorMusica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(ECAD);

end;

procedure TfrmCadastroAutorMusica.FormCreate(Sender: TObject);
begin

  lblNomeMusica.Caption := 'M�SICA: '+frmCadastroMusica.edtNomeMusica.Text;
  idMusicaParticipacao  := frmCadastroMusica.idMusica;
  idAutorMusica         := '0';

  Application.CreateForm(TECAD,ECAD);

  try

     qryCmbAutor.Close;
     qryCmbAutor.Open;

     cdtsCmbAutor.Close;
     cdtsCmbAutor.Open;

     qryGridParticipacao.Close;
     qryGridParticipacao.ParamByName('idMusica').AsInteger := StrToInt(idMusicaParticipacao);
     qryGridParticipacao.Open;

     cdtsGridParticipacao.Close;
     cdtsGridParticipacao.Open;


  Except on E: Exception do
    begin
         Application.MessageBox(pchar('ERROR: '+E.Message),'Cadastro Participa��o', MB_OK);
         FreeAndNil(ECAD);
         CloseModal;
    end;

  end;

end;

procedure TfrmCadastroAutorMusica.grdParticipacaoDblClick(Sender: TObject);
var
  ind : string;
begin

   idAutorMusica := grdParticipacao.Fields[0].Value;
   cmbAutorParticipacao.KeyValue := StrToInt(grdParticipacao.Fields[1].Value);

   if (length(trim(grdParticipacao.Fields[3].Value)) = 3) then
       cmbPercentual.ItemIndex   := 10
   else
       cmbPercentual.ItemIndex := StrToInt(copy(grdParticipacao.Fields[3].Value,1,1));

   btnExcluirLimpar.Caption := 'Excluir';



end;

function TfrmCadastroAutorMusica.RetornaPercent(idMusica : integer): integer;
var
   Resposta : Integer;
begin
     Resposta := 0;

     qryPerc_Total.Close;
     qryPerc_Total.ParamByName('idMusica').AsInteger := idMusica;
     qryPerc_Total.Open;

     if not(qryPerc_Total.Eof) then
        Resposta := qryPerc_Total.FieldByName('PERC_TOTAL').AsInteger;

     Result := Resposta;
end;



end.
