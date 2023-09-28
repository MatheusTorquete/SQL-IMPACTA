-- Inserindo Registros

-- Insert Posicional
--INSERT INTO tblMarcas
--VALUES ('FIAT');

-- Insert várias linhas
--INSERT INTO tblMarcas
--VALUES
--	('FORD'),
--	('CHEVROLET'),
--	('VOLKSWAGEN'),
--	('HONDA');

	-- Visualizando
	SELECT * FROM tblMarcas

	-- está mostrando assim pois está sendo mostrado pela ordenação da LETRA
	-- o IDENTITY ao dar erro de inserção, não utiliza mais aquele número
	-- por isso o 2 não está 

---- Insert Declarativo, não precisamos passar a coluna que é IDENTITY
-- podemos arrastar a pasta Columns para os nomes que irá ser auto completado)
--INSERT INTO tblModelos
--(idMarca, nomeModelo)
--VALUES (4, 'Onix'),
--		(1, 'Uno'),
--		(3 , 'Eco Sport');

SELECT * FROM tblModelos


--INSERT INTO tblEstoque
--(idModelo, dataEntrada, precoEstoque)
--VALUES 
--	(1, '2017-01-05', 45000);

--	-- Simulando Erro
--INSERT INTO tblEstoque
--(idModelo, dataEntrada, precoEstoque)
--VALUES 
--	(1, '2017-01-05', 2000);




-- 1. **Inserindo 10 registros na tabela TB_CARGO**:
--INSERT INTO TB_CARGO (CARGO, SALARIO_INIC)
--VALUES
--    ( 'Gerente', 8000),
--    ('Analista', 5000),
--    ('Assistente', 3500),
--    ('Desenvolvedor', 6000),
--    ('Coordenador', 7500),
--    ('Vendedor', 4000),
--    ('Atendente', 3000),
--    ('Estagiário', 1500),
--    ('Supervisor', 7000),
--    ('Diretor', 10000);


