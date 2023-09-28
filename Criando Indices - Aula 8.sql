/*
�ndices - Trazem melhorias e desempenho para o banco.
Os registros s�o armazenados em p�ginas de dados como se fossem um livro ou revista.
Facilitar e acelarar o resultado na BUSCA.
*/

-- Desvantagem - Ocupam muito espa�o em disco
-- Torna lento a opera��o de inser��o atualiza��o ou exclus�o
-- Evite criar indices em colunas que sofrem muitas altera��es.

-- Clustered: Onde os dados ficam fisicamente e ordenados com a estrutura da tabela

-- NonClustered: Onde os dados n�o ficam ordenados fisicamente em disco e � separado da estrutura da tabela

USE Concessionaria;

-- visualizar indices
EXEC sp_help tblEstoque;

-- Criando �ndice
-- podemos definir se � clustered ou n�o
CREATE  NONCLUSTERED INDEX IX_tblEstoque
ON tblEstoque(dataEntrada DESC);

-- apenas os �ndices criados
EXEC sp_helpindex tblEstoque;

-- Excluir �ndice
DROP INDEX IX_tblEstoque
ON tblEstoque;