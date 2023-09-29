Use SeguroVeiculo;

-- Operador relacional
-- Trazendo apolices maiores que 50k
SELECT * FROM Apolices
WHERE valorApolice >= 50000;

-- Operadores L�gicos
SELECT * FROM Apolices
-- Traz apenas onde o idSeguradora � 1 ou 3
WHERE idSeguradora = 1 OR idSeguradora = 3

-- IdSeguradora = 1 e o valor maior que 50k
SELECT * FROM Apolices
WHERE idSeguradora = 1 AND valorApolice >= 50000;

-- Nega��o, operador demanda muito processador do servidor
-- diferente de 5
SELECT * FROM Apolices
WHERE NOT idCidade = 5;

-- Operadores Aritm�ticos
-- Aumentando 10% no valor do apolice
SELECT nContrato, valorApolice, valorApolice * 1.1 AS [Reajuste Anual]
FROM Apolices;

-- Ordenando 
SELECT * FROM Apolices
WHERE valorApolice >= 3000
ORDER BY valorApolice DESC;


-- Operadores Compostos com Update
-- Sempre utilize transa��o
BEGIN TRAN
	UPDATE Apolices
	SET valorApolice *= 1.1

COMMIT TRAN

ROLLBACK TRAN