-- 2. **Inserindo 10 registros na tabela TB_CLIENTE**:
--INSERT INTO TB_CLIENTE (NOME, FANTASIA, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP,
--    END_COB, BAI_COB, CID_COB, EST_COB, CEP_COB, CGC, INSCRICAO, FONE1, FAX, E_MAIL, DATA_CAD,
--    ICM, SELECAO, REVENDA_CONSUMIDOR)
--VALUES
--    ('Matheus', 'Empresa Tec', 'Rua São Paulo 123', 'Bairro Central', 'São Paulo', 'SP', '01234567',
--    'Rua Cobrança 456', 'Bairro Cobrança', 'Rio de Janeiro', 'RJ', '76543210', '123456789000101', '123456', '11987654321', '1155555555', 'matheus@example.com', 2023-07-12,
--    0.19, 'A', 'R'),
--    ('Rafael', 'Info Solutions', 'Avenida Paulista 789', 'Bairro Moderno', 'São Paulo', 'SP', '23456789',
--    'Rua Cobrança 890', 'Bairro Cobrança', 'Rio de Janeiro', 'RJ', '87654321', '987654321000102', '654321', '11988887777', '1155555555', 'rafael@example.com', 2023-06-20,
--    0.18, 'B', 'C'),
--    ('Juliana', 'Tech Masters', 'Rua Bela Vista 456', 'Bairro Nobre', 'Belo Horizonte', 'MG', '54321098',
--    'Rua Cobrança 234', 'Bairro Cobrança', 'São Paulo', 'SP', '01234567', '111222333000103', '111333', '31977776666', '3133333333', 'juliana@example.com', 2023-04-15,
--    0.17, 'A', 'R'),
--    ('Anderson', 'SoftTech', 'Avenida Copacabana 987', 'Bairro Praiano', 'Rio de Janeiro', 'RJ', '45678901',
--    'Avenida Cobrança 765', 'Bairro Cobrança', 'Rio de Janeiro', 'RJ', '87654321', '444555666000104', '444555', '21999998888', '2122222222', 'anderson@example.com', 2023-03-10,
--    0.16, 'B', 'C'),
--    ('Carla', 'Inovação Ltda', 'Rua das Flores 567', 'Bairro Alegre', 'São Paulo', 'SP', '56789012',
--    'Rua Cobrança 123', 'Bairro Cobrança', 'São Paulo', 'SP', '01234567', '777.888999000105', '777888', '11999997777', '1155555555', 'carla@example.com', 2023-02-01,
--    0.15, 'A', 'R'),
--    ('Lucas', 'Digital Solutions', 'Avenida Moderna 234', 'Bairro Metropolitano', 'Belo Horizonte', 'MG', '67890123',
--    'Avenida Cobrança 345', 'Bairro Cobrança', 'Belo Horizonte', 'MG', '23456789', '222333444000106', '222333', '31988889999', '3133333333', 'lucas@example.com', 2023-08-18,
--    0.14, 'B', 'C'),
--    ('Camila', 'DataTech', 'Avenida Central 345', 'Bairro Urbano', 'São Paulo', 'SP', '78901234',
--    'Rua Cobrança 567', 'Bairro Cobrança', 'São Paulo', 'SP', '01234567', '555666777000107', '555666', '11966665555', '1155555555', 'camila@example.com', 2023-09-20,
--    0.13, 'A', 'R'),
--    ('Pedro', 'InfoWare', 'Rua Comercial 123', 'Bairro Central', 'Rio de Janeiro', 'RJ', '89012345',
--    'Rua Cobrança 890', 'Bairro Cobrança', 'Rio de Janeiro', 'RJ', '87654321', '888999000000108', '888999', '21944443333', '2122222222', 'pedro@example.com', 2023-07-02,
--    0.12, 'B', 'C'),
--    ('Fernanda', 'TechSolutions', 'Avenida Moderna 567', 'Bairro Metropolitano', 'Belo Horizonte', 'MG', '90123456',
--    'Rua Cobrança 123', 'Bairro Cobrança', 'Belo Horizonte', 'MG', '23456789', '333444555000109', '333444', '31955556666', '3133333333', 'fernanda@example.com', 2023-01-05,
--    0.11, 'A', 'R'),
--    ('Gustavo', 'SmartTech', 'Rua São Paulo 789', 'Bairro Urbano', 'São Paulo', 'SP', '01234567',
--    'Avenida Cobrança 567', 'Bairro Cobrança', 'São Paulo', 'SP', '01234567', '111222333000110', '111222', '11911112222', '1155555555', 'gustavo@example.com', 2023-10-10,
--    0.10, 'B', 'C');




-- 3. **Inserindo 10 registros na tabela TB_COR**:
--INSERT INTO TB_COR (CODCOR, COR)
--VALUES
--    (1, 'Vermelho'),
--    (2, 'Verde'),
--    (3, 'Azul'),
--    (4, 'Amarelo'),
--    (5, 'Laranja'),
--    (6, 'Roxo'),
--    (7, 'Branco'),
--    (8, 'Preto'),
--    (9, 'Cinza'),
--    (10, 'Marrom');


-- 4. **Inserindo 10 registros na tabela TB_DEPARTAMENTO**:
--INSERT INTO TB_DEPARTAMENTO (DEPTO)
--VALUES
--    ('TI'),
--    ('Marketing'),
--    ('Vendas'),
--    ('Recursos Humanos'),
--    ('Financeiro'),
--    ('Produção'),
--    ('Logística'),
--    ('Qualidade'),
--    ('Compras'),
--    ('Administração');


-- 5. **Inserindo 10 registros na tabela TB_PENDENTE**:
--INSERT INTO TB_DEPENDENTE (CODFUN, CODDEP, NOME, DATA_NASCIMENTO)
--VALUES
--    (2, 1, 'Alex', '1990-01-01'),
--    (3, 2, 'Higor', '1992-02-02'),
--    (4, 3, 'Thiago', '1993-04-04'),
--    (5, 4, 'Vinicius', '1995-06-06'),
--    (6, 5, 'Bruno', '1996-07-08'),
--    (7, 6, 'Davi', '1997-08-08'),
--    (8, 7, 'Valdemir', '1998-09-09'),
--    (9, 8, 'Marcos', '1989-01-07'),
--    (10, 9, 'Ana', '1987-04-03'),
--    (10, 10, 'Lola', '2000-01-09');



