SELECT mu.Nome nome_musica 
  FROM EXEC_MUSICA emu
  inner join musica mu 
   on mu.idMusica = emu.idMusica
   where dt_tocou = to_date(:Dt_Consulta,'DD-MM-YYYY');