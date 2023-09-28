/*
Criando a Regra para a tblEstoque, se relacionando com a tabela Modelo
Colocando uma fun��o caso n�o for informada a data, ser� colocada a atual
Colocando a Regra para Verificar o valor do pre�oEstoque */

CREATE TABLE tblEstoque
(
	idEstoque INT IDENTITY (1,1)
	CONSTRAINT PK_tblEstoque_IdEstoque
	PRIMARY KEY (idEstoque),

	idModelo INT NOT NULL
	CONSTRAINT FK_tblEstoque_tblModelos
	FOREIGN KEY (idModelo)
	REFERENCES tblModelos(idModelo),

	dataEntrada DATE DEFAULT GETDATE(),
	
	precoEstoque MONEY NOT NULL
	CONSTRAINT CK_tblEstoque_precoEstoque
	CHECK(precoEstoque >= 10000 AND precoEstoque <= 200000)
);

