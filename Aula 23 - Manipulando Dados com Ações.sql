/*
UPDATE COM INNER JOIN

UPDATE tabela1
FROM tabela1
INNER JOIN Tabela2

*/

-- Bonus de R$ 100,00 para todos os funcionários que possuem dependentes

USE SisDep;

BEGIN TRAN
	UPDATE Funcionario
	SET Salario = Salario + 100
	FROM Funcionario AS F
	INNER JOIN Dependente AS D
	ON F.idMatricula = D.idMatricula;

ROLLBACK TRAN

COMMIT TRAN

-- Reajuste de 10% no salário para funcionarios que não possuam dependentes
SELECT
	F.NomeFuncionario, D.NomeDependente
FROM Funcionario AS F
LEFT JOIN Dependente AS D
ON F.idMatricula = D.idMatricula
WHERE D.NomeDependente IS NULL;

BEGIN TRAN 
	UPDATE Funcionario
	SET Salario = Salario * 1.1
	FROM Funcionario AS F
	LEFT JOIN Dependente AS D
	ON F.idMatricula = D.idMatricula
	WHERE D.NomeDependente IS NULL;

ROLLBACK TRAN

COMMIT TRAN

-- Desligamento de funcionários do DEPTO SAC com salário cima de R$ 1.500

BEGIN TRAN
	DELETE Funcionario
	FROM Funcionario AS F
	INNER JOIN Depto AS D
	ON F.idDepartamento = D.idDepartamento
	WHERE d.NomeDepartamento = 'SAC' AND f.Salario > 1500;

	ROLLBACK TRAN
	
	COMMIT TRAN

	-- Desligamento de funcionários com salário superior a R$ 4.000.00
	-- que NÃO possuam dependentes

	BEGIN TRAN
		DELETE Funcionario
		FROM Funcionario AS F
		LEFT JOIN Dependente AS D
		ON F.idMatricula = D.idMatricula
		WHERE d.NomeDependente IS NULL
		AND F.Salario > 4000;

ROLLBACK TRAN

COMMIT TRAN