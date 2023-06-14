
create table Pagamento_Processado( idPagamento_Processado INTEGER GENERATED ALWAYS AS IDENTITY constraint Pk_idPagamento_Processado primary key,
                                   idExec_Musica integer,
                                   idMusica integer,
                                   idAutor integer, 
                                   Dt_Inicial Date,
                                   Dt_Final Date,
                                   ValorFinal decimal(10,2) 
                                  );
ALTER TABLE Pagamento_Processado ADD CONSTRAINT FK_Pagamento_Processado_idExec_Musica foreign key (IDEXEC_MUSICA) references Exec_Musica(IDEXEC_MUSICA);
  