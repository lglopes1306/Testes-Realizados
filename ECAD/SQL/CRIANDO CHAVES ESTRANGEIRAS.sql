ALTER TABLE MUSICA_AUTOR ADD CONSTRAINT FK_Autor_idAutor foreign key (IDAUTOR) references AUTOR(IDAUTOR);
ALTER TABLE MUSICA_AUTOR ADD CONSTRAINT FK_Musica_idMusica foreign key (IDMUSICA) references Musica(IDMUSICA);
ALTER TABLE EXEC_MUSICA ADD CONSTRAINT FK_Musica_idMusica_exec_musica foreign key (IDMUSICA) references Musica(IDMUSICA);

