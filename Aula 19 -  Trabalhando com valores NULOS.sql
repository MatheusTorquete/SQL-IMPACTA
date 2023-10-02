/*
FUN��O ISNULL
Utilizada para tratar valores nulos em um resultado

ISNULL(campo, VALOR que ser� tratado)

Onde valor ser� um n�mero ou texto que ser� substituido do null

*/

SELECT * FROM Dados;

-- TRANSA��O COM UPDATE para ver os NULL
BEGIN TRAN
	UPDATE Dados
	SET Vendedor = NULL
	WHERE Pedido IN (21820, 21872, 21924, 21963, 22080);

	-- caso desse errado
ROLLBACK TRAN
-- deu certo
COMMIT TRAN

-- Fun��o ISNULL
SELECT
	Pedido, ISNULL(Vendedor, 'NDA') AS Vendedor, Produto, Total
FROM Dados


/*
Operador IS NULL / IS NOT NULL
Filtra dados nulos ou n�o nulos
*/

-- Filtrar Nulos
SELECT
	Pedido, Vendedor, Produto, Total
FROM Dados
WHERE Vendedor IS NULL;

-- N�o Nulos
SELECT
	Pedido, Vendedor, Produto, Total
FROM Dados
WHERE Vendedor IS NOT NULL;


/*
FUN��O COALESCE
Verifica a lista de um ou mais campos
e retorna o primeiro valor n�o nulo

COALESCE(campo1,campo2,campo3, valor)

Onde o valor ser� um n�mero ou texto que ser� exibido caso todas as colunas da lista estejam nulas
*/

-- COALESCE
-- cria��o para analisar
CREATE Table Cotacao
(
	codigo INT IDENTITY,
	produto VARCHAR(50) NOT NULL,
	cotacao1 MONEY		NULL,
	cotacao2 MONEY		NULL,
	cotacao3 MONEY		NULL
);
-- colocando cota�ao em v�rias op��es, para entedermos o uso do COALESCE
INSERT INTO Cotacao
VALUES
--('Mouse', NULL, 25, NULL),
--('Impressora', 200, NULL, 350),
--('Monitor', NULL, NULL, 500),
--('HD Externo', NULL, 600, NULL),
--('Teclado', NULL, NULL, NULL);


-- Verificando em casos que n�o tenham cota��o, se tiver NULL, ser� 0
SELECT
	Produto,
	COALESCE(cotacao1, cotacao2, cotacao3, 0) AS Cota��o -- caso n�o encontrar nenhum valor ser� 0
FROM Cotacao

-- Podemos utilizar no WHERE
-- Verificando apenas casos que tenham nulos
SELECT * FROM Cotacao
WHERE COALESCE(cotacao1, cotacao2, cotacao3, 0) = 0;