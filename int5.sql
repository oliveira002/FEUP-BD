.mode columns
.headers on
.nullvalue NULL 

select distinct V1.idVoo as ID_do_Voo,LA1.NomePais
 as Pais_de_Partida, LA2.NomePais as Pais_de_Chegada, strftime('%Y/%m/%d',datapartidareal) as datapartida, strftime('%Y/%m/%d',datachegadareal) as datachegada 
 from Voo V1,Partida, Chegada, Horario_de_voo, LocalAeroporto LA1, LocalAeroporto LA2, Aeroporto A1, Aeroporto A2
 where A1.idAeroporto = Partida.idAeroporto and A2.idAeroporto = Chegada.idAeroporto 
 and Partida.idRota = Horario_de_Voo.idRota and Chegada.idRota = Horario_de_Voo.idRota 
 and Horario_de_Voo.idVoo = V1.idVoo and datapartida > "2021/11/30" and datachegada < "2021/12/10" and A1.NomeAeroporto = LA1.NomeAeroporto and A2.NomeAeroporto = LA2.NomeAeroporto order by datapartida, datachegada
;