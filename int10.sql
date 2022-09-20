.mode columns
.headers on
.nullvalue NULL

select idVoo as ID_do_Voo, sum(Peso) as Peso_Total from Bagagem natural join Voo
group by idVoo;