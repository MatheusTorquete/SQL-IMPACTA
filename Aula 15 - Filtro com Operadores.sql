Use SeguroVeiculo;

-- Operador relacional
-- Trazendo apolices maiores que 50k
SELECT * FROM Apolices
WHERE valorApolice >= 50000;

-- Operadores Lógicos
SELECT * FROM Apolices
-- Traz apenas onde o idSeguradora é 1 ou 3
WHERE idSeguradora = 1 OR idSeguradora = 3

-- IdSeguradora = 1 e o valor maior que 50k
SELECT * FROM Apolices
WHERE idSeguradora = 1 AND valorApolice >= 50000;

-- Negação, operador demanda muito processador do servidor
-- diferente de 5
SELECT * FROM Apolices
WHERE NOT idCidade = 5;

-- Operadores Aritméticos
-- Aumentando 10% no valor do apolice
SELECT nContrato, valorApolice, valorApolice * 1.1 AS [Reajuste Anual]
FROM Apolices;

-- Ordenando 
SELECT * FROM Apolices
WHERE valorApolice >= 3000
ORDER BY valorApolice DESC;


-- Operadores Compostos com Update
-- Sempre utilize transação
BEGIN TRAN
	UPDATE Apolices
	SET valorApolice *= 1.1

COMMIT TRAN

ROLLBACK TRAN