-- 6. **Inserindo 10 registros na tabela TB_EMPREGADO**:
--INSERT INTO TB_EMPREGADO (NOME, NUM_DEPEND, DATA_NASCIMENTO, COD_DEPTO, COD_CARGO, DATA_ADMISSAO,
--    SALARIO, SINDICALIZADO, OBS)
--VALUES
--    ('João Silva', 2, 1990-03-10, 1, 1, 2010-06-15, 5500, 'S', 'Observação sobre João.'),
--    ('Maria Santos', 1, 1985-08-22, 2, 2, 2008-11-30, 4800, 'N', 'Comentários a respeito de Maria.'),
--    ('Carlos Oliveira', 3, 1982-05-18, 3, 3, 2005-02-05, 6000, 'S', 'Este é Carlos, um ótimo funcionário.'),
--    ('Amanda Rodrigues', 0, 1995-12-03, 4, 4, 2019-09-20, 5200, 'N', 'Amanda é nossa mais recente adição.'),
--    ('Lucas Pereira', 2, 1988-11-27, 5, 5, 2007-07-08, 6800, 'S', 'Lucas se destaca em sua área.'),
--    ('Fernanda Alves', 1, 1992-04-14, 6, 6, 2013-03-12, 4400, 'N', 'Fernanda é eficiente e dedicada.'),
--    ('Rafael Costa', 4, 1980-07-06, 7, 7, 2002-09-25, 3200, 'S', 'Rafael tem uma excelente atitude.'),
--    ('Patricia Souza', 0, 1998-01-30, 8, 8, 2020-05-18, 6000, 'N', 'Patricia está sempre disposta a ajudar.'),
--    ('Gustavo Santos', 2, 1987-09-17, 9, 9, 2004-08-10, 5900, 'S', 'Gustavo é um líder nato.'),
--    ('Larissa Ferreira', 1, 1993-06-08, 10, 10, 2011-04-02, 7200, 'N', 'Larissa é muito dedicada ao trabalho.');




