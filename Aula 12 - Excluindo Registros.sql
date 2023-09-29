/*
Exclusão de Registros.
Não se esqueça de colocar a clausula
WHERE

DELETE FROM nomeTabela
[WHERE]
*/
SELECT * FROM Carteiras

-- Excluindo Registros - Database Consorcio
-- Seleciona a Tabela e coluna desejada
DELETE FROM Carteiras
WHERE CPF = 83699151180;

-- Não podemos excluir registros que contenham FK