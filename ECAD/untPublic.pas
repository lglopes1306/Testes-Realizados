unit untPublic;

  interface
     uses vcl.Forms, Vcl.StdCtrls, Windows, SysUtils, Classes;

       procedure Limpar(Form_Chamada : TForm );
       procedure AlteraDados(QuerySql : String);
       function CamposObrigatorios(Form_Chamada : TForm): boolean;

implementation
uses dtmECAD;

procedure Limpar(Form_Chamada : TForm );
var
   i : integer;
begin

  for i := 0 to Form_Chamada.ComponentCount - 1  do
  begin
      if (Form_Chamada.Components[i] is TEdit) then
          TEdit(Form_Chamada.Components[i]).Text := '';

      if (Form_Chamada.Components[i] is TComboBox) then
      begin
          TComboBox(Form_Chamada.Components[i]).ItemIndex := - 1 ;
          TComboBox(Form_Chamada.Components[i]).Text := 'Escolha...';
      end;

      if Form_Chamada.Components[i] is TButton then
      begin
          if (TButton(Form_Chamada.Components[i]).Caption = 'Alterar') then
             TButton(Form_Chamada.Components[i]).Caption := 'Salvar';

          if (TButton(Form_Chamada.Components[i]).Caption = 'Excluir') then
              TButton(Form_Chamada.Components[i]).Caption := 'Limpar';


      end;

  end;

end;

procedure AlteraDados(QuerySql : String);
begin
    if QuerySql <> '' then
    begin
      ECAD.qryAlterar.Close;
      ECAD.qryAlterar.SQL.Clear;
      ECAD.qryAlterar.SQL.Add(QuerySql);
      ECAD.qryAlterar.ExecSQL();
    end;
end;

function CamposObrigatorios(Form_Chamada : TForm): boolean;
var Preenchidos : boolean;
    i : integer;
begin
  Preenchidos := True;

  for i:= 0 to Form_Chamada.ComponentCount -1 do
  begin
      if (Form_Chamada.Components[i] is TEdit) then
      begin
         if (TEdit(Form_Chamada.Components[i]).Text = '') then
         begin
             Application.MessageBox('Todos os Campos S�o Obrigat�rios!','Aten��o!',MB_OK);
             TEdit(Form_Chamada.Components[i]).SetFocus;
             Preenchidos := False;
             break;
         end;
      end;

      if (Form_Chamada.Components[i] is TComboBox) then
      begin
         if(TComboBox(Form_Chamada.Components[i]).ItemIndex = - 1) then
         begin
             Application.MessageBox('Todos os Campos S�o Obrigat�rios!','Aten��o!',MB_OK);
             TComboBox(Form_Chamada.Components[i]).SetFocus;
             Preenchidos := False;
             break;
         end;
      end;

  end;

  Result:= Preenchidos;

end;

end.