-- 7. **Inserindo 10 registros na tabela TB_FORNECEDOR**:
--INSERT INTO TB_FORNECEDOR (NOME, NOME_FANTASIA, FISICA_JURIDICA, COD_PAIS, CPF, CNPJ,
--    INSC_ESTADUAL, ENDERECO, CEP, BAIRRO, CIDADE, ESTADO, FONE1, FONE2, FAX, E_MAIL, WEB_SITE,
--    COD_COND_PAGTO, COD_RAMO_ATIVIDADE, LIMITE_CREDITO, PRAZO_MAX, SN_ATIVO)
--VALUES
--    ('Paulo Imóveis', 'Imóveis SP', 'F', 1, '11111111111', NULL,
--    'Inscrição 1', 'Av. Das Nações Unidas', 'CEP 1', 'São Paulo', 'São Paulo', 'SP',
--    'Fone 1', 'Fone 2', 'Fax 1', 'contato@pauloimoveis.com.br', 'pauloimoveis.com.br',
--    1, 1, 10000, 30, 'S'),
--    ('Logística Tech', 'Tech Log', 'F', 1, '22222222222', NULL,
--    'Inscrição 2', 'Rua Logística', 'CEP 2', 'Bairro Logístico', 'Cidade Logística', 'LG',
--    'Fone 2', 'Fone 2', 'Fax 2', 'contato@techlog.com.br', 'techlog.com.br',
--    2, 2, 8000, 45, 'S'),
--    ('Insumos Brasil', 'Insumos MG', 'F', 1, '33333333333', NULL,
--    'Inscrição 3', 'Avenida Insumos', 'CEP 3', 'Bairro Insumos', 'Cidade Insumos', 'MG',
--    'Fone 3', 'Fone 3', 'Fax 3', 'contato@insumos.com.br', 'insumos.com.br',
--    3, 3, 12000, 60, 'S'),
--    ('EletroParts', 'EletroParts RJ', 'F', 1, '44444444444', NULL,
--    'Inscrição 4', 'Rua Eletro', 'CEP 4', 'Bairro Eletro', 'Cidade Eletro', 'EL',
--    'Fone 4', 'Fone 4', 'Fax 4', 'contato@eletroparts.com.br', 'eletroparts.com.br',
--    4, 4, 15000, 30, 'S'),
--    ('Fashion Trends', 'Trends Fashion', 'F', 1, '55555555555', NULL,
--    'Inscrição 5', 'Avenida Fashion', 'CEP 5', 'Bairro Fashion', 'Cidade Fashion', 'MA',
--    'Fone 5', 'Fone 5', 'Fax 5', 'contato@fashiontrends.com.br', 'fashiontrends.com.br',
--    5, 5, 20000, 45, 'S'),
--    ('Farmácia Saúde', 'Saúde Farm', 'F', 1, '66666666666', NULL,
--    'Inscrição 6', 'Rua Saúde', 'CEP 6', 'Bairro Saúde', 'Cidade Saúde', 'SA',
--    'Fone 6', 'Fone 6', 'Fax 6', 'contato@farmaciasaude.com.br', 'farmaciasaude.com.br',
--    1, 2, 18000, 60, 'S'),
--    ('Materiais Construção', 'Materiais SP', 'F', 1, '77777777777', NULL,
--    'Inscrição 7', 'Avenida Materiais', 'CEP 7', 'Bairro Materiais', 'Cidade Materiais', 'CO',
--    'Fone 7', 'Fone 7', 'Fax 7', 'contato@materiais.com.br', 'materiais.com.br',
--    2, 3, 22000, 30, 'S'),
--    ('Têxtil Fashion', 'Têxtil RJ', 'F', 1, '88888888888', NULL,
--    'Inscrição 8', 'Rua Têxtil', 'CEP 8', 'Bairro Têxtil', 'Cidade Têxtil', 'TA',
--    'Fone 8', 'Fone 8', 'Fax 8', 'contato@textilfashion.com.br', 'textilfashion.com.br',
--    3, 4, 17000, 40, 'S'),
--    ('Auto Peças', 'Peças Auto', 'F', 1, '99999999999', NULL,
--    'Inscrição 9', 'Rua Auto', 'CEP 9', 'Bairro Auto', 'Cidade Auto', 'SE',
--    'Fone 9', 'Fone 9', 'Fax 9', 'contato@pecasauto.com.br', 'pecasauto.com.br',
--    4, 5, 25000, 60, 'S'),
--    ('Equipamentos Eletrônicos', 'Eletrônicos Equip', 'F', 1, '10101010101', NULL,
--    'Inscrição 10', 'Avenida Eletrônicos', 'CEP 10', 'Bairro Eletrônicos', 'Cidade Eletrônicos', 'SM',
--    'Fone 10', 'Fone 10', 'Fax 10', 'contato@eletronicosequip.com.br', 'eletronicosequip.com.br',
--    5, 1, 30000, 45, 'S');




-- 8. **Inserindo 10 registros na tabela TB_ITENSPEDIDO**:
-- SÓ FALTA OS ITENSPEDIDO 29.08.23 VERIFICAR A TABELA DE PEDIDOS, PRODUTOS E CODCOR
INSERT INTO TB_ITENSPEDIDO (NUM_PEDIDO, NUM_ITEM, ID_PRODUTO, COD_PRODUTO, CODCOR, QUANTIDADE, PR_UNITARIO, DATA_ENTREGA, SITUACAO, DESCONTO)
VALUES
    (5, 4, 4, 'Prod4', 1, 3, 200, 2023-07-18, 'R', 0.10),
    (6, 5, 5, 'Prod5', 2, 2, 1500, 2023-07-25, 'K', 0.5),
    (7, 6, 6, 'Prod6', 3, 7, 600, 2023-07-22, 'O', 0.6),
    (8, 7, 7, 'Prod7', 4, 4, 400, 2023-07-28, 'S', 0.7),
    (9, 8, 8, 'Prod8', 5, 6, 80, 2023-07-26, 'P', 0.8),
    (10, 9, 9, 'Prod9', 6, 1, 120, 2023-07-30, 'M', 0.2),
    (11, 10, 10, 'Prod10', 7, 9, 80, 2023-07-29, 'R', 0.1);





