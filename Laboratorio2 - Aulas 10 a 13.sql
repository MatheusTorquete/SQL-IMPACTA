/*
A – Criando um banco de dados para administrar as vendas de uma empresa 
1. Crie um banco de dados chamado PEDIDOS_VENDA e coloque-o em uso;
2. Nesse banco de dados, crie uma tabela chamada TB_PRODUTO com os seguintes campos
*/
CREATE DATABASE PEDIDOS_VENDA

USE PEDIDOS_VENDA;

-- Criar tabela TB_PRODUTO
CREATE TABLE TB_PRODUTO (
    CodigoProduto INT PRIMARY KEY IDENTITY(1,1),
    NomeProduto VARCHAR(100),
    CodigoUnidadeMedida INT,
    CodigoCategoria INT,
    QuantidadeEstoque NUMERIC,
    QuantidadeMinima NUMERIC,
    PrecoCusto NUMERIC,
    PrecoVenda NUMERIC,
    CaracteristicasTecnicas TEXT,
    Fotografia VARBINARY(MAX)
);

-- Criar tabela TB_UNIDADE
CREATE TABLE TB_UNIDADE (
    CodigoUnidade INT PRIMARY KEY IDENTITY(1,1),
    NomeUnidade VARCHAR(100)
);

-- Inserir dados na tabela TB_UNIDADE
INSERT INTO TB_UNIDADE (NomeUnidade)
VALUES
    ('PEÇAS'),
    ('METROS'),
    ('QUILOGRAMAS'),
    ('DÚZIAS'),
    ('PACOTE'),
    ('CAIXA');

-- Criar tabela TB_CATEGORIA
CREATE TABLE TB_CATEGORIA (
    CodigoCategoria INT PRIMARY KEY IDENTITY(1,1),
    NomeCategoria VARCHAR(100)
);
-- Na  tabela  TB_CATEGORIA,  insira  os  seguintes  dados:  MOUSE, PEN-DRIVE, MONITOR DE VIDEO, TECLADO, CPU, CABO DE RED
-- Inserir dados na tabela TB_CATEGORIA
INSERT INTO TB_CATEGORIA (NomeCategoria)
VALUES
    ('MOUSE'),
    ('PEN-DRIVE'),
    ('MONITOR DE VIDEO'),
    ('TECLADO'),
    ('CPU'),
    ('CABO DE REDE');

-- 7
-- Inserir produtos na tabela TB_PRODUTO com a cláusula OUTPUT
DECLARE @InsertedProducts TABLE (
    CodigoProduto INT,
    NomeProduto VARCHAR(100),
    CodigoUnidadeMedida INT,
    CodigoCategoria INT,
    QuantidadeEstoque NUMERIC,
    QuantidadeMinima NUMERIC,
    PrecoCusto NUMERIC,
    PrecoVenda NUMERIC,
    CaracteristicasTecnicas TEXT,
    Fotografia VARBINARY(MAX)
);
-- 7
INSERT INTO TB_PRODUTO (NomeProduto, CodigoUnidadeMedida, CodigoCategoria, QuantidadeEstoque, QuantidadeMinima, PrecoCusto, PrecoVenda)
OUTPUT INSERTED.* INTO @InsertedProducts
VALUES
    ('Caneta Azul', 1, 1, 150, 40, 0.50, 0.75),
    ('Caneta Verde', 1, 1, 150, 40, 0.50, 0.75),
    ('Caneta Vermelha', 1, 1, 80, 35, 0.50, 0.75),
    ('Lápis', 1, 1, 800, 40, 0.50, 0.80),
    ('Régua', 1, 1, 101, 1, 1.00, 1.50);

-- Exibir os valores inseridos
SELECT * FROM @InsertedProducts;

-- Inserir produtos na tabela TB_PRODUTO com a cláusula OUTPUT
INSERT INTO TB_PRODUTO (NomeProduto, CodigoUnidadeMedida, CodigoCategoria, QuantidadeEstoque, QuantidadeMinima, PrecoCusto, PrecoVenda)
OUTPUT INSERTED.*
VALUES
    ('Caneta Azul', 1, 1, 150, 40, 0.50, 0.75),
    ('Caneta Verde', 1, 1, 150, 40, 0.50, 0.75),
    ('Caneta Vermelha', 1, 1, 80, 35, 0.50, 0.75),
    ('Lápis', 1, 1, 800, 40, 0.50, 0.80),
    ('Régua', 1, 1, 101, 1, 1.00, 1.50);
