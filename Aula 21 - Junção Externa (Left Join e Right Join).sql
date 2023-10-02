/*
LEFT OUTER JOIN

Ir� for�ar a retornar todos os dados da tabela a ESQUERDA do JOIN
e da tabela a DIREITA somente os dados que existerem nas duas



RIGHT OUTER JOIN
Ir� for�ar a retornar todos os dados da tabela a DIREITA do JOIN
e da tabela a ESQUERDA somente os dados que existerem nas duas



*/

-- -- Ir� trazer todos os funcion�rios, independente se tem ou n�o DEPENDENTE.

SELECT
	F.NomeFuncionario, D.NomeDependente, d.NascimentoDependente
FROM Funcionario as F
LEFT OUTER JOIN Dependente as D
ON F.idMatricula = D.idMatricula
ORDER BY f.NomeFuncionario ASC;


-- Ir� trazer todos os cargos, mesmo que n�o possuam Funcion�rios.
SELECT
	F.NomeFuncionario,
	C.NomeCargo,
	F.Salario
FROM Funcionario AS F
RIGHT JOIN CARGO AS C
ON F.idCargo = C.idCargo;