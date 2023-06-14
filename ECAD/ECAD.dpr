program ECAD;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untCadastroAutores in 'untCadastroAutores.pas' {frmCadastroAutor},
  untPublic in 'untPublic.pas',
  dtmECAD in 'DataModule\dtmECAD.pas' {ECAD: TDataModule},
  untCadastroMusica in 'untCadastroMusica.pas' {frmCadastroMusica},
  untCadastroAutorMusica in 'untCadastroAutorMusica.pas' {frmCadastroAutorMusica},
  untCadastroExecMusica in 'untCadastroExecMusica.pas' {frmCadastroExecMusica},
  untProcessaPagamento in 'untProcessaPagamento.pas' {frmProcessaPagamento},
  untConsultaMusicaAutor in 'untConsultaMusicaAutor.pas' {frmConsultaMusicaAutor},
  untConsultaMusicaAutorNacionalidade in 'untConsultaMusicaAutorNacionalidade.pas' {frmConsultaMusicaAutorNacionalidade},
  untConsultaMusicaData in 'untConsultaMusicaData.pas' {frmConsultaMusicaData},
  untConsultaMesVerba in 'untConsultaMesVerba.pas' {frmConsultaMesVerba},
  untConsultaMesAutorVerba in 'untConsultaMesAutorVerba.pas' {frmConsultaMesAutorVerba},
  untConsultaAutorMesVerba in 'untConsultaAutorMesVerba.pas' {frmConsultaAutorMesVerba},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glossy');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
