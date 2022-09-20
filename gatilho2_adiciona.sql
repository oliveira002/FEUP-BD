.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

create trigger if not exists InsertHorarioDeVooValido
after insert on Horario_de_Voo
for each row
when(new.DataPartidaPrevista is not NULL and new.DataChegadaPrevista is not NULL )
begin
	update Voo set TempoAtraso = substr(time((ROUND((JULIANDAY(new.DataChegadaReal) - JULIANDAY(new.DataChegadaPrevista)) * 86400)), 'unixepoch'), 0,6)
	where Voo.idVoo = new.idVoo;
end;


create trigger if not exists UpdateHorarioDeVooValido
after update of DataChegadaReal, DataChegadaPrevista on Horario_de_Voo
for each row
when(new.DataPartidaPrevista is not NULL and new.DataChegadaPrevista is not NULL)
begin
	update Voo set TempoAtraso = substr(time((ROUND((JULIANDAY(new.DataChegadaReal) - JULIANDAY(new.DataChegadaPrevista)) * 86400)), 'unixepoch'), 0,6)
	where Voo.idVoo = new.idVoo;
end;


create trigger if not exists DeleteHorarioDeVoo
after delete on Horario_de_Voo
for each row
begin
	update Voo set TempoAtraso = NULL
	where Voo.idVoo = old.idVoo;
end;