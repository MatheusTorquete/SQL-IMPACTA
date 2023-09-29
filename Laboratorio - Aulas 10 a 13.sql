/*
Laboratório 2A – Atualizando e excluindo dados1. 
Coloque o banco de dados PEDIDOS em uso
*/

-- Aumentar o preço de custo de todos os produtos do tipo 2 em 15%:
BEGIN TRANSACTION;

UPDATE TB_PRODUTO
SET PrecoCusto = PrecoCusto * 0.15
OUTPUT INSERTED.*
WHERE CodigoTipo = 2;

-- se tiver ok
COMMIT;

-- Se não
ROLLBACK TRAN;


-- Fazer com que os preços de venda dos produtos do tipo 2 fiquem 30% acima do preço de custo:
BEGIN TRANSACTION;

UPDATE TB_PRODUTO
SET PrecoVenda = PrecoCusto * 0.30
OUTPUT INSERTED.*
WHERE CodigoTipo = 2;

-- se tiver ok
COMMIT;

-- Se não
ROLLBACK TRAN;


-- Alterar o campo IPI de todos os produtos com COD_TIPO = 3 para 5%:
BEGIN TRANSACTION;

UPDATE TB_PRODUTO
SET IPI = 5
OUTPUT INSERTED.*
WHERE CodigoTipo = 3;

-- se tiver ok
COMMIT;

-- Se não
ROLLBACK TRAN;


-- Reduzir em 10% o campo QTD_MINIMA de todos os produtos (multiplicar QTD_MINIMA por 0.9):
BEGIN TRANSACTION;

UPDATE TB_PRODUTO
OUTPUT INSERTED.*
SET QtdMinima = QtdMinima * 0.9;

-- se tiver ok
COMMIT;

-- Se não
ROLLBACK TRAN;


-- Alterar os seguintes campos do cliente de código 11:
BEGIN TRANSACTION;

UPDATE TB_CLIENTE
SET ENDERECO = 'AV. CELSO GARCIA, 1234',
    BAIRRO = 'TATUAPE',
    CIDADE = 'SAO PAULO',
    ESTADO = 'SP',
    CEP = '03407080'
	OUTPUT INSERTED.*
WHERE CodigoCliente = 11;

-- se tiver ok
COMMIT;

-- Se não
ROLLBACK TRAN;

-- Copie ENDERECO, BAIRRO, CIDADE, ESTADO e CEP do cliente de código 13 para os campos END_COB, BAI_COB, CID_COB, EST_COB e CEP_COB do mesmo client
BEGIN TRANSACTION;

DECLARE @ClienteID INT;
SELECT @ClienteID = ID FROM TB_CLIENTE WHERE CODIGO = 13;

UPDATE TB_CLIENTE
SET
    END_COB = (SELECT ENDERECO FROM TB_CLIENTE WHERE ID = @ClienteID),
    BAI_COB = (SELECT BAIRRO FROM TB_CLIENTE WHERE ID = @ClienteID),
    CID_COB = (SELECT CIDADE FROM TB_CLIENTE WHERE ID = @ClienteID),
    EST_COB = (SELECT ESTADO FROM TB_CLIENTE WHERE ID = @ClienteID),
    CEP_COB = (SELECT CEP FROM TB_CLIENTE WHERE ID = @ClienteID)
OUTPUT INSERTED.*
WHERE ID = @ClienteID;

-- se tiver ok
COMMIT;

-- se não
ROLLBACK TRAN;

-- Altere a tabela TB_CLIENTE, mudando o conteúdo do campo ICMS de clientes dos estados RJ, RO, AC, RR, MG, PR, SC, RS, MS e MT para 12
BEGIN TRAN
UPDATE TB_CLIENTE
SET ICMS = 12
WHERE ESTADO IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 'RS', 'MS', 'MT')
OUTPUT INSERTED.*;

-- se tiver ok
COMMIT;

