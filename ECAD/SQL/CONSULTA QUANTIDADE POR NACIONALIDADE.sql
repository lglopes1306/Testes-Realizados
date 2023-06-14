Select  mus.Nacionalidade,
        count(*) Qtde
  from autor aut
 inner join musica_autor mua
    on mua.idAutor = aut.idautor
 inner join musica mus
    on mus.idMusica = mua.idmusica
 where aut.idAutor = :idAutor
 group by mus.Nacionalidade;