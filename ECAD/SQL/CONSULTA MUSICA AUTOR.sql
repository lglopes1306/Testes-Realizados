Select aut.Nome||'('||aut.nome_artistico||')' Nome_Autor,
       mus.Nome Nome_musica
    from autor aut
    inner join musica_autor mua
    on mua.idAutor = aut.idautor
    inner join musica mus
    on mus.idMusica = mua.idmusica
    where aut.idAutor = :idAutor;