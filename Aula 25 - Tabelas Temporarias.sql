/*
Tabela tempor�ria

# Local - somente na tabela que foi criada

## Global - todas as conex�es ativas poder�o ver

Podemos criar com o create table e insert into

*/

-- tabela temporaria local 
CREATE TABLE #Clientes (
	codigo INT,
	nomeCliente VARCHAR(50),
	cadastro DATE
	)

	-- Inserindo os dados

INSERT INTO #Clientes
VALUES
(1, 'Math', '2010/1/5'),
(2 ,'Nik', '200/1/10')

-- Criando uma temp a partir de uma fisica

SELECT * 
INTO #Pesquisa1
FROM Dados;

------ a leitura ser� por mem�ria ram
SELECT * FROM #Pesquisa1;