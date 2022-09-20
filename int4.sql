.mode columns
.headers on
.nullvalue NULL

create view if not exists infovoo as
select distinct V1.idVoo as ID_do_Voo,A1.NomeAeroporto
 as Aeroporto_de_Partida, A2.NomeAeroporto as Aeroporto_de_Chegada  
 from Voo V1,Partida, Chegada, Horario_de_voo, Aeroporto A1, Aeroporto A2  
 where A1.idAeroporto = Partida.idAeroporto and A2.idAeroporto = Chegada.idAeroporto 
 and Partida.idRota = Horario_de_Voo.idRota and Chegada.idRota = Horario_de_Voo.idRota 
 and Horario_de_Voo.idVoo = V1.idVoo 
;
create view if not exists infopassageiro as
select Passageiro.nome,Aeroporto_de_Partida,Aeroporto_de_Chegada,Horario_de_voo.DataPartidaReal,Horario_de_voo.DataChegadaReal 
from passageiro,bilhete,Horario_de_voo,infovoo where passageiro.idpassageiro = bilhete.idpassageiro and bilhete.idvoo = Horario_de_voo.idvoo 
and Horario_de_voo.idvoo = infovoo.ID_do_voo;

select Passageiro.NomePais as Nacionalidade,Passageiro.genero,Passageiro.nome,infopassageiro.Aeroporto_de_Partida,infopassageiro.Aeroporto_de_Chegada,infopassageiro.DataPartidaReal,infopassageiro.DataChegadaReal 
from infopassageiro,Passageiro where passageiro.nome = infopassageiro.nome order by genero,Nacionalidade;