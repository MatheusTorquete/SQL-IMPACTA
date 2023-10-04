/*
Subconsulta escrita de um comendo SELECT dentro de outo

OPERADORES na SUBCONSULTA IN, NOT IN, EXISTIS - NOT EXISTS

SELECT 1.. (SELECT 2 .. (SELECT 3..))

Também podemos utilizar os OPERADORES RELACIONAI.

*/

-- Quais clientes na base 2015 também estão na base 2016

SELECT *
FROM Clientes2015
WHERE
	EXISTS
	(
		SELECT Codigo
		FROM Clientes2016
	)

-- Cliente que não estão em 2016
SELECT * FROM Clientes2015 C15
WHERE
	NOT EXISTS 
	(
		SELECT CODIGO FROM Clientes2016 C16
		WHERE C15.Codigo = C16.Codigo
	)

	-----------------------------------

	-- Nome dos funcionários que possuam dependentes
	SELECT
		F.NomeFuncionario
	FROM Funcionario AS F
		WHERE
			F.idMatricula IN (
				SELECT D.idMatricula
				FROM Dependente AS D);

	------------------ Funcionarios que não possuem
	SELECT
		F.NomeFuncionario
	FROM Funcionario AS F
		WHERE
			F.idMatricula NOT IN (
				SELECT D.idMatricula
				FROM Dependente AS D);

---------------------- Funcionários com acima da média salarial
SELECT AVG(SALARIO) AS media_salarial FROM Funcionario;
-- vendo a média

SELECT
	NomeFuncionario, Admissao, Salario
	FROM Funcionario
	WHERE Salario > (SELECT AVG(SALARIO) AS media_salarial FROM Funcionario);