.mode columns
.headers on
.nullvalue NULL 

create view if not exists infoFuncionario as
	select nome,salario,genero,idfuncionario, "Piloto" as Funcao from funcionariopiloto
	UNION ALL
	select nome,salario,genero,idfuncionario, "Cabine" as Funcao from funcionariocabine
	UNION ALL
	select nome,salario,genero,idfuncionario, "Limpeza" as Funcao from funcionariolimpeza;

select nome, salario, funcao from infofuncionario
	where genero <> 'M' order by salario DESC;