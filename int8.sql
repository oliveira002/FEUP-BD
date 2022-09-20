.mode columns
.headers on
.nullvalue NULL


create view if not exists infoVoo as 
select distinct V1.idVoo as ID_do_Voo,A1.NomeAeroporto
 as Aeroporto_de_Partida, A2.NomeAeroporto as Aeroporto_de_Chegada  
 from Voo V1,Partida, Chegada, Horario_de_voo, Aeroporto A1, Aeroporto A2  
 where A1.idAeroporto = Partida.idAeroporto and A2.idAeroporto = Chegada.idAeroporto 
 and Partida.idRota = Horario_de_Voo.idRota and Chegada.idRota = Horario_de_Voo.idRota 
 and Horario_de_Voo.idVoo = V1.idVoo 
;

select ID_do_Voo,  Aviao.idMatricula ,Aeroporto_de_Partida, Aeroporto_de_Chegada,TipoAviao.PesoMaximo from infoVoo, TipoAviao, Aviao where ID_do_Voo in(
select idVoo from Voo where Voo.idMatricula = Aviao.idMatricula and Aviao.TipoAeronave = TipoAviao.TipoAeronave and TipoAviao.PesoMaximo > 20000
);