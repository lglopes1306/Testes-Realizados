 select ('De '||pp.dt_inicial||' até '|| pp.dt_final) periodo,
        aut.Nome||'('||aut.nome_artistico||')' Autor,
        SUM(pp.valorfinal) Pago
   from pagamento_processado pp
  inner join musica m 
     on m.idMusica = pp.idmusica
  inner join autor aut
     on aut.idautor = pp.idautor
  where pp.Dt_Inicial LIKE '%' || :MES || '%'
  group by pp.dt_inicial, pp.dt_final, aut.Nome, aut.nome_artistico
  order by pp.dt_inicial, pp.dt_final, aut.Nome, aut.nome_artistico

