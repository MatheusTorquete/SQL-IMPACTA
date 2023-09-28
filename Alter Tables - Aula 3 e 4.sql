-- Nova Coluna
ALTER TABLE tblEstoque
ADD placa NCHAR(8) NOT NULL;

-- Alterando tamanho da coluna
ALTER TABLE tblEstoque
ALTER COLUMN placa NCHAR(7) NULL;

-- Exclusão , não podemos alterar ou excluir colunas que possuem CONSTRAINTS. (PK-FK)
ALTER TABLE tblEstoque
DROP COLUMN placa;

ALTER TABLE nomeTabela
DROP CONSTRAINT nomeConstraint