.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

drop trigger if exists InsertHorarioDeVooValido;
drop trigger if exists UpdateHorarioDeVooValido;
drop trigger if exists DeleteHorarioDeVoo;
delete from Voo where idVoo = 11;