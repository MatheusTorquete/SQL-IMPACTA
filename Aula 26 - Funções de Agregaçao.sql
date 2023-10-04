/*

Agregação - Consolidar ou totalizar a informação.

SUM
AVG
MAX
MIN
COUNT
*/

Use SisDep;

-- Retornar o total geral de salários pagos

SELECT SUM(salario) as total_pagamento FROM Funcionario;

-- Retornar a média salarios
SELECT AVG(salario) AS [Media Salarial] FROM Funcionario;

-- Mais de uma agregação no mesmo SELECT
SELECT
	MAX(salario) AS Maior_Salario,
	MIN(salario) AS Menor_SALARIO,
	COUNT(salario) AS N_FUNCIONARIO
FROM Funcionario;

