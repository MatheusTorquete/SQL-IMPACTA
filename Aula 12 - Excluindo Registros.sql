/*
Exclus�o de Registros.
N�o se esque�a de colocar a clausula
WHERE

DELETE FROM nomeTabela
[WHERE]
*/
SELECT * FROM Carteiras

-- Excluindo Registros - Database Consorcio
-- Seleciona a Tabela e coluna desejada
DELETE FROM Carteiras
WHERE CPF = 83699151180;

-- N�o podemos excluir registros que contenham FK