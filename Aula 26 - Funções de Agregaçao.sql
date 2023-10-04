/*

Agrega��o - Consolidar ou totalizar a informa��o.

SUM
AVG
MAX
MIN
COUNT
*/

Use SisDep;

-- Retornar o total geral de sal�rios pagos

SELECT SUM(salario) as total_pagamento FROM Funcionario;

-- Retornar a m�dia salarios
SELECT AVG(salario) AS [Media Salarial] FROM Funcionario;

-- Mais de uma agrega��o no mesmo SELECT
SELECT
	MAX(salario) AS Maior_Salario,
	MIN(salario) AS Menor_SALARIO,
	COUNT(salario) AS N_FUNCIONARIO
FROM Funcionario;

