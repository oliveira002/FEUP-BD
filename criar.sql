PRAGMA foreign_keys=ON;


drop table if exists Aviao;

create table Aviao(
	idMatricula VARCHAR(7) PRIMARY KEY,
	NomePais VARCHAR(60) NOT NULL,
	TipoAeronave VARCHAR(20) NOT NULL,
	CONSTRAINT TipoAeronaveExiste FOREIGN KEY(TipoAeronave) REFERENCES TipoAviao(TipoAeronave) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT PaisExiste FOREIGN KEY(NomePais) REFERENCES Pais(NomePais) ON DELETE SET NULL ON UPDATE CASCADE
);

drop table if exists TipoAviao;

create table TipoAviao(
	TipoAeronave VARCHAR(20) PRIMARY KEY,
	PeriodicidadeManutencao INT,
	N_Lugares INT,
	PesoAviao INT,
	PesoMaximo INT,
	CONSTRAINT N_LugaresPositivo CHECK (N_Lugares > 0),
	CONSTRAINT PesoAviaoPositivo CHECK (PesoAviao > 0),
	CONSTRAINT PesoMaximoPositivo CHECK (PesoMaximo> 0),
	CONSTRAINT PesoSuportado CHECK (PesoMaximo > PesoAviao)
);

drop table if exists Pais;

create table Pais(
	NomePais VARCHAR(60) PRIMARY KEY NOT NULL
);

drop table if exists Voo;

