/*
Union - Permite unir os resultados de dois ou mais comandos SELECT.
O retorno de seu resultado � exclusivo, ou seja, sem repeti��es de linhas considerando
todas as colunas envolvidas na sele��o

Regras;
Todos os comandos SELECT dever�o conter o mesmo n�mero de colunas
As colunas ser�o unidas devem ser o mesmo tipo de dados
*/

-- Sintaxe. Ir� unir as duas bases.
-- n�o se repete os dados
SELECT 'Cliente 2015' AS Ano, * FROM Clientes2015
UNION
SELECT 'Cliente 2016', * FROM Clientes2016;


-- UNION ALL - repete os dados
SELECT 'Cliente 2015' AS Ano, * FROM Clientes2015
UNION ALL
SELECT 'Cliente 2016', * FROM Clientes2016;

/*
Permite unir os resultados de dois ou mais comandos SELECT
O retorno do resultado n�o � exclusivo.
*/
