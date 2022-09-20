.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS LugaresDisponiveis
BEFORE INSERT ON Bilhete
FOR EACH ROW

WHEN(exists (select * from Aviao natural join TipoAviao natural join Voo where idVoo = new.idVoo and N_passageiros < N_lugares ))
BEGIN
    UPDATE Voo
    SET N_passageiros = N_passageiros + 1
    WHERE idVoo = new.idVoo;
END;



CREATE TRIGGER IF NOT EXISTS LugaresDisponiveisFalso
BEFORE INSERT ON Bilhete
FOR EACH ROW

WHEN(not exists (select * from Aviao natural join TipoAviao natural join Voo where idVoo = new.idVoo and N_passageiros < N_lugares ))
BEGIN
    SELECT RAISE(ROLLBACK, 'O avião já atingiu a capacidade de lugares máxima!');
END;