create table Voo(
	idVoo INTEGER PRIMARY KEY AUTOINCREMENT,
	TempoAtraso TIME,
	N_passageiros INT,
	idMatricula INT NOT NULL,
	CONSTRAINT AviaoExiste FOREIGN KEY (idMatricula) REFERENCES Aviao(idMatricula) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists Rota;

create table Rota(
	idRota VARCHAR(20) PRIMARY KEY,
	DuracaoPrevista TIME,
	N_escalas INT,
	CONSTRAINT DuracaoPrevista CHECK (DuracaoPrevista > 0),
	CONSTRAINT N_escalasMinimo CHECK (N_escalas >= 0)
);


drop table if exists Passageiro;

create table Passageiro(
	idPassageiro INTEGER PRIMARY KEY AUTOINCREMENT,
	Nome VARCHAR(100) NOT NULL,
	Data_nasc DATE,
	Genero CHAR(1),
	NomePais VARCHAR(60) NOT NULL,
	CONSTRAINT	GeneroValido CHECK(Genero = 'M' or Genero = 'F'),
	CONSTRAINT PaisExiste FOREIGN KEY(NomePais) REFERENCES Pais(NomePais) ON DELETE SET NULL ON UPDATE CASCADE

);


drop table if exists Bilhete;

create table Bilhete(
	idBilhete	INTEGER	PRIMARY KEY AUTOINCREMENT,
	Preco	INT, 
	idVoo	INT	NOT NULL,
	idPassageiro	INT	NOT NULL,
	CONSTRAINT PrecoValido CHECK(Preco >= 0),
	CONSTRAINT PassageiroExiste FOREIGN KEY (idPassageiro) REFERENCES Passageiro(idPassageiro) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT VooExiste FOREIGN KEY (idVoo) REFERENCES Voo(idVoo) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT BilhetePassageiroDeterminaVoo UNIQUE(idVoo, idPassageiro)
);

drop table if exists Aeroporto;


create table Aeroporto(
	idAeroporto	VARCHAR(10)	PRIMARY KEY,
	NomeAeroporto VARCHAR(50) NOT NULL,
	CONSTRAINT NomeAeroportoExiste FOREIGN KEY (NomeAeroporto) REFERENCES LocalAeroporto(NomeAeroporto) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists LocalAeroporto;


create table LocalAeroporto(
	NomeAeroporto VARCHAR(50) PRIMARY KEY,
	NomePais VARCHAR(60) NOT NULL,
	CONSTRAINT PaisExiste FOREIGN KEY(NomePais) REFERENCES Pais(NomePais) ON DELETE SET NULL ON UPDATE CASCADE

);

drop table if exists FuncionarioPiloto;


create table FuncionarioPiloto(
	idFuncionario	INTEGER	PRIMARY KEY AUTOINCREMENT, 
	Nome	VARCHAR(100)	NOT NULL,
	Salario	INT,
	Genero CHAR(1),
	Data_nasc	DATE,
	HorasExperiencia	INT	NOT NULL,
	NomePais	VARCHAR(60) NOT NULL,
	CONSTRAINT	GeneroValido CHECK(Genero = 'M' or Genero = 'F'),
	CONSTRAINT	SalarioValido CHECK(Salario >= 0),
	CONSTRAINT	HorasExpValidas CHECK(HorasExperiencia >= 0),
	CONSTRAINT	PaisExiste	FOREIGN KEY (NomePais) REFERENCES Pais(NomePais) ON DELETE SET NULL ON UPDATE CASCADE
);

drop table if exists Horario_de_voo;

create table Horario_de_voo (
	idVoo	INTEGER	PRIMARY KEY,
	idRota 	VARCHAR(20)	NOT NULL,
	DataPartidaReal	DATETIME	NOT NULL,
	DataChegadaReal DATETIME	NOT NULL,
	DataPartidaPrevista DATETIME,
	DataChegadaPrevista DATETIME,
	CONSTRAINT	VooExiste	FOREIGN KEY (idVoo) REFERENCES Voo(idVoo) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT	RotaExiste	FOREIGN KEY (idRota) REFERENCES Rota(idRota) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT DuracaoRealPositiva CHECK (DataChegadaReal > DataPartidaReal),
	CONSTRAINT DuracaoPrevistaPositiva CHECK (DataChegadaPrevista > DataPartidaPrevista)

);



drop table if exists FuncionarioCabine;

create table FuncionarioCabine(
	idFuncionario INTEGER PRIMARY KEY AUTOINCREMENT,
	Nome varchar(100) NOT NULL,
	Salario INT,
	Genero char(1),
	Data_nasc DATE,
	NomePais varchar(60) NOT NULL,
	Tipo varchar(30) NOT NULL,
	CONSTRAINT TipoValido CHECK(Tipo = "Flight Attendants" or Tipo = "Senior Flight Attendants" or Tipo = "Pursers" or Tipo ="Onboard chefs")
	CONSTRAINT GeneroValido CHECK(Genero='M' or Genero='F'),
	CONSTRAINT PaisExiste FOREIGN KEY (NomePais) REFERENCES Pais(NomePais) ON DELETE SET NULL ON UPDATE CASCADE
);
drop table if exists FuncionarioLimpeza;
create table FuncionarioLimpeza(
	idFuncionario INTEGER PRIMARY KEY AUTOINCREMENT,
	Nome varchar(100) NOT NULL,
	Salario INT,
	Genero char(1),
	Data_nasc DATE,
	NomePais varchar(60) NOT NULL,
	Periodo_de_trabalho varchar(10) NOT NULL,
	CONSTRAINT GeneroValido CHECK(Genero='M' or Genero='F'),
	CONSTRAINT PeriodoValido CHECK(Periodo_de_trabalho="diurno" or Periodo_de_trabalho="noturno"),
	CONSTRAINT PaisExiste FOREIGN KEY (NomePais) REFERENCES Pais(NomePais) ON DELETE SET NULL ON UPDATE CASCADE
);

drop table if exists Limpa;
create table Limpa(
	idFuncionario INT	NOT NULL,
	idMatricula varchar(7)	NOT NULL,
	PRIMARY KEY(idFuncionario,idMatricula),
	CONSTRAINT idFuncionarioExiste FOREIGN KEY (idFuncionario) REFERENCES FuncionarioLimpeza(idFuncionario) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT MatriculaExiste FOREIGN KEY (idMatricula) REFERENCES Aviao(idMatricula) ON DELETE CASCADE ON UPDATE CASCADE
);
drop table if exists TripulantedoVoo;
create table TripulantedoVoo(
	idFuncionario INTEGER	NOT NULL,
	idVoo INTEGER	NOT NULL,
	PRIMARY KEY(idFuncionario,idVoo),
	CONSTRAINT idFuncionarioExiste FOREIGN KEY (idFuncionario) REFERENCES FuncionarioCabine(idFuncionario) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT idVooExiste FOREIGN KEY (idVoo) REFERENCES Voo(idVoo) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists Pilota;
create table Pilota(
	idFuncionario INT	NOT NULL,
	idVoo INT	NOT NULL,
	PRIMARY KEY(idFuncionario,idVoo),
	CONSTRAINT idFuncionarioExiste FOREIGN KEY (idFuncionario) REFERENCES FuncionarioPiloto(idFuncionario) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT idVooExiste FOREIGN KEY (idVoo) REFERENCES Voo(idVoo) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists Partida;
create table Partida(
	idRota varchar(15)	PRIMARY KEY,
	idAeroporto varchar(10)	NOT NULL,
	CONSTRAINT idRotaExiste FOREIGN KEY (idRota) REFERENCES Rota(idRota) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT idAeroportoExiste FOREIGN KEY (idAeroporto) REFERENCES Aeroporto(idAeroporto) ON DELETE CASCADE ON UPDATE CASCADE
);
drop table if exists Chegada;
create table Chegada(
	idRota varchar(15)	PRIMARY KEY,
	idAeroporto varchar(10)	NOT NULL,
	CONSTRAINT idRotaExiste FOREIGN KEY (idRota) REFERENCES Rota(idRota) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT idAeroportoExiste FOREIGN KEY (idAeroporto) REFERENCES Aeroporto(idAeroporto) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists Escala;
create table Escala(
	idRota varchar(15)	NOT NULL,
	idAeroporto varchar(10)	NOT NULL,
	Ordem_da_escala	INT NOT NULL,
	PRIMARY KEY(idRota,idAeroporto),
	CONSTRAINT idRotaExiste FOREIGN KEY (idRota) REFERENCES Rota(idRota) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT idAeroportoExiste FOREIGN KEY (idAeroporto) REFERENCES Aeroporto(idAeroporto) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT EscalaUnica UNIQUE(idRota,Ordem_da_escala)
	
);

drop table if exists Bagagem;
create table Bagagem(
	idBilhete INT	PRIMARY KEY,
	idVoo INT	NOT NULL,
	Peso INT,
	CONSTRAINT idBilheteExiste FOREIGN KEY (idBilhete) REFERENCES Bilhete(idBilhete) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT idVooExiste FOREIGN KEY (idVoo) REFERENCES Voo(idVoo) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT PesoPositivo CHECK (Peso >= 0)
);