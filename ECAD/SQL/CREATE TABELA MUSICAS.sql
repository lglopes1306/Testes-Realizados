CREATE TABLE Musica (
        idMusica INTEGER GENERATED ALWAYS AS IDENTITY constraint pk_musica primary key,
        Nome varchar2(60),
        Dt_Inscricao Date,
        Nacionalidade varchar2(20)
);
