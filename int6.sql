.mode columns
.headers on
.nullvalue NULL

select distinct V1.idVoo as ID_do_Voo,A1.NomeAeroporto
 as Aeroporto_de_Partida, A2.NomeAeroporto as Aeroporto_de_Chegada, case when
 exists(select Escala.idAeroporto from Escala where Escala.idRota = Horario_de_Voo.idRota and  idAeroporto = (select idAeroporto from Aeroporto where NomeAeroporto = "Lisbon Humberto Delgado Airport"))
 	then 'Escala' else 'Chegada' end
   as Escala_ou_Chegada  
 from Voo V1,Partida, Chegada, Horario_de_voo, Aeroporto A1, Aeroporto A2  
 where A1.idAeroporto = Partida.idAeroporto and A2.idAeroporto = Chegada.idAeroporto 
 and Partida.idRota = Horario_de_Voo.idRota and Chegada.idRota = Horario_de_Voo.idRota 
 and Horario_de_Voo.idVoo = V1.idVoo 
 and (Chegada.idAeroporto = (select idAeroporto from Aeroporto where NomeAeroporto ="Lisbon Humberto Delgado Airport") 
 	or exists(select Escala.idAeroporto from Escala where Escala.idRota = Horario_de_Voo.idRota and  idAeroporto = (select idAeroporto from Aeroporto where NomeAeroporto = "Lisbon Humberto Delgado Airport")))
;
