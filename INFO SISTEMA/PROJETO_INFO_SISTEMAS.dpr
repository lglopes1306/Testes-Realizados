program PROJETO_INFO_SISTEMAS;

uses
  Vcl.Forms,
  FCadastro in 'FCadastro.pas' {FrmCadastro},
  DtAPI in 'DtAPI.pas' {DtmAPI: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmCadastro, FrmCadastro);
  Application.CreateForm(TDtmAPI, DtmAPI);
  Application.Run;
end.
