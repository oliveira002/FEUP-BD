.mode columns
.headers on
.nullvalue NULL

select idAeroporto as Codigo_Aeroporto, count(idAeroporto) as N_Visitas_em_Rotas from(
select * from Aeroporto natural join Partida
union
select * from Aeroporto natural join Chegada
union 
select idAeroporto, NomeAeroporto,idRota from Aeroporto natural join Escala
)
group by idAeroporto
order by count(idAeroporto)desc, idAeroporto;
