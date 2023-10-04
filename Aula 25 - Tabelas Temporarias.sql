/*
Tabela temporária

# Local - somente na tabela que foi criada

## Global - todas as conexões ativas poderão ver

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

------ a leitura será por memória ram
SELECT * FROM #Pesquisa1;