-- 9. **Inserindo 10 registros na tabela TB_PEDIDO**:
--INSERT INTO TB_PEDIDO (CODCLI, CODVEN, DATA_EMISSAO, VLR_TOTAL, SITUACAO, OBSERVACOES, TIPO_PEDIDO)
--VALUES
--    (7, 1, 2023-06-15, 800, 'S', 'Observações 4', 'A'),
--    (8, 2, 2023-07-05, 1200, 'S', 'Observações 5', 'B'),
--    (9, 3, 2023-06-25, 2500, 'N', 'Observações 6', 'C'),
--    (10, 4, 2023-06-10, 700, 'N', 'Observações 7', 'D'),
--    (11, 5, 2023-07-02, 1800, 'N', 'Observações 8', 'H'),
--    (12, 6, 2023-06-20, 900, 'S', 'Observações 9', 'E'),
--    (13, 7, 2023-06-08, 1300, 'N', 'Observações 10', 'F'),
--    (14, 8, 2023-07-12, 600, 'S', 'Observações 11', 'A'),
--    (15, 9, 2023-07-15, 1000, 'S', 'Observações 12', 'B'),
--    (16, 10, 2023-07-18, 1900, 'N', 'Observações 13', 'C');


	--Inserindo Tipos Produtos 10.
--INSERT INTO TB_TIPOPRODUTO (TIPO)
--VALUES
--    ('TECNOLOGIA'),
--    ('TECNOLOGIA'),
--    ('TECNOLOGIA'),
--    ('TECNOLOGIA'),
--    ('TECNOLOGIA'),
--    ('TECNOLOGIA'),
--    ('TECNOLOGIA'),
--    ('TECNOLOGIA'),
--    ('TECNOLOGIA'),
--    ('TECNOLOGIA');



-- 10. **Inserindo 10 registros na tabela TB_PRODUTO**:
-- so da pra inserir depois de arrumar os tipo_produtos

--INSERT INTO TB_PRODUTO (COD_PRODUTO, DESCRICAO, COD_UNIDADE, COD_TIPO, PRECO_CUSTO,
--    PRECO_VENDA, QTD_ESTIMADA, QTD_REAL, QTD_MINIMA, CLAS_FISC, IPI, PESO_LIQ)
--VALUES
--    ('Prod4', 'Laptop Inspire 2023', 2, 2, 1500, 2200, 50, 40, 10, 'Eletro', 10, 2.5),
--    ('Prod5', 'Mouse TechGrip X3', 3, 3, 30, 60, 300, 250, 50, 'Acessorio', 5, 0.15),
--    ('Prod6', 'Smartphone NexGen Z1', 1, 3, 600, 1000, 180, 150, 30, 'Eletro', 9, 0.35),
--    ('Prod7', 'Teclado QuickType Pro', 2, 1, 25, 50, 200, 180, 20, 'Acessório', 3, 0.12),
--    ('Prod8', 'Monitor HD ViewMax', 3, 2, 200, 350, 120, 90, 15, 'Eletro', 7, 1.0),
--    ('Prod9', 'Headphone SoundWave', 1, 1, 100, 180, 100, 70, 10, 'Acessório', 8, 0.5),
--    ('Prod10', 'Tablet TabTech X5', 2, 3, 150, 250, 150, 120, 30, 'Eletro', 4, 0.25);


	-- Inserindo 10 Registros TB_PROD_FORN
--INSERT INTO TB_PROD_FORN(ID_PRODUTO, COD_FORNECEDOR)
--VALUES
--    (1,3),
--    (2,4),
--    (3,5),
--    (4,6),
--    (5, 7),
--    (6, 8),
--    (7, 9),
--    (8, 10),
--    (9, 11),
--    (10, 12);

	-- Inserindo Unidades
