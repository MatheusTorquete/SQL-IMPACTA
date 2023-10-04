/*
Laboratório 1A – Realizando consultas e ordenando dados1. 
Coloque em uso o banco de dados PEDIDOS;

2. Apresente uma listagem com o nome, salário, data de admissão e o mês da data de admissão do empregado;

SELECT
NOME,
SALARIO,
DATA_ADMISSAO,
DATENAME(MONTH,DATA_ADMISSAO) AS [Mês]
FROM TB_EMPREGADO


3. Apresente o nome do cliente, concatenando endereço para que fique em apenas uma única coluna 
(exemplo: AV. PRES. VARGAS, 364 – CENTRO - GARIBALDI/RS);

SELECT
	NOME,
	CONCAT(ENDERECO, ' - ', BAIRRO,  ' - ', CIDADE , '/', ESTADO) AS ENDERECO
FROM TB_CLIENTE

4.  Selecione  os  empregados  apresentando  o  1º  nome  e  o  dia  e  mês  (dd/mm)  de  aniversário;

SELECT SUBSTRING(NOME, 1, CHARINDEX(' ', NOME)) AS NOME,
FORMAT(DATA_NASCIMENTO, 'dd/MM') AS [Aniversário]
FROM tb_EMPREGADO



5. Execute o script Cap10_CriaTabela.sql;



6.  Compare  as  tabelas  TB_PRODUTO  e  TBPROD,  apresentando  os  registros  que  são  iguais;
SELECT * FROM TB_PROD
INTERSECT
SELECT * FROM TB_PRODUTO


7.  Compare  as  tabelas  TB_PRODUTO  e  TBPROD,  apresentando  os  registros  que  aparecem somente em TB_PRODUTO.
SELECT * FROM TB_PROD
EXCEPT
SELECT * FROM TB_PRODUTO


Laboratório 2A – Utilizando novamente o banco de dados PEDIDOS e listando suas tabelas com base em outros critérios1. 

Coloque em uso o banco de dados PEDIDOS;


2. Liste todos os pedidos com data de emissão anterior a Jan/2014;

SELECT * FROM TB_PEDIDO WHERE DATA_EMISSAO < '2014.1.1'; 
-- SOLUÇÃO 2 
SELECT * FROM TB_PEDIDO WHERE YEAR( DATA_EMISSAO ) < 2014;

3. Liste todos os pedidos com data de emissão no primeiro semestre de 2014;
SELECT * FROM TB_PEDIDO WHERE DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.6.30' ORDER BY DATA_EMISSAO; 
------- 
JANEIRO 
SELECT * FROM TB_PEDIDO WHERE DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'; 
------- 
JUNHO 
SELECT * FROM TB_PEDIDO WHERE DATA_EMISSAO BETWEEN '2014.6.1' AND '2014.6.30';

4. Liste todos os pedidos com data de emissão em janeiro e junho de 2014;
SELECT * FROM TB_PEDIDO 
WHERE DATA_EMISSAO 
BETWEEN '2014.1.1' 
AND '2014.1.31' 
OR DATA_EMISSAO 
BETWEEN '2014.6.1' AND '2014.6.30';

5. Liste todos os pedidos do Vendedor Código 1 em Jan/2014;
SELECT * FROM TB_PEDIDO WHERE DATA_EMISSAO 
BETWEEN '2014.1.1' AND '2014.1.31' AND CODVEN = 1;

6. Liste os pedidos emitidos em Jan/2014 em uma sexta-feira.
SELECT * FROM TB_PEDIDO WHERE DATA_EMISSAO 
BETWEEN '2014.1.1' AND '2014.1.31' AND DATEPART( WEEKDAY,DATA_EMISSAO) = 6;
*/