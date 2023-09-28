/*
Índices - Trazem melhorias e desempenho para o banco.
Os registros são armazenados em páginas de dados como se fossem um livro ou revista.
Facilitar e acelarar o resultado na BUSCA.
*/

-- Desvantagem - Ocupam muito espaço em disco
-- Torna lento a operação de inserção atualização ou exclusão
-- Evite criar indices em colunas que sofrem muitas alterações.

-- Clustered: Onde os dados ficam fisicamente e ordenados com a estrutura da tabela

-- NonClustered: Onde os dados não ficam ordenados fisicamente em disco e é separado da estrutura da tabela

USE Concessionaria;

-- visualizar indices
EXEC sp_help tblEstoque;

-- Criando Índice
-- podemos definir se é clustered ou não
CREATE  NONCLUSTERED INDEX IX_tblEstoque
ON tblEstoque(dataEntrada DESC);

-- apenas os índices criados
EXEC sp_helpindex tblEstoque;

-- Excluir Índice
DROP INDEX IX_tblEstoque
ON tblEstoque;