--	INSERT INTO TB_UNIDADE (UNIDADE)
--VALUES
--    ('Acre'),
--    ('Alagoas'),
--    ('Amapá'),
--    ('Amazonas'),
--    ('Bahia'),
--    ('Ceará'),
--    ('Distrito Federal'),
--    ('Espírito Santo'),
--    ('Goiás'),
--    ('Maranhão');

-- Insert 10 dados Vendedores
--INSERT INTO TB_VENDEDOR (NOME, FANTASIA, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, CIC, RG, FONE, FAX, E_MAIL, DATA_CAD, DATA_NASC, PORC_COMISSAO, SELECAO)
--VALUES
--    ('José da Silva', 'JS Vendas', 'Rua das Flores, 123', 'Centro', 'São Paulo', 'SP', '01234567', '123.456.789-00', '987654321', '(11) 1234-5678', '(11) 1234-5679', 'jose@example.com', 2023-07-16, 1990-05-15, 0.12, 'A'),
--    ('Ana Santos', 'Ana Sales', 'Avenida dos Sonhos, 456', 'Jardins', 'Rio de Janeiro', 'RJ', '23456789', '234.567.890-12', '876543210', '(21) 2345-6789', '(21) 2345-6790', 'ana@example.com', 2023-07-18, 1988-03-20, 0.15, 'B'),
--    ('Ricardo Pereira', 'Rico Distribuidora', 'Rua da Liberdade, 789', 'Centro', 'Belo Horizonte', 'MG', '34567890', '345.678.901-23', '765432109', '(31) 3456-7890', '(31) 3456-7891', 'ricardo@example.com', 2023-07-20, 1992-11-10, 0.10, 'A'),
--    ('Carla Ferreira', 'Carla Imports', 'Rua das Estrelas, 101', 'Jardim América', 'São Paulo', 'SP', '45678901', '456.789.012-34', '654321098', '(11) 4567-8901', '(11) 4567-8902', 'carla@example.com', 2023-07-22, 1985-07-08, 0.14, 'A'),
--    ('Lucas Oliveira', 'Lucas Tech', 'Avenida da Inovação, 202', 'Alphaville', 'Barueri', 'SP', '56789012', '567.890.123-45', '543210987', '(11) 5678-9012', '(11) 5678-9013', 'lucas@example.com', 2023-07-24, 1998-09-25, 0.11, 'A'),
--    ('Mariana Costa', 'MC Comércio', 'Rua das Margaridas, 303', 'Praia de Iracema', 'Fortaleza', 'CE', '67890123', '678.901.234-56', '432109876', '(85) 6789-0123', '(85) 6789-0124', 'mariana@example.com', 2023-07-26, 1996-02-12, 0.13, 'A'),
--    ('Fernando Souza', 'Fernando Solutions', 'Avenida das Tecnologias, 404', 'Alphaville', 'Barueri', 'SP', '78901234', '789.012.345-67', '321098765', '(11) 7890-1234', '(11) 7890-1235', 'fernando@example.com', 2023-07-28, 1987-10-05, 0.09, 'B'),
--    ('Larissa Martins', 'LM Comércio', 'Rua dos Sonhos, 505', 'Jardins', 'São Paulo', 'SP', '89012345', '890.123.456-78', '210987654', '(11) 8901-2345', '(11) 8901-2346', 'larissa@example.com', 2023-07-30, 1994-12-30, 0.08, 'A'),
--    ('André Silva', 'André Sales', 'Avenida das Oportunidades, 606', 'Centro', 'Curitiba', 'PR', '90123456', '901.234.567-89', '109876543', '(41) 9012-3456', '(41) 9012-3457', 'andre@example.com', 2023-08-01, 1991-08-18, 0.16, 'A'),
--    ('Paula Oliveira', 'Paula Tech', 'Rua dos Innovadores, 707', 'Alphaville', 'Barueri', 'SP', '01234567', '012.345.678-90', '234567890', '(11) 0123-4567', '(11) 0123-4568', 'paula@example.com', 2023-08-03, 1993-04-27, 0.18, 'A');




