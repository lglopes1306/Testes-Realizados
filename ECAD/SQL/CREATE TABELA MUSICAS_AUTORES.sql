CREATE TABLE Musica_Autor (
        id integer GENERATED ALWAYS AS IDENTITY constraint pk_Musica_Autor primary key not null,
        idMusica integer,
        idAutor integer,
        Percentual integer
);
ALTER TABLE MUSICA_AUTOR ADD CONSTRAINT FK_Autor_idAutor foreign key (IDAUTOR) references AUTOR(IDAUTOR);
ALTER TABLE MUSICA_AUTOR ADD CONSTRAINT FK_Musica_idMusica foreign key (IDMUSICA) references Musica(IDMUSICA);