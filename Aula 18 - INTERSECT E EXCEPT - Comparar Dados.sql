/*Operador INTERSECT utilizado para verificar a existencia de dados comuns entre duas tabelas
Regras - Select mesmo n�mero de colunas, as colunas devem ser o mesmo tipo de dados
*/

-- EXEMPLO
SELECT coluna FROM tabela1 [WHERE]
INTERSECT
SELECT coluna FROM tabela2 [WHERE]

-- Verificando a base de dados de clientes 2015 e 2016
-- qual continuo sendo nossos clientes. (OBS Esse database n�o veio na aula)

SELECT Cliente FROM Clientes2015
INTERSECT
SELECT Cliente FROM Clientes2016;

/*
EXCEPT
Utilizado para verificar a n�o existencia de dados comuns entre duas tabelas
Regras - Select mesmo n�mero de colunas, as colunas devem ser o mesmo tipo de dados

*/
-- Clientes que recindiram o contrato, que n�o est� na base de 2016
SELECT Cliente FROM Clientes2015
EXCEPT
SELECT Cliente FROM Clientes2016;


-- Novos Clientes, agora ser� ao contr�rio
SELECT Cliente FROM Clientes2016
EXCEPT
SELECT Cliente FROM Clientes2015;