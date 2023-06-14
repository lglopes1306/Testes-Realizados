CREATE TABLE exec_musica
(
    idExec_Musica integer generated always as identity constraint pk_exec_music primary key,
    idMusica integer,
    Dt_Tocou Date,
    Qtde integer
);

ALTER TABLE EXEC_MUSICA ADD CONSTRAINT FK_Musica_idMusica_exec_musica foreign key (IDMUSICA) references Musica(IDMUSICA);
