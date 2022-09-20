.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

.print ''
.print 'Estado atual dos voos e seus horarios'
.print ''

SELECT idVoo, TempoAtraso, DataPartidaPrevista, DataChegadaPrevista, DataPartidaReal, DataChegadaReal  from Horario_de_voo natural join Voo;

.print ''
.print 'Insere-se um novo voo'
.print ''

insert into Voo(N_passageiros,idMatricula) values(10,"D-ACNL");

SELECT Voo.idVoo, TempoAtraso, DataPartidaPrevista, DataChegadaPrevista, DataPartidaReal, DataChegadaReal  from Voo left natural join Horario_de_voo;
.print ''
.print 'Foi inserido um voo sem horário'
.print ''


.print 'Insere-se um horário para esse voo: DataChegadaPrevista 2022-01-20 17:50 - DataChegadaReal 2022-01-20 18:05'
.print ''
insert into Horario_de_voo values(11,"RYR6765", '2022-01-20 15:00', '2022-01-20 18:05', '2022-01-20 15:00','2022-01-20 17:50');

SELECT idVoo, TempoAtraso, DataPartidaPrevista, DataChegadaPrevista, DataPartidaReal, DataChegadaReal  from Horario_de_voo natural join Voo;

.print ''
.print 'Podemos verificar que o tempo de atraso foi atualizado para o valor esperado: 0 horas e 15 minutos'
.print ''
.print '____________________________________________________________________________________________________'

.print 'Atualiza-se a data de chegada real para 20 minutos mais tarde no horário do voo para o tempo de atraso deve mudar para 35 minutos'
.print ''


UPDATE Horario_de_voo
SET DataChegadaReal = '2022-01-20 18:25'
WHERE idVoo = 11;

SELECT idVoo, TempoAtraso, DataPartidaPrevista, DataChegadaPrevista, DataPartidaReal, DataChegadaReal  from Horario_de_voo natural join Voo;
.print ''
.print 'Constatamos que alteração ocorreu com sucesso'
.print 'Se alterarmos também a data de chegada prevista para 20 minutos depois, o tempo de atraso deve diminuir para 15 minutos'
.print ''

UPDATE Horario_de_voo
SET DataChegadaPrevista = '2022-01-20 18:10'
WHERE idVoo = 11;

SELECT idVoo, TempoAtraso, DataPartidaPrevista, DataChegadaPrevista, DataPartidaReal, DataChegadaReal  from Horario_de_voo natural join Voo;


.print ''
.print '____________________________________________________________________________________________________'
.print 'Apaga-se o horário de voo associado ao voo 11'
.print 'É expectável que o tempo de atraso do voo 11 volte a ser NULL'
.print ''

DELETE FROM Horario_de_voo
WHERE idVoo = 11;
SELECT Voo.idVoo, TempoAtraso, DataPartidaPrevista, DataChegadaPrevista, DataPartidaReal, DataChegadaReal  from Voo left natural join Horario_de_voo;
