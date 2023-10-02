/*
LEFT OUTER JOIN

Irá forçar a retornar todos os dados da tabela a ESQUERDA do JOIN
e da tabela a DIREITA somente os dados que existerem nas duas



RIGHT OUTER JOIN
Irá forçar a retornar todos os dados da tabela a DIREITA do JOIN
e da tabela a ESQUERDA somente os dados que existerem nas duas



*/

-- -- Irá trazer todos os funcionários, independente se tem ou não DEPENDENTE.

SELECT
	F.NomeFuncionario, D.NomeDependente, d.NascimentoDependente
FROM Funcionario as F
LEFT OUTER JOIN Dependente as D
ON F.idMatricula = D.idMatricula
ORDER BY f.NomeFuncionario ASC;


-- Irá trazer todos os cargos, mesmo que não possuam Funcionários.
SELECT
	F.NomeFuncionario,
	C.NomeCargo,
	F.Salario
FROM Funcionario AS F
RIGHT JOIN CARGO AS C
ON F.idCargo = C.idCargo;