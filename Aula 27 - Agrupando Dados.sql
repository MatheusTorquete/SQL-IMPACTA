/*
Agregação de tabelas

GROUP BY - agrupa por grupo

*/

-- Soma de totais agrupadas por Cidades
SELECT
	Cidade, SUM(TOTAL) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade;

--- Quantos produtos foram vendidos por Cidade
SELECT
	Produto, Cidade, SUM(TOTAL) AS [Faturamento Total],
	COUNT (*) AS [N de Ocorrencias]
FROM Dados
GROUP BY Cidade,Produto;


-- Filtros com agrupamento HAVING

-- Somente cidades superior a 2mil
SELECT
	Cidade, SUM(Total) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade
HAVING SUM(Total) > 2000
ORDER BY Cidade;


-- Com subtotais - WITH ROLLUP (Primeira coluna do SELECT)
SELECT
	Cidade, SUM(Total) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade
HAVING SUM(Total) > 2000
WITH ROLLUP


-- com WITH CUBE (Totais de das colunas)
SELECT
	Produto, Cidade, SUM(TOTAL) AS [Faturamento Total],
	COUNT (*) AS [N de Ocorrencias]
FROM Dados
GROUP BY Cidade,Produto;
WITH CUBE


------- Agrupando com junção
-- quantos dependentes o funcionário possui
SELECT
	NomeFuncionario,COUNT(*) as [N Dependentes]
FROM Funcionario AS F INNER JOIN Dependente AS D
ON F.idMatricula = D.idMatricula
GROUP BY NomeFuncionario;