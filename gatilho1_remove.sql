.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

DROP TRIGGER IF EXISTS InsertIdadeValidaFuncionarioCabine;
DROP TRIGGER IF EXISTS UpdateIdadeValidaFuncionarioCabine;
DROP TRIGGER IF EXISTS InsertIdadeValidaFuncionarioLimpeza;
DROP TRIGGER IF EXISTS UpdateIdadeValidaFuncionarioLimpeza;
DROP TRIGGER IF EXISTS InsertIdadeValidaFuncionarioPiloto;
DROP TRIGGER IF EXISTS UpdateIdadeValidaFuncionarioPiloto;