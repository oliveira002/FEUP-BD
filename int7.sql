.mode columns
.headers on
.nullvalue NULL


create view if not exists funcionariosPorVoo as
select idVoo,count(idFuncionario) as N_Funcionarios, sum(Salario) as Soma_salarios from
(select TripulanteDoVoo.idFuncionario, idVoo, Salario from TripulantedoVoo, funcionarioCabine where TripulanteDoVoo.idFuncionario = funcionarioCabine.idFuncionario
    union
select Pilota.idFuncionario, idVoo, Salario from pilota, funcionarioPiloto where pilota.idFuncionario = funcionarioPiloto.idFuncionario)
group by idVoo;

select * from funcionariosPorVoo;
.print ''
select avg(N_funcionarios) as Media_Funcionarios_Por_Voo, avg(Soma_salarios) as  Media_Salarios_Por_Voo from funcionariosPorVoo;