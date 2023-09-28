-- Tables
CREATE TABLE tblMarcas 
(
	idMarca INT IDENTITY (1,1) PRIMARY KEY,
	nomeMarca NCHAR(10) NOT NULL UNIQUE
);

-- Criando agora de modo com a constraint, 2 forma a fazer.
CREATE TABLE tblModelos (
	idModelo INT IDENTITY(1,1)
	CONSTRAINT PK_tblModelos_idModelo
	PRIMARY KEY (idModelo),

	--FK
	idMarca INT NOT NULL
	CONSTRAINT FK_tblModelos_tblMarcas_idMarca
	FOREIGN KEY (idMarca)
	REFERENCES tblMarcas(idMarca),

	nomeModelo NCHAR(30) NOT NULL
	CONSTRAINT UQ_tblModelos_nomeModelo
	UNIQUE(nomeModelo)
);

-- Visualizando estrutura de tabelas
EXEC sp_help tblMarcas;
-- Do modo a colocar PRIMARY KEY � mais f�cil, por�m os nomes das chaves o proprio banco que d�

EXEC sp_help tblModelos;
-- Veja a diferen�a no nomes das Chaves, quando constru�mos com a CONSTRAINT

