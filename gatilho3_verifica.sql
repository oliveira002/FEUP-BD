.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

.print ''
.print 'Ocupação atual dos voos:'
.print ''

select idMatricula, idVoo,idBilhete,idPassageiro, N_lugares,N_passageiros  
from Aviao natural join TipoAviao natural join Voo natural join Bilhete
order by idVoo;

.print ''
.print 'Deve ser permitido adicionar um passageiro ao voo 5'
.print ''

insert into Bilhete(Preco, idVoo, idPassageiro) values(150,5,7);	


select idMatricula, idVoo,idBilhete,idPassageiro, N_lugares,N_passageiros  
from Aviao natural join TipoAviao natural join Voo natural join Bilhete
order by idVoo; 

.print ''
.print 'Agora atingida a ocupação máxima do voo número 5, já não deve ser possível adicionar mais bilhetes para esse voo'
.print ''
.print '______________________________________________________________________'
.print ''
.print 'Tentemos então adicionar um bilhete para o voo 5:'
.print ''

insert into Bilhete(Preco, idVoo, idPassageiro) values(150,5,9);	

select idMatricula, idVoo,idBilhete,idPassageiro, N_lugares,N_passageiros  
from Aviao natural join TipoAviao natural join Voo natural join Bilhete
order by idVoo;

.print ''
.print 'Como podemos observar, não foi feita a adição'
.print ''
