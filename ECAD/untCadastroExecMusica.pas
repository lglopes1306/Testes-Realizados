unit untCadastroExecMusica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Menus,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr;

type
  TfrmCadastroExecMusica = class(TForm)
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
    grdExec_Musica: TDBGrid;
    Label1: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    btnSalvarAlterar: TButton;
    btnExcluirLimpar: TButton;
    dtpExecucao: TDateTimePicker;
    cmbNomeMusica: TDBLookupComboBox;
    edtQuantidade: TEdit;
    qryCmbMusica: TSQLQuery;
    qryCmbMusicaIDMUSICA: TFMTBCDField;
    qryCmbMusicaNOME: TWideStringField;
    dstpCmbMusica: TDataSetProvider;
    cdsCmbMusica: TClientDataSet;
    dtsCmbMusica: TDataSource;
    procedure BotaoClicado(NomeBotao : string);
    procedure btnSalvarAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdExec_MusicaDblClick(Sender: TObject);

  private
    { Private declarations }
  public
    idExecucao: string
    { Public declarations }
  end;

var
  frmCadastroExecMusica: TfrmCadastroExecMusica;

implementation
uses untPrincipal, untPublic, dtmECAD;
{$R *.dfm}

procedure TfrmCadastroExecMusica.BotaoClicado(NomeBotao : string);
var
   Query: string;
begin

    if (CamposObrigatorios(frmCadastroExecMusica) = False) then
    exit;

    try
       if (NomeBotao = 'Salvar') then
         begin

            Query := 'Insert Into Exec_Musica(idMusica,Dt_Tocou,Qtde) values (';
            Query := Query + ''''+IntToStr(cmbNomeMusica.KeyValue)+''',';
            Query := Query + ''''+DateToStr(dtpExecucao.Date)+''',';
            Query := Query + ''''+edtQuantidade.Text+''')';

            AlteraDados(Query);

            Application.MessageBox('Execu��o Inclu�da Com Sucesso!','Aten��o!',MB_OK);

         end
       else if (NomeBotao = 'Alterar') then
         begin

             if (Application.MessageBox(pchar('Deseja Alterar a M�sica '+cmbNomeMusica.Text+'?'),'Aten��o!',MB_YESNO+MB_ICONWARNING) = ID_YES) then
             begin

                Query :=         'update Exec_Musica';
                Query := Query + '   set idMusica = '''+IntToStr(cmbNomeMusica.KeyValue)+''',';
                Query := Query + '       Dt_Tocou = '''+ DateToStr(dtpExecucao.Date)+''',';
                Query := Query + '       Qtde = '''+edtQuantidade.Text+'''';
                Query := Query + ' where id = '+ idExecucao;

                AlteraDados(Query);


                Application.MessageBox('M�sica Alterada Com Sucesso!','Aten��o!',MB_OK);

             end;

         end
       else if (NomeBotao = 'Excluir') then
         begin
            if (Application.MessageBox(pchar('Deseja Excluir a M�sica '+cmbNomeMusica.Text+'?'),'Aten��o!',MB_YESNO+MB_ICONWARNING) = ID_YES) then
             begin

              Query :=         'delete from Exec_Musica';
              Query := Query + ' where id = '+ idExecucao;

              AlteraDados(Query);

              Application.MessageBox('M�sica Exclu�da Com Sucesso!','Cadastro Autor',MB_OK);

             end;
         end;

    Except on E: Exception do
     begin
        Application.MessageBox(pchar('ERROR: '+E.Message),'Cadastro Execu��o', MB_OK);
        FreeAndNil(ECAD);
        CloseModal;
     end;

    end;

     Limpar(frmCadastroExecMusica);

     ECAD.qryExec_Musica.Close;
     ECAD.qryExec_Musica.Open;

     ECAD.cdtsExec_Musica.Close;
     ECAD.cdtsExec_Musica.Open;


end;

procedure TfrmCadastroExecMusica.btnLimparClick(Sender: TObject);
begin
   Limpar(frmCadastroExecMusica);

end;

procedure TfrmCadastroExecMusica.btnSalvarAlterarClick(Sender: TObject);
begin
    BotaoClicado(TButton(sender).Caption);
end;


procedure TfrmCadastroExecMusica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(ECAD);

end;

procedure TfrmCadastroExecMusica.FormCreate(Sender: TObject);
begin

  Application.CreateForm(TECAD,ECAD);

  try

     ECAD.qryExec_Musica.Close;
     ECAD.qryExec_Musica.Open;

     ECAD.cdtsExec_Musica.Close;
     ECAD.cdtsExec_Musica.Open;

     qryCmbMusica.Close;
     qryCmbMusica.Open;

     cdsCmbMusica.Close;
     cdsCmbMusica.Open;

  Except on E: Exception do
    begin
         Application.MessageBox(pchar('ERROR: '+E.Message),'Cadastro Execu��o', MB_OK);
         FreeAndNil(ECAD);
         CloseModal;
    end;

  end;

end;

procedure TfrmCadastroExecMusica.grdExec_MusicaDblClick(Sender: TObject);
begin

   idExecucao             := grdExec_Musica.Fields[0].Value;
   cmbNomeMusica.KeyValue := StrToInt(grdExec_Musica.Fields[1].Value);
   dtpExecucao.Date       := StrToDate(grdExec_Musica.Fields[3].Value);
   edtQuantidade.Text     := grdExec_Musica.Fields[4].Value;

   btnSalvarAlterar.Caption      := 'Alterar';
   btnExcluirLimpar.Caption      := 'Excluir';

end;

end.
