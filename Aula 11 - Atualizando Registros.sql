-- Atualizar Registros

--UPDATE nomeTabela 
--SET campo = NovoValor
--WHERE ...

-- Atualizando mais campos
--UPDATE nomeTabela
--SET campo1 = Novo Valor,
--    campo2 = Novo Valor
--WHERE

-- Ir no SisDep, e verificar o Databases Diagrams

-- Bônus de R$ 100,00 para todos os funcionários
UPDATE Funcionario
SET Salario = Salario + 100;

-- Operador Composto
-- Reajuste de 10% para todos os funcionários
-- utilizamos 0.1 para porcentagem
UPDATE Funcionario
SET Salario *= 1.1;
-- SET Salario = Slario * 1.1
--SET Salario = Salario * 0.1 + Salario


-- Atualizando mais de uma coluna simultaneamente
-- Com WHERE jamais esqueça dele.
UPDATE Funcionario
SET Salario = Salario * 1.05, idCargo = 2
WHERE idMatricula = 1000;

-- abrir transações para verificar seguro.. próxima sessão.