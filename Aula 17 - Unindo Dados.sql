/*
Union - Permite unir os resultados de dois ou mais comandos SELECT.
O retorno de seu resultado é exclusivo, ou seja, sem repetições de linhas considerando
todas as colunas envolvidas na seleção

Regras;
Todos os comandos SELECT deverão conter o mesmo número de colunas
As colunas serão unidas devem ser o mesmo tipo de dados
*/

-- Sintaxe. Irá unir as duas bases.
-- não se repete os dados
SELECT 'Cliente 2015' AS Ano, * FROM Clientes2015
UNION
SELECT 'Cliente 2016', * FROM Clientes2016;


-- UNION ALL - repete os dados
SELECT 'Cliente 2015' AS Ano, * FROM Clientes2015
UNION ALL
SELECT 'Cliente 2016', * FROM Clientes2016;

/*
Permite unir os resultados de dois ou mais comandos SELECT
O retorno do resultado não é exclusivo.
*/
