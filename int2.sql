.mode columns
.headers on
.nullvalue NULL 


create view if not exists infoFuncionario as
	select nome,salario,genero,idfuncionario, "Piloto" as Funcao from funcionariopiloto
	UNION ALL
	select nome,salario,genero,idfuncionario, "Cabine" as Funcao from funcionariocabine
	UNION ALL
	select nome,salario,genero,idfuncionario, "Limpeza" as Funcao from funcionariolimpeza;


select count(*) as N_Funcionarios_Masculinos from infofuncionario
	where(genero = 'M' and salario > (select avg(salario) from infofuncionario where genero = 'F'));


select nome, salario from infofuncionario
	where(genero = 'M' and salario > (select avg(salario) from infofuncionario where genero = 'F'));