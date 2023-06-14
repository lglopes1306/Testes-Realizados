SELECT  idAutor, nome||'('||nome_artistico||')' as autor
  FROM autor
  ORDER BY nome
