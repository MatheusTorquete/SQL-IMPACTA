/*
FUNÇÃO ISNULL
Utilizada para tratar valores nulos em um resultado

ISNULL(campo, VALOR que será tratado)

Onde valor será um número ou texto que será substituido do null

*/

SELECT * FROM Dados;

-- TRANSAÇÃO COM UPDATE para ver os NULL
BEGIN TRAN
	UPDATE Dados
	SET Vendedor = NULL
	WHERE Pedido IN (21820, 21872, 21924, 21963, 22080);

	-- caso desse errado
ROLLBACK TRAN
-- deu certo
COMMIT TRAN

-- Função ISNULL
SELECT
	Pedido, ISNULL(Vendedor, 'NDA') AS Vendedor, Produto, Total
FROM Dados


/*
Operador IS NULL / IS NOT NULL
Filtra dados nulos ou não nulos
*/

-- Filtrar Nulos
SELECT
	Pedido, Vendedor, Produto, Total
FROM Dados
WHERE Vendedor IS NULL;

-- Não Nulos
SELECT
	Pedido, Vendedor, Produto, Total
FROM Dados
WHERE Vendedor IS NOT NULL;


/*
FUNÇÃO COALESCE
Verifica a lista de um ou mais campos
e retorna o primeiro valor não nulo

COALESCE(campo1,campo2,campo3, valor)

Onde o valor será um número ou texto que será exibido caso todas as colunas da lista estejam nulas
*/

-- COALESCE
-- criação para analisar
CREATE Table Cotacao
(
	codigo INT IDENTITY,
	produto VARCHAR(50) NOT NULL,
	cotacao1 MONEY		NULL,
	cotacao2 MONEY		NULL,
	cotacao3 MONEY		NULL
);
-- colocando cotaçao em várias opções, para entedermos o uso do COALESCE
INSERT INTO Cotacao
VALUES
--('Mouse', NULL, 25, NULL),
--('Impressora', 200, NULL, 350),
--('Monitor', NULL, NULL, 500),
--('HD Externo', NULL, 600, NULL),
--('Teclado', NULL, NULL, NULL);


-- Verificando em casos que não tenham cotação, se tiver NULL, será 0
SELECT
	Produto,
	COALESCE(cotacao1, cotacao2, cotacao3, 0) AS Cotação -- caso não encontrar nenhum valor será 0
FROM Cotacao

-- Podemos utilizar no WHERE
-- Verificando apenas casos que tenham nulos
SELECT * FROM Cotacao
WHERE COALESCE(cotacao1, cotacao2, cotacao3, 0) = 0;