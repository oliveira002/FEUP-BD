.mode columns
.headers on
.nullvalue NULL


select distinct V1.idVoo as ID_do_Voo,V1.TempoAtraso as Tempo_de_Atraso ,A1.NomeAeroporto as Aeroporto_de_Partida, A2.NomeAeroporto as Aeroporto_de_Chegada  
from Voo V1,Partida, Chegada, Horario_de_voo, Aeroporto A1, Aeroporto A2  where A1.idAeroporto = Partida.idAeroporto and A2.idAeroporto = Chegada.idAeroporto and Partida.idRota = Horario_de_Voo.idRota 
and Chegada.idRota = Horario_de_Voo.idRota and Horario_de_Voo.idVoo = V1.idVoo and  V1.tempoAtraso is not NULL and not exists(select * from Voo V2 where V2.idVoo <> V1.idVoo and  V2.TempoAtraso is not NULL 
	and V2.TempoAtraso > V1.TempoAtraso)
  union
  select distinct V1.idVoo as ID_do_Voo,V1.TempoAtraso as Tempo_de_Atraso ,A1.NomeAeroporto as Aeroporto_de_Partida, A2.NomeAeroporto as Aeroporto_de_Chegada  
  from Voo V1,Partida, Chegada, Horario_de_voo, Aeroporto A1, Aeroporto A2  where A1.idAeroporto = Partida.idAeroporto and A2.idAeroporto = Chegada.idAeroporto and Partida.idRota = Horario_de_Voo.idRota 
  and Chegada.idRota = Horario_de_Voo.idRota and Horario_de_Voo.idVoo = V1.idVoo and  V1.tempoAtraso is not NULL and not exists(select * from Voo V2 where V2.idVoo <> V1.idVoo and  V2.TempoAtraso is not NULL 
  	and V2.TempoAtraso < V1.TempoAtraso) order by Tempo_de_Atraso;
  