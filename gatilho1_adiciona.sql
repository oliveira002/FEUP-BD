.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- Impede que seja criado um funcionario cabine com menos de 18 anos de idade
CREATE TRIGGER IF NOT EXISTS InsertIdadeValidaFuncionarioCabine
BEFORE INSERT ON FuncionarioCabine
FOR EACH ROW
WHEN strftime('%J', 'now') - strftime('%J', NEW.Data_nasc) < 6570 -- 18 anos * 365 dias
BEGIN
    SELECT RAISE(ROLLBACK, 'Funcionario de Cabine necessita de idade superior a 18 anos!');
END;


-- Impede que a data de nascimento de um funcionario seja alterada para valores invalidos
CREATE TRIGGER IF NOT EXISTS UpdateIdadeValidaFuncionarioCabine
BEFORE UPDATE OF Data_nasc ON FuncionarioCabine
FOR EACH ROW
WHEN (EXISTS (select * from FuncionarioCabine where idFuncionario = NEW.idFuncionario)) AND (strftime('%J', 'now') - strftime('%J', NEW.Data_nasc) < 6570) -- 18 anos * 365 dias
BEGIN
    SELECT RAISE(ROLLBACK, 'Funcionario de Cabine necessita de idade superior a 18 anos!');
END;





-- Impede que seja criado um funcionario limpeza com menos de 18 anos de idade
CREATE TRIGGER IF NOT EXISTS InsertIdadeValidaFuncionarioLimpeza
BEFORE INSERT ON FuncionarioLimpeza
FOR EACH ROW
WHEN strftime('%J', 'now') - strftime('%J', NEW.Data_nasc) < 6570 -- 18 anos * 365 dias
BEGIN
    SELECT RAISE(ROLLBACK, 'Funcionario de Limpeza necessita de idade superior a 18 anos!');
END;


-- Impede que a data de nascimento de um funcionario limpeza seja alterada para valores invalidos
CREATE TRIGGER IF NOT EXISTS UpdateIdadeValidaFuncionarioLimpeza
BEFORE UPDATE OF Data_nasc ON FuncionarioLimpeza
FOR EACH ROW
WHEN (EXISTS (select * from FuncionarioLimpeza where idFuncionario = NEW.idFuncionario)) AND (strftime('%J', 'now') - strftime('%J', NEW.Data_nasc) < 6570) -- 18 anos * 365 dias
BEGIN
    SELECT RAISE(ROLLBACK, 'Funcionario de Limpeza necessita de idade superior a 18 anos!');
END;





-- Impede que seja criado um funcionario piloto com menos de 18 anos de idade
CREATE TRIGGER IF NOT EXISTS InsertIdadeValidaFuncionarioPiloto
BEFORE INSERT ON FuncionarioPiloto
FOR EACH ROW
WHEN strftime('%J', 'now') - strftime('%J', NEW.Data_nasc) < 6570 -- 18 anos * 365 dias
BEGIN
    SELECT RAISE(ROLLBACK, 'Funcionario de Piloto necessita de idade superior a 18 anos!');
END;


-- Impede que a data de nascimento de um funcionario piloto seja alterada para valores invalidos
CREATE TRIGGER IF NOT EXISTS UpdateIdadeValidaFuncionarioPiloto
BEFORE UPDATE OF Data_nasc ON FuncionarioPiloto
FOR EACH ROW
WHEN (EXISTS (select * from FuncionarioPiloto where idFuncionario = NEW.idFuncionario)) AND (strftime('%J', 'now') - strftime('%J', NEW.Data_nasc) < 6570) -- 18 anos * 365 dias
BEGIN
    SELECT RAISE(ROLLBACK, 'Funcionario de Piloto necessita de idade superior a 18 anos!');
END;



