/*
Subconsulta escrita de um comendo SELECT dentro de outo

OPERADORES na SUBCONSULTA IN, NOT IN, EXISTIS - NOT EXISTS

SELECT 1.. (SELECT 2 .. (SELECT 3..))

Tamb�m podemos utilizar os OPERADORES RELACIONAI.

*/

-- Quais clientes na base 2015 tamb�m est�o na base 2016

SELECT *
FROM Clientes2015
WHERE
	EXISTS
	(
		SELECT Codigo
		FROM Clientes2016
	)

-- Cliente que n�o est�o em 2016
SELECT * FROM Clientes2015 C15
WHERE
	NOT EXISTS 
	(
		SELECT CODIGO FROM Clientes2016 C16
		WHERE C15.Codigo = C16.Codigo
	)

	-----------------------------------

	-- Nome dos funcion�rios que possuam dependentes
	SELECT
		F.NomeFuncionario
	FROM Funcionario AS F
		WHERE
			F.idMatricula IN (
				SELECT D.idMatricula
				FROM Dependente AS D);

	------------------ Funcionarios que n�o possuem
	SELECT
		F.NomeFuncionario
	FROM Funcionario AS F
		WHERE
			F.idMatricula NOT IN (
				SELECT D.idMatricula
				FROM Dependente AS D);

---------------------- Funcion�rios com acima da m�dia salarial
SELECT AVG(SALARIO) AS media_salarial FROM Funcionario;
-- vendo a m�dia

SELECT
	NomeFuncionario, Admissao, Salario
	FROM Funcionario
	WHERE Salario > (SELECT AVG(SALARIO) AS media_salarial FROM Funcionario);