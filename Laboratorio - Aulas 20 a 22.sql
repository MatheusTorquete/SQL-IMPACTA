/*
176SQL 2016 - Criando Sistemas de Banco de Dados (online)Laboratório 1 A – Utilizando o comando JOIN para associar tabelas
Considere o seguinte diagrama relacional de banco de dados para associar tabelas:
1. Coloque em uso o banco de dados PEDIDOS;

2.  Liste  os  campos  NUM_PEDIDO, DATA_EMISSAO  e  VLR_TOTAL  de  PEDIDOS, seguidos de NOME do vendedor;

SELECT
    P.NUM_PEDIDO AS [Numero Pedido],
    P.DATA_EMISSAO AS [Data Emissao],
    P.VLR_TOTAL AS [Valor Total],
    V.NOME AS [Nome Vendedor]
FROM TB_PEDIDO AS P
INNER JOIN TB_VENDEDOR AS V
    ON P.CODVEN = V.CODVEN;



3.  Liste  os  campos  NUM_PEDIDO, DATA_EMISSAO  e  VLR_TOTAL  de  PEDIDOS,seguidos de NOME do cliente;

SELECT
	P.NUM_PEDIDO AS [Numero Pedido],
	P.DATA_EMISSAO AS [Data Emissao],
	P.VLR_TOTAL AS [Valor Total],
	C.NOME AS [Nome Cliente]
FROM TB_PEDIDO AS P
INNER JOIN TB_CLIENTE AS C
ON P.CODCLI = C.CODCLI;

4. Liste os pedidos com o nome do vendedor e o nome do cliente;

SELECT
	P.NUM_PEDIDO AS [Numero Pedido],
	V.NOME AS [Nome Vendedor],
	C.NOME AS [Nome Cliente]
FROM TB_PEDIDO AS P
INNER JOIN TB_VENDEDOR AS V
	ON P.CODVEN = V.CODVEN
INNER JOIN TB_CLIENTE AS C
	ON P.CODCLI = C.CODCLI;

5. Liste os itens de pedido (TB_ITENSPEDIDO) com o nome do produto (TB_PRODUTO.DESCRICAO);

SELECT
	I.NUM_PEDIDO AS [Numero Pedido],
	I.NUM_ITEM AS [Numero Item],
	I.COD_PRODUTO AS [Código Produto],
	P.DESCRICAO AS [Descricao Produto],
	P.PRECO_VENDA AS [Preco Produto]
FROM TB_ITENSPEDIDO AS I
INNER JOIN TB_PRODUTO AS P
	ON I.ID_PRODUTO = P.ID_PRODUTO;

6. Liste os campos COD_PRODUTO e DESCRICAO da tabela TB_PRODUTO, 
seguidos da descrição do tipo de produto (TB_TIPOPRODUTO.TIPO)

SELECT
	P.COD_PRODUTO AS [Código do Produto],
	P.DESCRICAO AS [Descrição Produto],
	TP.COD_TIPO AS [Código do Tipo de Produto],
	TP.TIPO AS [Tipo Produto]
FROM TB_PRODUTO AS P
INNER JOIN TB_TIPOPRODUTO AS TP
	ON P.COD_TIPO = TP.COD_TIPO;


7. Liste os campos COD_PRODUTO e DESCRICAO da tabela TB_PRODUTO, 
seguidos da descrição do tipo de produto (TB_TIPOPRODUTO.TIPO) 
e do nome da unidade de medida (TB_UNIDADE.UNIDADE);

SELECT
	P.COD_PRODUTO AS [Código Produto],
	P.DESCRICAO   AS [Desrição Produto],
	TP.TIPO		  AS [Tipo do Produto],
	U.UNIDADE	  AS [Nome Unidade]
FROM TB_PRODUTO AS P 
INNER JOIN TB_TIPOPRODUTO AS TP
	ON P.COD_TIPO = TP.COD_TIPO
INNER JOIN TB_UNIDADE AS U
	ON P.COD_UNIDADE = U.COD_UNIDADE;


8. Liste os campos NUM_PEDIDO, NUM_ITEM, COD_PRODUTO, QUANTIDADE e PR_UNITARIO da tabela TB_ITENSPEDIDO, 
e os campos COD_PRODUTO e DESCRICAO da tabela TB_PRODUTO, 
seguidos da descrição do tipo de produto (TB_TIPOPRODUTO.TIPO) 
e do nome da unidade de medida (TB_UNIDADE.UNIDADE);

SELECT
		I.NUM_PEDIDO AS [Numero Pedido],
		I.NUM_ITEM AS [Numero Item],
		I.COD_PRODUTO AS [Codigo do Item do Produto],
		I.QUANTIDADE AS [Quantidade Itens],
		I.PR_UNITARIO AS [Pedido Unitario],
		P.COD_PRODUTO AS [Codigo Produto],
		P.DESCRICAO AS [Nome Produto],
		TP.TIPO AS [Descricao Tipo Produto],
		U.UNIDADE AS [Nome da Unidade]
FROM TB_ITENSPEDIDO AS I
INNER JOIN TB_PRODUTO AS P
	ON I.ID_PRODUTO = P.ID_PRODUTO
INNER JOIN TB_TIPOPRODUTO AS TP
	ON P.COD_TIPO = TP.COD_TIPO
INNER JOIN TB_UNIDADE AS U
ON P.COD_UNIDADE = U.COD_UNIDADE;



9. Liste os campos NUM_PEDIDO, NUM_ITEM, COD_PRODUTO, QUANTIDADE e PR_UNITARIO da tabela TB_ITENSPEDIDO, 
e os campos COD_PRODUTO e DESCRICAO da tabela TB_PRODUTO, 
seguidos da descrição do tipo de produto (TB_TIPOPRODUTO.TIPO), 
do nome da unidade de medida (TB_UNIDADE.UNIDADE) e do nome da cor (TB_COR.COR);

SELECT
		I.NUM_PEDIDO AS [Numero Pedido],
		I.NUM_ITEM AS [Numero Item],
		I.COD_PRODUTO AS [Codigo do Item do Produto],
		I.QUANTIDADE AS [Quantidade Itens],
		I.PR_UNITARIO AS [Pedido Unitario],
		P.COD_PRODUTO AS [Codigo Produto],
		P.DESCRICAO AS [Descricao Produto],
		TP.TIPO AS [Tipo Produto],
		U.UNIDADE AS [Unidade Produto],
		C.COR AS [Cor do Produto]
FROM TB_ITENSPEDIDO AS I
INNER JOIN TB_PRODUTO AS P
	ON I.ID_PRODUTO = P.ID_PRODUTO
INNER JOIN TB_TIPOPRODUTO AS TP
	ON P.COD_TIPO = TP.COD_TIPO
INNER JOIN TB_UNIDADE AS U
	ON P.COD_UNIDADE = U.COD_UNIDADE
INNER JOIN TB_COR AS C
	ON I.CODCOR = C.CODCOR;

10. Liste todos os pedidos (TB_PEDIDO) do vendedor MARCELO em Jan/2014;
Este exercício não especifica quais campos devem ser exibidos. 
Escolha você os campos que devem ser mostrados.

SELECT
    V.CODVEN AS [Codigo Vendedor],
    V.NOME AS [Nome Vendedor],
    P.NUM_PEDIDO AS [Numero Pedido],
    P.VLR_TOTAL AS [Valor Pedido],
    P.DATA_EMISSAO AS [Data Pedido]
FROM TB_VENDEDOR AS V
INNER JOIN TB_PEDIDO AS P
    ON V.CODVEN = P.CODVEN
WHERE
    V.NOME = 'MARCELO'
    AND YEAR(P.DATA_EMISSAO) = 2014
    AND MONTH(P.DATA_EMISSAO) = 1;


	

11.  Liste  os  nomes  dos  clientes  (TB_CLIENTE.NOME)  que  efetuaram  compras  em  janeiro de 2014;

SELECT
	C.CODCLI AS [Codigo Cliente],
	C.NOME AS [Nome Cliente],
	P.NUM_PEDIDO AS [Numero Pedido],
	P.DATA_EMISSAO AS [Data Pedido]
FROM TB_CLIENTE AS C
INNER JOIN TB_PEDIDO AS P
	ON C.CODCLI = P.CODCLI
WHERE
	YEAR(P.DATA_EMISSAO) = 2014
    AND MONTH(P.DATA_EMISSAO) = 1;


12. Liste os nomes de produtos (TB_PRODUTO.DESCRICAO) que foram vendidos em janeiro de 2014;

SELECT
    PO.COD_PRODUTO AS [Codigo Produto],
    PO.DESCRICAO AS [Descricao Produto],
    PO.PRECO_VENDA AS [Preco Venda],
    PE.NUM_PEDIDO AS [Numero Pedido],
    PE.DATA_EMISSAO AS [Data Pedido]
FROM TB_PRODUTO AS PO
INNER JOIN TB_ITENSPEDIDO AS IP 
	ON PO.ID_PRODUTO = IP.ID_PRODUTO
INNER JOIN TB_PEDIDO AS PE 
	ON IP.NUM_PEDIDO = PE.NUM_PEDIDO
WHERE YEAR(PE.DATA_EMISSAO) = 2014 AND MONTH(PE.DATA_EMISSAO) = 1;



13. Liste NUM_PEDIDO, VLR_TOTAL (PEDIDOS) e NOME (TB_CLIENTE). 
Mostre apenas pedidos de janeiro de 2014 e clientes que tenham NOME iniciado com MARCIO;

SELECT
	P.NUM_PEDIDO AS [Numero Pedido],
	P.VLR_TOTAL AS [Valor Pedido],
	C.NOME AS [Nome Cliente]
FROM TB_PEDIDO AS P
INNER JOIN TB_CLIENTE AS C
	ON P.CODCLI = C.CODCLI
WHERE C.NOME LIKE '%MARCIO'
	AND YEAR(P.DATA_EMISSAO) = 2014 
	AND MONTH(P.DATA_EMISSAO) = 1;

14. Liste NUM_PEDIDO, QUANTIDADE vendida e PR_UNITARIO (TB_ITENSPEDIDO),DESCRICAO  (TB_PRODUTO), 
NOME  do  vendedor  que  vendeu  cada  item  de  pedido  (TB_VENDEDOR);

SELECT
    IP.NUM_PEDIDO AS [Numero Pedido],
    IP.QUANTIDADE AS [Quantidade Vendida],
    IP.PR_UNITARIO AS [Produto Unitario],
    PO.DESCRICAO AS [Descricao Produto],
    V.NOME AS [Nome Vendedor]
FROM TB_ITENSPEDIDO AS IP
INNER JOIN TB_PRODUTO AS PO
    ON IP.ID_PRODUTO = PO.ID_PRODUTO
INNER JOIN TB_PEDIDO AS P
    ON IP.NUM_PEDIDO = P.NUM_PEDIDO
INNER JOIN TB_VENDEDOR AS V
    ON P.CODVEN = V.CODVEN;



15. Liste todos os itens de pedido com desconto superior a 7%. Mostre NUM_PEDIDO, DESCRICAO  do  produto,  
NOME  do  cliente,  NOME  do  vendedor  e  QUANTIDADE vendida;

SELECT
    IP.NUM_PEDIDO AS [Numero Pedido],
    PR.DESCRICAO AS [Descricao Produto],
    IP.QUANTIDADE AS [Quantidade Vendida],
    IP.DESCONTO AS [Desconto Produto],
    C.NOME AS [Nome Cliente],
    V.NOME AS [Nome Vendedor]
FROM TB_ITENSPEDIDO AS IP
INNER JOIN TB_PRODUTO AS PR
    ON IP.ID_PRODUTO = PR.COD_PRODUTO
INNER JOIN TB_PEDIDO AS PE
    ON IP.NUM_PEDIDO = PE.NUM_PEDIDO
INNER JOIN TB_CLIENTE AS C
    ON PE.CODCLI = C.CODCLI
INNER JOIN TB_VENDEDOR AS V
    ON PE.CODVEN = V.CODVEN
WHERE IP.DESCONTO > 7;





16. Liste os itens de pedido com o nome do produto, a descrição do tipo, 
a descrição da unidade e o nome da cor, 
mas apenas os itens vendidos em janeiro de 2014 na cor LARANJA;

SELECT
	IP.NUM_PEDIDO,
	PO.COD_PRODUTO,
	PO.DESCRICAO,
	U.UNIDADE,
	C.COR,
	IP.DATA_ENTREGA
FROM TB_ITENSPEDIDO AS IP
INNER JOIN TB_PRODUTO AS PO
 ON IP.ID_PRODUTO = PO.ID_PRODUTO
INNER JOIN TB_UNIDADE AS U
ON PO.COD_UNIDADE = U.COD_UNIDADE
INNER JOIN TB_COR AS C
ON IP.CODCOR = C.CODOR
WHERE C.COR = 'Laranja'
AND YEAR(IP.DATA_ENTREGA) = 2014
AND MONTH(DATA_ENTREGA) = 1;



17. Liste NOME e FONE1 dos fornecedores que venderam o produto CANETA STAR I;
SELECT
    F.NOME AS [Nome Fornecedor,
    F.FONE1 AS [Fone Fornecedor]
FROM TB_FORNECEDOR AS F
INNER JOIN TB_PROD_FORN AS PF
    ON F.COD_FORNECEDOR = PF.COD_FORNECEDOR
INNER JOIN TB_PRODUTO AS P
    ON PF.ID_PRODUTO = P.ID_PRODUTO
WHERE P.DESCRICAO = 'CANETA STAR I';



18. Liste a DESCRICAO dos produtos comprados do fornecedor cujo NOME começa com LINCE;

SELECT
    P.DESCRICAO
FROM TB_PRODUTO AS P
INNER JOIN TB_PROD_FORN AS PF
    ON P.ID_PRODUTO = PF.ID_PRODUTO
INNER JOIN TB_FORNECEDOR AS F
    ON PF.COD_FORNECEDOR = F.COD_FORNECEDOR
WHERE F.NOME LIKE 'LINCE%';


19.  Liste  NOME  e  FONE1  dos  fornecedores,  bem  como  DESCRICAO  dos  produtos  com QTD_REAL abaixo de QTD_MINIMA;
SELECT
    FO.NOME,
    FO.FONE1,
    P.DESCRICAO
FROM TB_PRODUTO AS P
INNER JOIN TB_PROD_FORN AS PF
    ON P.ID_PRODUTO = PF.ID_PRODUTO
INNER JOIN TB_FORNECEDOR AS FO
    ON PF.COD_FORNECEDOR = FO.COD_FORNECEDOR
WHERE P.QTD_REAL < P.QTD_MINIMA;




20. Liste todos os produtos comprados do fornecedor cujo nome inicia-se com FESTO
SELECT
    P.DESCRICAO AS [Descrição do Produto],
    F.NOME AS [Nome do Fornecedor]
FROM TB_PRODUTO AS P
INNER JOIN TB_PROD_FORN AS PF
    ON P.COD_PRODUTO = PF.ID_PRODUTO
INNER JOIN TB_FORNECEDOR AS F
    ON PF.COD_FORNECEDOR = F.COD_FORNECEDOR
WHERE F.NOME LIKE 'FESTO%';

*/