.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Estado atual dos funcionarios cabine:'
.print ''

SELECT * from FuncionarioCabine;

.print ''
.print 'Tentar adicionar 2 funcionarios cabine um com idade valida e outro nao:'
.print ''

insert into FuncionarioCabine (Nome, Salario, Genero, Data_nasc,NomePais,Tipo) values("Riley Reid", 10254, "F", '2016-01-01', "Portugal","Flight Attendants");
insert into FuncionarioCabine (Nome, Salario, Genero, Data_nasc,NomePais,Tipo) values("Mia Khalifa", 23077, "F", '1143-10-05', "India","Senior Flight Attendants");

SELECT * from FuncionarioCabine; 

.print ''
.print 'Estado atual dos funcionarios (como se pode observar, so foi introduzido um):'
.print ''
.print '______________________________________________________________________'

.print ''
.print 'Estado atual dos funcionarios limpeza:'
.print ''

SELECT * from FuncionarioLimpeza;

.print ''
.print 'Tentar adicionar 2 funcionarios cabine um com idade valida e outro nao:'
.print ''

insert into FuncionarioLimpeza (Nome, Salario, Genero, Data_nasc,NomePais,Periodo_de_trabalho) values("Riley Khalifa", 10254, "F", '2016-01-01', "Portugal","noturno");
insert into FuncionarioLimpeza (Nome, Salario, Genero, Data_nasc,NomePais,Periodo_de_trabalho) values("Mia Reid", 23077, "F", '1143-10-05', "India","noturno");

SELECT * from FuncionarioLimpeza; 

.print ''
.print 'Estado atual dos funcionarios (como se pode observar, so foi introduzido um):'
.print ''
.print '______________________________________________________________________'

.print ''
.print 'Estado atual dos funcionarios piloto:'
.print ''

SELECT * from FuncionarioPiloto;

.print ''
.print 'Tentar adicionar 2 funcionarios cabine um com idade valida e outro nao:'
.print ''

insert into FuncionarioPiloto (Nome, Salario, Genero, Data_nasc,HorasExperiencia,NomePais) values("Khalifa Riley", 10254, "F", '2016-01-01', 10000,"Portugal");
insert into FuncionarioPiloto (Nome, Salario, Genero, Data_nasc,HorasExperiencia,NomePais) values("Reid Mia", 23077, "F", '1143-10-05', 7851,"India");

SELECT * from FuncionarioPiloto; 

.print ''
.print 'Estado atual dos funcionarios (como se pode observar, so foi introduzido um):'
.print ''
.print '______________________________________________________________________'

.print ''
.print 'Estado atual dos funcionarios cabine:'
.print ''

SELECT * from FuncionarioCabine;

.print ''
.print 'Tentando atualizar a data de nascimento do funcionario cabine 2015 para 2017-04-04:'
.print ''

UPDATE FuncionarioCabine
SET Data_nasc = '2017-04-04'
WHERE idFuncionario = 2015;

.print ''
.print 'Estado atual dos funcionarios cabine:'
.print ''

SELECT * from FuncionarioCabine;

.print ''
.print 'Como podemos ver nao foi atualizado'
.print ''
.print ''
.print 'Tentando atualizar a data de nascimento do funcionario cabine 2015 para 2000-04-04:'
.print ''

UPDATE FuncionarioCabine
SET Data_nasc = '2000-04-04'
WHERE idFuncionario = 2015;

.print ''
.print 'Estado atual dos funcionarios cabine:'
.print ''

SELECT * from FuncionarioCabine;
.print ''
.print 'Como podemos ver foi atualizado'
.print ''
.print '______________________________________________________________________'

.print ''
.print 'Estado atual dos funcionarios limpeza:'
.print ''

SELECT * from FuncionarioLimpeza;

.print ''
.print 'Tentando atualizar a data de nascimento do funcionario limpeza 1015 para 2017-04-04:'
.print ''

UPDATE FuncionarioLimpeza
SET Data_nasc = '2017-04-04'
WHERE idFuncionario = 1015;

.print ''
.print 'Estado atual dos funcionarios limpeza:'
.print ''

SELECT * from FuncionarioLimpeza;

.print ''
.print 'Como podemos ver nao foi atualizado'
.print ''
.print ''
.print 'Tentando atualizar a data de nascimento do funcionario limpeza 1015 para 2000-04-04:'
.print ''

UPDATE FuncionarioLimpeza
SET Data_nasc = '2000-04-04'
WHERE idFuncionario = 1015;

.print ''
.print 'Estado atual dos funcionarios limpeza:'
.print ''

SELECT * from FuncionarioLimpeza;
.print ''
.print 'Como podemos ver foi atualizado'
.print ''
.print '______________________________________________________________________'

.print ''
.print 'Estado atual dos funcionarios piloto:'
.print ''

SELECT * from FuncionarioPiloto;

.print ''
.print 'Tentando atualizar a data de nascimento do funcionario piloto 3015 para 2017-04-04:'
.print ''

UPDATE FuncionarioPiloto
SET Data_nasc = '2017-04-04'
WHERE idFuncionario = 3015;

.print ''
.print 'Estado atual dos funcionarios piloto:'
.print ''

SELECT * from FuncionarioPiloto;

.print ''
.print 'Como podemos ver nao foi atualizado'
.print ''
.print ''
.print 'Tentando atualizar a data de nascimento do funcionario piloto 3015 para 2000-04-04:'
.print ''

UPDATE FuncionarioPiloto
SET Data_nasc = '2000-04-04'
WHERE idFuncionario = 3015;

.print ''
.print 'Estado atual dos funcionarios piloto:'
.print ''

SELECT * from FuncionarioPiloto;
.print ''
.print 'Como podemos ver foi atualizado'
.print ''