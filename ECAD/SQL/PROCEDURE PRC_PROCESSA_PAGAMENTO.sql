

  CREATE OR REPLACE  PROCEDURE PRC_PROCESSA_PAGAMENTO( vDt_Inicial in string,vDt_Final in string,vVerba in decimal)
       is 
            vValorExecUnitario decimal(10,2);
            vMaximo INTEGER;
       begin
            
            delete from pre_pagamento_tblaux;
            
            select count(*) INTO vMaximo
              from exec_musica e
              inner join musica_autor m 
                 on m.idmusica = e.idmusica 
              where Dt_Tocou BETWEEN to_date(vDt_Inicial,'DD-MM-YYYY') 
                AND to_date(vDt_Final,'DD-MM-YYYY');          
            
            select CAST(vVerba/sum(qtde) AS NUMERIC(10,2)) INTO vValorExecUnitario
              from exec_musica 
             where Dt_Tocou BETWEEN to_date(vDt_Inicial,'DD-MM-YYYY') AND to_date(vDt_Final,'DD-MM-YYYY');
             
             Declare
                  cursor cTot_Musica is
                  select e.idExec_Musica,
                         e.idMusica, 
                         SUM(e.qtde) as QtdeMusica,
                         m.idAutor, 
                         cast((m.percentual/100) as decimal(10,2)) as percentual
                    from exec_musica e
                   inner join musica_autor m 
                      on m.idmusica = e.idmusica 
                   where Dt_Tocou BETWEEN to_date(vDt_Inicial,'DD-MM-YYYY') 
                     AND to_date(vDt_Final,'DD-MM-YYYY')
                   GROUP BY e.idExec_Musica,e.idMusica, m.idAutor, m.percentual;
               
                   vReg cTot_Musica%RowType;
                begin
                    open cTot_Musica;
        
                    for vContador in 1..vMaximo
                    loop 
                        fetch cTot_Musica into vReg;
           
                        insert into Pre_Pagamento_tblaux(idExec_Musica,idMusica,QtdePeriodo,ValorUnitarioExec,idAutor,Percentual)
                            values(vReg.idExec_Musica,vReg.idmusica,vReg.QtdeMusica,vValorExecUnitario,vReg.idAutor,vReg.Percentual);
        
                    end loop;
        
                    close cTot_Musica;
                 end;
                 
                 declare
                     cursor cProcessa_Pagamento is
                      select idExec_Musica,
                             idMusica,
                             idAutor,
                             cast(((valorunitarioexec*qtdeperiodo)*percentual) as decimal(10,2)) ValorFinal
                        from pre_pagamento_tblAux order By idautor;
                        
                        vReg_Processando cProcessa_Pagamento%RowType;
                    
                begin
                   open cProcessa_Pagamento;
                   
                   for vContador in 1..vMaximo
                   loop
                       fetch cProcessa_Pagamento into vReg_Processando;
                       
                       insert into Pagamento_Processado( Dt_Inicial,Dt_Final,idMusica,idAutor, idExec_Musica,ValorFinal)
                            values (vDt_Inicial,vDt_Final,vReg_Processando.idMusica,vReg_Processando.idAutor,
                                    vReg_Processando.idExec_Musica,vReg_Processando.ValorFinal);
                   end loop;
                   
                   close cProcessa_Pagamento; 
                end;


       end PRC_Processa_Pagamento;


