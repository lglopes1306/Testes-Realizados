create table Autor
(
  idAutor INTEGER GENERATED ALWAYS AS IDENTITY constraint pk_Autores primary key,
  Nome varchar2(60) not null,
  Nome_Artistico varchar2(60),
  CPF varchar2(15),
  RG varchar2(15),
  Banco varchar2(30),
  Agencia Varchar2(10),
  Conta varchar2(15)
  );