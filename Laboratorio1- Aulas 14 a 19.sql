/*

Laboratório 1 

A – Utilizando o banco de dados PEDIDOS e listando suas tabelas com base em diferentes critérios1. 

Coloque em uso o banco de dados PEDIDOS;


2. Liste a tabela TB_PRODUTO,mostrando as colunas COD_PRODUTO, DESCRICAO, PRECO_CUSTO, PRECO_VENDA 
e calculando o lucro unitário (PRECO_VENDA – PRECO_CUSTO);

SELECT COD_PRODUTO, DESCRICAO, PRECO_CUSTO, PRECO_VENDA, (PRECO_VENDA - PRECO_CUSTO) AS LUCRO_UNITARIO
FROM TB_PRODUTO;



3. Liste a tabela TB_PRODUTO, mostrando os campos COD_PRODUTO, DESCRICAO e calculando o valor total investido 
no estoque daquele produto (QTD_REAL * PRE-CO_CUSTO);

SELECT COD_PRODUTO, DESCRICAO, (QTD_REAL * PRECO_CUSTO) AS Valor_Investido
FROM TB_PRODUTO;



4. Liste a tabela TB_ITENSPEDIDO, mostrando as colunas NUM_PEDIDO, NUM_ITEM, COD_PRODUTO, PR_UNITARIO, QUANTIDADE, 
DESCONTO e calculando o valor de cada item (PR_UNITARIO * QUANTIDADE * (1-DESCONTO/100));

SELECT NUM_PEDIDO, NUM_ITEM, COD_PRODUTO, PR_UNITARIO, QUANTIDADE, DESCONTO,
       (PR_UNITARIO * QUANTIDADE * (1 - DESCONTO/100)) AS Valor_Item
FROM TB_ITENSPEDIDO;



5. Liste a tabela TB_PRODUTO, mostrando as colunas COD_PRODUTO, DESCRICAO, PRECO_CUSTO, PRECO_VENDA e calculando lucro 
estimado em reais (QTD_REAL * (PRECO_VENDA - PRECO_CUSTO));

SELECT COD_PRODUTO, DESCRICAO, PRECO_CUSTO, PRECO_VENDA, (QTD_REAL * (PRECO_VENDA - PRECO_CUSTO)) AS Lucro_Reais
FROM TB_PRODUTO;



6. Liste a tabela TB_PRODUTO, mostrando os campos COD_PRODUTO, DESCRICAO, PRECO_CUSTO, PRECO_VENDA, calculando 
o lucro unitário em reais (PRECO_VENDA  –  PRECO_CUSTO)  e  o  lucro  unitário  percentual  ((100  *  (PRECO_VENDA  -  PRE-COCUSTO) / PRECO_CUSTO))

SELECT COD_PRODUTO, DESCRICAO, PRECO_CUSTO, PRECO_VENDA, (PRECO_VENDA  –  PRECO_CUSTO) AS Lucro_Unitario, 
((100  *  (PRECO_VENDA  -  PRE-COCUSTO) / PRECO_CUSTO))   AS Lucro_Percentual
FROM TB_PRODUTO;

.Note que existe uma divisão na instrução. 


Deve-se garantir que não ocorra divisão por zero, pois isso provoca erro ao executar o comando

SELECT COD_PRODUTO, DESCRICAO, PRECO_CUSTO, PRECO_VENDA,
       (PRECO_VENDA - PRECO_CUSTO) AS Lucro_Unitario,
       CASE
           WHEN PRECO_CUSTO <> 0 THEN ((100 * (PRECO_VENDA - PRECO_CUSTO) / PRECO_CUSTO))
           ELSE 0
       END AS Lucro_Percentual
FROM TB_PRODUTO;



*/