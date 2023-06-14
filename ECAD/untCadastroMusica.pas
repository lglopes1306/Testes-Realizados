unit untCadastroMusica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Menus;

type
  TfrmCadastroMusica = class(TForm)
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
    grdMusica: TDBGrid;
    Label1: TLabel;
    edtNomeMusica: TEdit;
    Label6: TLabel;
    Label11: TLabel;
    btnSalvarAlterar: TButton;
    btnExcluirLimpar: TButton;
    dtpInscricao: TDateTimePicker;
    cmbNacionalidade: TComboBox;
    MainMenu1: TMainMenu;
    CadastrarParticipacao: TMenuItem;
    procedure BotaoClicado(NomeBotao : string);
    procedure btnSalvarAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //procedure grdMusicaDblClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdMusicaDblClick(Sender: TObject);
    procedure CadastrarParticipacao1Click(Sender: TObject);

  private
    { Private declarations }
  public
    idMusica: string
    { Public declarations }
  end;

var
  frmCadastroMusica: TfrmCadastroMusica;

implementation
uses dtmECAD, untPrincipal, untPublic, untCadastroAutorMusica;
{$R *.dfm}

procedure TfrmCadastroMusica.BotaoClicado(NomeBotao : string);
var
   Query: string;
begin

    if (CamposObrigatorios(frmCadastroMusica) = False) then
    exit;

    try
       if (NomeBotao = 'Salvar') then
         begin

            Query := 'Insert Into Musica(nome,nacionalidade,dt_inscricao) values (';
            Query := Query + ''''+edtNomeMusica.Text+''',';
            Query := Query + ''''+IntToStr(cmbNacionalidade.ItemIndex)+'-'+cmbNacionalidade.Text+''',';
            Query := Query + ''''+DateToStr(dtpInscricao.Date)+''')';

            AlteraDados(Query);

            Application.MessageBox('Música Incluída Com Sucesso!','Atenção!',MB_OK);

         end
       else if (NomeBotao = 'Alterar') then
         begin

             if (Application.MessageBox(pchar('Deseja Alterar a Música '+edtNomeMusica.Text+'?'),'Atenção!',MB_YESNO+MB_ICONWARNING) = ID_YES) then
             begin

                Query :=         'update musica';
                Query := Query + '   set nome = '''+edtNomeMusica.Text+''',';
                Query := Query + '       nacionalidade = '''+ IntToStr(cmbNacionalidade.ItemIndex)+'-'+cmbNacionalidade.Text+''',';
                Query := Query + '       dt_inscricao = '''+DateToStr(dtpInscricao.Date)+'''';
                Query := Query + ' where idMusica = '+ idMusica;

                AlteraDados(Query);


                Application.MessageBox('Música Alterada Com Sucesso!','Atenção!',MB_OK);

             end;

         end
       else if (NomeBotao = 'Excluir') then
         begin
            if (Application.MessageBox(pchar('Deseja Excluir a Música '+edtNomeMusica.Text+'?'),'Atenção!',MB_YESNO+MB_ICONWARNING) = ID_YES) then
             begin

              Query :=         'delete from musica';
              Query := Query + ' where idMusica = '+ idMusica;

              AlteraDados(Query);

              Application.MessageBox('Música Excluída Com Sucesso!','Cadastro Autor',MB_OK);

             end;
         end;

    Except on E: Exception do
     begin
        Application.MessageBox(pchar('ERROR: '+E.Message),'Cadastro Música', MB_OK);
        FreeAndNil(ECAD);
        CloseModal;
     end;

    end;

     Limpar(frmCadastroMusica);
     CadastrarParticipacao.Visible := False;

     ECAD.qryMusica.Close;
     ECAD.qryMusica.Open;

     ECAD.cdtsMusica.Close;
     ECAD.cdtsMusica.Open;


end;

procedure TfrmCadastroMusica.btnLimparClick(Sender: TObject);
begin
   Limpar(frmCadastroMusica);
   CadastrarParticipacao.Visible := False;

end;

procedure TfrmCadastroMusica.btnSalvarAlterarClick(Sender: TObject);
begin
    BotaoClicado(TButton(sender).Caption);
end;

procedure TfrmCadastroMusica.CadastrarParticipacao1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastroAutorMusica,frmCadastroAutorMusica);
  try
     frmCadastroAutorMusica.ShowModal;
  finally
      FreeAndNil(frmCadastroAutorMusica);
  end;
end;

procedure TfrmCadastroMusica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(ECAD);

end;

procedure TfrmCadastroMusica.FormCreate(Sender: TObject);
begin


  Application.CreateForm(TECAD,ECAD);

  try

     ECAD.qryMusica.Close;
     ECAD.qryMusica.Open;

     ECAD.cdtsMusica.Close;
     ECAD.cdtsMusica.Open;

  Except on E: Exception do
    begin
         Application.MessageBox(pchar('ERROR: '+E.Message),'Cadastro Música', MB_OK);
         FreeAndNil(ECAD);
         CloseModal;
    end;

  end;

end;

procedure TfrmCadastroMusica.grdMusicaDblClick(Sender: TObject);
var
  ind : string;
begin

   ind :=  grdMusica.Fields[1].Value;

   edtNomeMusica.Text         := grdMusica.Fields[0].Value;
   cmbNacionalidade.ItemIndex := StrToInt(trim(copy(ind,0,pos('-',ind)-1)));
   dtpInscricao.Date          := StrToDate(grdMusica.Fields[2].Value);
   idMusica                   := grdMusica.Fields[3].Value;

   btnSalvarAlterar.Caption      := 'Alterar';
   btnExcluirLimpar.Caption      := 'Excluir';
   CadastrarParticipacao.Visible := True;

end;

end.