-- se não
ROLLBACK TRAN

-- Altere os campos ICMS de todos os clientes de SP para 18;
BEGIN TRAN
	UPDATE TB_CLIENTE
	SET ICMS = 18
	WHERE ESTADO = 'SP'
	OUTPUT INSERTED.*;

-- OK
COMMIT;

-- Não OK
ROLLBACK TRAN;


-- Altere o campo ICMS para 7 para clientes que não sejam dos estados RJ, RO, AC, RR, MG, PR, SC, RS, MS, MT e SP
BEGIN TRAN
UPDATE TB_CLIENTE
SET ICMS = 7
WHERE ESTADO NOT IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 'RS', 'MS', 'MT', 'SP')
OUTPUT INSERTED.*;

-- se tiver ok
COMMIT;

-- se não
ROLLBACK TRAN

-- Altere para 7 o campo DESCONTO da tabela TB_ITENSPEDIDO, mas somente dos itens do produto com ID_PRODUTO = 8, com data de entrega em janeiro de 2014 e com QUANTIDADE acima de 1000
BEGIN TRAN
	UPDATE TB_ITENSPEDIDO
	SET DESCONTO = 7
	WHERE ID_PRODUTO = 8
		AND MONTH(DATA_ENTREGA) = 1  -- Janeiro
		AND YEAR(DATA_ENTREGA) = 2014
		AND QUANTIDADE > 1000
	OUTPUT INSERTED.*;

--ok
COMMIT TRAN
-- nao ok
ROLLBACK TRAN

-- Zere o campo DESCONTO de todos os itens de pedido com quantidade abaixo de 1000, com data de entrega posterior a 1-Junho-2014 e que tenham desconto acima de zero;
BEGIN TRAN
	UPDATE TB_ITENSPEDIDO
	SET DESCONTO = 0
	WHERE QUANTIDADE < 1000
		AND DATA_ENTREGA > '2014-06-01'
		AND DESCONTO > 0
	OUTPUT INSERTED.*;

-- ok
COMMIT;
-- Não ok
ROLLBACK TRAN

-- Usando SELECT INTO, gere uma cópia da tabela VENDEDORES com o nome de VENDEDORES_TMP;
BEGIN TRAN
	SELECT *
INTO VENDEDORES_TMP
FROM VENDEDORES;

-- ok
COMMIT
-- nao ok
ROLLBACK TRAN


-- Exclua de VENDEDORES_TMP os registros com CODVEN acima de 5
BEGIN TRAN
	DELETE FROM VENDEDORES_TMP
	OUTPUT INSERTED.*
	WHERE CODVEN > 5;


COMMIT

ROLLBACK TRAN


-- Utilizando  o  comando  SELECT...INTO,  faça  uma  cópia  da  tabela  TB_PEDIDOchamada COPIA_PEDIDOS
BEGIN TRAN
	SELECT *
	INTO COPIA_PEDIDOS
	FROM TB_PEDIDO;

COMMIT



-- 17. Excluir os registros da tabela `COPIA_PEDIDOS` que sejam do vendedor código 2:
BEGIN TRAN
	DELETE FROM COPIA_PEDIDOS
	WHERE COD_VENDEDOR = 2;

COMMIT

ROLLBACK TRAN

-- 18. Excluir os registros da tabela `COPIA_PEDIDOS` que sejam do primeiro semestre de 2014:
BEGIN TRAN
	DELETE FROM COPIA_PEDIDOS
	WHERE YEAR(DataPedido) = 2014 AND MONTH(DataPedido) <= 6;
COMMIT

ROLLBACK TRAN



-- 19. Excluir todos os registros restantes da tabela `COPIA_PEDIDOS`:

DELETE FROM COPIA_PEDIDOS;


-- 20. Excluir a tabela `COPIA_PEDIDOS` do banco de dados:

DROP TABLE COPIA_PEDIDOS;

