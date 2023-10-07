
### Título: Laboratórios de SQL Server

### Projetos práticos da Formação SQL-Server.

---

### Banco de Dados

1. **Criando um Banco de Dados:**
   ```sql
   CREATE DATABASE PEDIDOS_VENDA
   ```

2. **Selecionando um Banco de Dados:**
   ```sql
   USE PEDIDOS_VENDA;
   ```

---

### Tabelas

1. **Criando Tabela TB_PRODUTO:**
   ```sql
   CREATE TABLE TB_PRODUTO (
       CodigoProduto INT PRIMARY KEY IDENTITY(1,1),
       NomeProduto VARCHAR(100),
       ...
   );
   ```

2. **Inserindo Dados na Tabela TB_PRODUTO:**
   ```sql
   INSERT INTO TB_PRODUTO (NomeProduto, CodigoUnidadeMedida, CodigoCategoria, QuantidadeEstoque, QuantidadeMinima, PrecoCusto, PrecoVenda)
   VALUES ('Caneta Azul', 1, 1, 150, 40, 0.50, 0.75),
          ('Caneta Verde', 1, 1, 150, 40, 0.50, 0.75),
          ...
   );
   ```

---

### Chaves Estrangeiras

1. **Adicionando Chaves Estrangeiras na Tabela TB_PEDIDO:**
   ```sql
   ALTER TABLE tb_Pedido
   ADD FOREIGN KEY (CODCLI) REFERENCES tb_Cliente(CODCLI);

   ALTER TABLE tb_Pedido
   ADD FOREIGN KEY (CODVEN) REFERENCES tb_Vendedor(CODVEN);
   ```

2. **Adicionando Chaves Estrangeiras na Tabela TB_PRODUTO:**
   ```sql
   ALTER TABLE TB_PRODUTO
   ADD FOREIGN KEY (COD_TIPO) REFERENCES TB_TIPOPRODUTO(COD_TIPO);

   ALTER TABLE TB_PRODUTO
   ADD FOREIGN KEY (COD_UNIDADE) REFERENCES TB_UNIDADE(COD_UNIDADE);
   ```

---

### Constraints

1. **Criando Constraints na Tabela TB_PRODUTO:**
   ```sql
   ALTER TABLE TB_PRODUTO
   ADD CONSTRAINT CHK_PRECO CHECK (PRECO_VENDA >= PRECO_CUSTO AND PRECO_CUSTO > 0 AND QTD_REAL >= 0);
   ```

2. **Criando Constraints na Tabela TB_ITENSPEDIDO:**
   ```sql
   ALTER TABLE TB_ITENSPEDIDO
   ADD CONSTRAINT CHK_QTD CHECK (QUANTIDADE >= 1);
   ```

---

### Transações

1. **Atualizando Dados na Tabela TB_PRODUTO com Transações:**
   ```sql
   BEGIN TRANSACTION;

   UPDATE TB_PRODUTO
   SET PrecoCusto = PrecoCusto * 1.15
   WHERE CodigoTipo = 2;

   -- Se estiver OK, COMMIT, senão ROLLBACK
   COMMIT;
   ```

2. **Excluindo Dados na Tabela COPIA_PEDIDOS com Transações:**
   ```sql
   BEGIN TRANSACTION;

   DELETE FROM COPIA_PEDIDOS
   WHERE COD_VENDEDOR = 2;

   -- Se estiver OK, COMMIT, senão ROLLBACK
   COMMIT;
   ```


### **Laboratório 1**

#### 1. **Utilizando o banco de dados PEDIDOS:**
   ```sql
   USE PEDIDOS;
   ```

#### 2. **Listando a tabela TB_PRODUTO:**
   ```sql
   SELECT COD_PRODUTO, DESCRICAO, PRECO_CUSTO, PRECO_VENDA, (PRECO_VENDA - PRECO_CUSTO) AS LUCRO_UNITARIO
   FROM TB_PRODUTO;
   ```

#### 3. **Calculando o valor total investido no estoque:**
   ```sql
   SELECT COD_PRODUTO, DESCRICAO, (QTD_REAL * PRECO_CUSTO) AS Valor_Investido
   FROM TB_PRODUTO;
   ```

#### 4. **Calculando o valor de cada item na tabela TB_ITENSPEDIDO:**
   ```sql
   SELECT NUM_PEDIDO, NUM_ITEM, COD_PRODUTO, PR_UNITARIO, QUANTIDADE, DESCONTO,
       (PR_UNITARIO * QUANTIDADE * (1 - DESCONTO/100)) AS Valor_Item
   FROM TB_ITENSPEDIDO;
   ```

#### 5. **Calculando o lucro estimado em reais:**
   ```sql
   SELECT COD_PRODUTO, DESCRICAO, PRECO_CUSTO, PRECO_VENDA, (QTD_REAL * (PRECO_VENDA - PRECO_CUSTO)) AS Lucro_Reais
   FROM TB_PRODUTO;
   ```

#### 6. **Calculando o lucro unitário em reais e percentual:**
   ```sql
   SELECT COD_PRODUTO, DESCRICAO, PRECO_CUSTO, PRECO_VENDA,
       (PRECO_VENDA - PRECO_CUSTO) AS Lucro_Unitario,
       CASE
           WHEN PRECO_CUSTO <> 0 THEN ((100 * (PRECO_VENDA - PRECO_CUSTO) / PRECO_CUSTO))
           ELSE 0
       END AS Lucro_Percentual
   FROM TB_PRODUTO;
   ```

#### Observação:
Note que há uma cláusula `CASE` para garantir que não ocorra divisão por zero, o que provocaria erro ao executar o comando.

---

### **Laboratório 2A**

#### 1. **Filtrando produtos com quantidade real abaixo da quantidade mínima:**
   ```sql
   SELECT ID_PRODUTO, DESCRICAO, COD_UNIDADE, COD_TIPO, PRECO_CUSTO, PRECO_VENDA, QTD_ESTIMADA, (QTD_REAL - QTD_MINIMA) AS DIFERENCA
   FROM TB_PRODUTO
   WHERE QTD_REAL < QTD_MINIMA;
   ```

#### 2. **Produtos com quantidade real acima de 5000 unidades:**
   ```sql
   SELECT * FROM TB_PRODUTO
   WHERE QTD_REAL > 5000;
   ```

#### 3. **Produtos com preço de venda inferior a R$0,50:**
   ```sql
   SELECT * FROM TB_PRODUTO
   WHERE PRECO_VENDA < 0.50;
   ```

#### 4. **Pedidos com valor total acima de R$15.000,00:**
   ```sql
   SELECT * FROM TB_PEDIDO
   WHERE VLR_TOTAL > 150000;
   ```

#### 5. **Produtos com quantidade real entre 500 e 1000 unidades:**
   ```sql
   SELECT * FROM TB_PRODUTO
   WHERE QTD_REAL BETWEEN 500 AND 1000;
   ```

#### 6. **Pedidos com valor total entre R$15.000,00 e R$25.000,00:**
   ```sql
   SELECT * FROM PEDIDO
   WHERE VLR_TOTAL BETWEEN 150000 AND 250000;
   ```

#### 7. **Produtos com quantidade real acima de 5000 e código do tipo igual a 6:**
   ```sql
   SELECT * FROM TB_PRODUTO
   WHERE QTD_REAL > 5000 AND COD_TIPO = 6;
   ```

#### 8. **Produtos com quantidade real acima de 5000 ou código do tipo igual a 6:**
   ```sql
   SELECT * FROM TB_PRODUTO
   WHERE QTD_REAL > 5000 OR COD_TIPO = 6;
   ```

#### 9. **Pedidos com valor total inferior a R$100,00 ou acima de R$100.000,00:**
   ```sql
   SELECT * FROM TB_PEDIDO
   WHERE VLR_TOTAL < 100 OR VLR_TOTAL > 100000;
   ```

#### 10. **Produtos com QTD_REAL menor que 500 ou maior que 1000:**
   ```sql
   SELECT * FROM TB_PRODUTO
   WHERE QTD_REAL < 500 OR QTD_REAL > 1000;
   ```

### **Laboratório 3A**
1. **Liste os campos NUM_PEDIDO, DATA_EMISSAO e VLR_TOTAL de PEDIDOS, seguidos de NOME do vendedor:**

   ```sql
   SELECT
       P.NUM_PEDIDO AS [Numero Pedido],
       P.DATA_EMISSAO AS [Data Emissao],
       P.VLR_TOTAL AS [Valor Total],
       V.NOME AS [Nome Vendedor]
   FROM TB_PEDIDO AS P
   INNER JOIN TB_VENDEDOR AS V
       ON P.CODVEN = V.CODVEN;
   ```

2. **Liste os campos NUM_PEDIDO, DATA_EMISSAO e VLR_TOTAL de PEDIDOS, seguidos de NOME do cliente:**

   ```sql
   SELECT
       P.NUM_PEDIDO AS [Numero Pedido],
       P.DATA_EMISSAO AS [Data Emissao],
       P.VLR_TOTAL AS [Valor Total],
       C.NOME AS [Nome Cliente]
   FROM TB_PEDIDO AS P
   INNER JOIN TB_CLIENTE AS C
   ON P.CODCLI = C.CODCLI;
   ```

3. **Liste os pedidos com o nome do vendedor e o nome do cliente:**

   ```sql
   SELECT
       P.NUM_PEDIDO AS [Numero Pedido],
       V.NOME AS [Nome Vendedor],
       C.NOME AS [Nome Cliente]
   FROM TB_PEDIDO AS P
   INNER JOIN TB_VENDEDOR AS V
       ON P.CODVEN = V.CODVEN
   INNER JOIN TB_CLIENTE AS C
       ON P.CODCLI = C.CODCLI;
   ```

4. **Liste os itens de pedido (TB_ITENSPEDIDO) com o nome do produto (TB_PRODUTO.DESCRICAO):**

   ```sql
   SELECT
       I.NUM_PEDIDO AS [Numero Pedido],
       I.NUM_ITEM AS [Numero Item],
       I.COD_PRODUTO AS [Código Produto],
       P.DESCRICAO AS [Descricao Produto],
       P.PRECO_VENDA AS [Preco Produto]
   FROM TB_ITENSPEDIDO AS I
   INNER JOIN TB_PRODUTO AS P
       ON I.ID_PRODUTO = P.ID_PRODUTO;
   ```

5. **Liste os campos COD_PRODUTO e DESCRICAO da tabela TB_PRODUTO, seguidos da descrição do tipo de produto (TB_TIPOPRODUTO.TIPO):**

   ```sql
   SELECT
       P.COD_PRODUTO AS [Código do Produto],
       P.DESCRICAO AS [Descrição Produto],
       TP.COD_TIPO AS [Código do Tipo de Produto],
       TP.TIPO AS [Tipo Produto]
   FROM TB_PRODUTO AS P
   INNER JOIN TB_TIPOPRODUTO AS TP
       ON P.COD_TIPO = TP.COD_TIPO;
   ```

6. **Liste os campos COD_PRODUTO e DESCRICAO da tabela TB_PRODUTO, seguidos da descrição do tipo de produto (TB_TIPOPRODUTO.TIPO) e do nome da unidade de medida (TB_UNIDADE.UNIDADE):**

   ```sql
   SELECT
       P.COD_PRODUTO AS [Código Produto],
       P.DESCRICAO AS [Descrição Produto],
       TP.TIPO AS [Tipo do Produto],
       U.UNIDADE AS [Nome Unidade]
   FROM TB_PRODUTO AS P 
   INNER JOIN TB_TIPOPRODUTO AS TP
       ON P.COD_TIPO = TP.COD_TIPO
   INNER JOIN TB_UNIDADE AS U
       ON P.COD_UNIDADE = U.COD_UNIDADE;
   ```

7. **Liste os campos NUM_PEDIDO, NUM_ITEM, COD_PRODUTO, QUANTIDADE e PR_UNITARIO da tabela TB_ITENSPEDIDO, e os campos COD_PRODUTO e DESCRICAO da tabela TB_PRODUTO, seguidos da descrição do tipo de produto (TB_TIPOPRODUTO.TIPO) e do nome da unidade de medida (TB_UNIDADE.UNIDADE):**

   ```sql
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
   ```

8. **Liste os campos NUM_PEDIDO, NUM_ITEM, COD_PRODUTO, QUANTIDADE e PR_UNITARIO da tabela TB_ITENSPEDIDO, e os campos COD_PRODUTO e DESCRICAO da tabela TB_PRODUTO, seguidos da descrição do tipo de produto (TB_TIPOPRODUTO.TIPO), do nome da unidade de medida (TB_UNIDADE.UNIDADE) e do nome da cor (TB_COR.COR):**

   ```sql
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
   ```

9. **Liste todos os pedidos (TB_PEDIDO) do vendedor MARCELO em Jan/2014:**

   ```sql
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
   ````

10. **Liste os nomes dos clientes (TB_CLIENTE.NOME) que efetuaram compras em janeiro de 2014:**

   ```sql
   SELECT
       C.NOME AS [Nome Cliente]
   FROM TB_CLIENTE AS C
   INNER JOIN TB_PEDIDO AS P
       ON C.CODCLI = P.CODCLI
   WHERE
       YEAR(P.DATA_EMISSAO) = 2014
       AND MONTH(P.DATA_EMISSAO) = 1;
   ```

11. **Liste os nomes de produtos (TB_PRODUTO.DESCRICAO) que foram vendidos em janeiro de 2014:**

   ```sql
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
   ```

12. **Liste NUM_PEDIDO, VLR_TOTAL (PEDIDOS) e NOME (TB_CLIENTE). Mostre apenas pedidos de janeiro de 2014 e clientes que tenham NOME iniciado com MARCIO:**

   ```sql
   SELECT
       P.NUM_PEDIDO AS [Numero Pedido],
       P.VLR_TOTAL AS [Valor Pedido],
       C.NOME AS [Nome Cliente]
   FROM TB_PEDIDO AS P
   INNER JOIN TB_CLIENTE AS C
       ON P.CODCLI = C.CODCLI
   WHERE C.NOME LIKE 'MARCIO%'
       AND YEAR(P.DATA_EMISSAO) = 2014 
       AND MONTH(P.DATA_EMISSAO) = 1;
   ```

13. **Liste NUM_PEDIDO, QUANTIDADE vendida e PR_UNITARIO (TB_ITENSPEDIDO), DESCRICAO do produto, NOME do vendedor que vendeu cada item de pedido (TB_VENDEDOR):**

   ```sql
   SELECT
       IP.NUM_PEDIDO AS [Numero Pedido],
       IP.QUANTIDADE AS [Quantidade Vendida],
       IP.PR_UNITARIO AS [Produto Unitario],
       PR.DESCRICAO AS [Descricao Produto],
       V.NOME AS [Nome Vendedor]
   FROM TB_ITENSPEDIDO AS IP
   INNER JOIN TB_PRODUTO AS PR
       ON IP.ID_PRODUTO = PR.COD_PRODUTO
   INNER JOIN TB_PEDIDO AS P
       ON IP.NUM_PEDIDO = P.NUM_PEDIDO
   INNER JOIN TB_VENDEDOR AS V
       ON P.CODVEN = V.CODVEN;
   ```

14. **Liste todos os itens de pedido com desconto superior a 7%. Mostre NUM_PEDIDO, DESCRICAO do produto, NOME do cliente, NOME do vendedor e QUANTIDADE vendida:**

   ```sql
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
   ```

15. **Liste os itens de pedido com o nome do produto, a descrição do tipo, a descrição da unidade e o nome da cor, mas apenas os itens vendidos em janeiro de 2014 na cor LARANJA:**

   ```sql
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
   AND MONTH(IP.DATA_ENTREGA) = 1;
   ```

16. **Liste NOME e FONE1 dos fornecedores que venderam o produto CANETA STAR I:**

   ```sql
   SELECT
       F.NOME AS [Nome Fornecedor],
       F.FONE1 AS [Fone Fornecedor]
   FROM TB_FORNECEDOR AS F
   INNER JOIN TB_PROD_FORN AS PF
       ON F.COD_FORNECEDOR = PF.COD_FORNECEDOR
   INNER JOIN TB_PRODUTO AS P
       ON PF.ID_PRODUTO = P.ID_PRODUTO
   WHERE P.DESCRICAO = 'CANETA STAR I';
   ```

17. **Liste a DESCRICAO dos produtos comprados do fornecedor cujo NOME começa com LINCE:**

   ```sql
   SELECT
       P.DESCRICAO
   FROM TB_PRODUTO AS P
   INNER JOIN TB_PROD_FORN AS PF
       ON P.ID_PRODUTO = PF.ID_PRODUTO
   INNER JOIN TB_FORNECEDOR AS F
       ON PF.COD_FORNECEDOR = F.COD_FORNECEDOR
   WHERE F.NOME LIKE 'LINCE%';
   ```

18. **Liste NOME e FONE1 dos fornecedores, bem como DESCRICAO dos produtos com QTD_REAL abaixo de QTD_MINIMA:**

   ```sql
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
   ```

19. **Liste todos os produtos comprados do

 fornecedor cujo nome inicia-se com FESTO:**

   ```sql
   SELECT
       P.DESCRICAO AS [Descrição do Produto],
       F.NOME AS [Nome do Fornecedor]
   FROM TB_PRODUTO AS P
   INNER JOIN TB_PROD_FORN AS PF
       ON P.COD_PRODUTO = PF.ID_PRODUTO
   INNER JOIN TB_FORNECEDOR AS F
       ON PF.COD_FORNECEDOR = F.COD_FORNECEDOR
   WHERE F.NOME LIKE 'FESTO%';
   ```

### **Laboratório 3A**

1. **Coloque em uso o banco de dados PEDIDOS:**

2. **Altere a tabela TB_CARGO, mudando o salário inicial do cargo OFFICE BOY para 600,00:**

   ```sql
   UPDATE TB_CARGO
   SET SALARIO_INIC = 600
   WHERE CARGO = 'OFFICE BOY';
   ```

3. **Altere a tabela de cargos, estipulando 10% de aumento para o campo SALARIO_INIC de todos os cargos:**

   ```sql
   UPDATE TB_CARGO
   SET SALARIO_INIC = SALARIO_INIC * 1.10;
   ```

4. **Transfira para o campo SALARIO da tabela TB_EMPREGADO o salário inicial cadastrado no cargo correspondente da TB_CARGO:**

   ```sql
   UPDATE TB_EMPREGADO
   SET SALARIO = CA.SALARIO_INIC
   FROM TB_EMPREGADO AS EM
   INNER JOIN TB_CARGO AS CA
   ON EM.COD_CARGO = CA.COD_CARGO;
   ```

5. **Reajuste os preços de venda de todos os produtos de modo que fiquem 30% acima do preço de custo (PRECO_VENDA = PRECO_CUSTO * 1.3):**

   ```sql
   UPDATE TB_PRODUTO
   SET PRECO_VENDA = PRECO_CUSTO * 1.3;
   ```

6. **Reajuste os preços de venda dos produtos com COD_TIPO = 5, de modo que fiquem 20% acima do preço de custo:**

   ```sql
   UPDATE TB_PRODUTO
   SET PRECO_VENDA = PRECO_CUSTO * 1.2
   WHERE COD_TIPO = 5;
   ```

7. **Reajuste os preços de venda dos produtos com descrição do tipo igual à REGUA, de modo que fiquem 40% acima do preço de custo:**

   ```sql
   UPDATE TB_PRODUTO
   SET PRECO_VENDA = PRECO_CUSTO * 1.4
   FROM TB_PRODUTO AS P
   INNER JOIN TB_TIPOPRODUTO AS PO
   ON P.COD_TIPO = PO.COD_TIPO
   WHERE PO.TIPO = 'REGUA';
   ```

8. **Altere a tabela TB_ITENSPEDIDO de modo que todos os itens com produto indicado como VERMELHO passem a ser LARANJA:**

   ```sql
   UPDATE TB_ITENSPEDIDO
   SET CODCOR = (SELECT CODCOR FROM TB_COR WHERE COR = 'LARANJA')
   WHERE COD_PRODUTO IN (SELECT COD_PRODUTO FROM TB_PRODUTO WHERE COR = 'VERMELHO')
   AND MONTH(DATA_ENTREGA) = 10 AND YEAR(DATA_ENTREGA) = 2014;
   ```

9. **Altere o campo ICMS da tabela TB_CLIENTE para 12, considerando apenas clientes dos estados: RJ, RO, AC, RR, MG, PR, SC, RS, MS e MT:**

   ```sql
   UPDATE TB_CLIENTE
   SET ICMS = 12
   WHERE ESTADO IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 'RS', 'MS', 'MT');
   ```

10. **Altere o campo ICMS para 18, apenas para clientes de SP:**

   ```sql
   UPDATE TB_CLIENTE
   SET ICMS = 18
   WHERE ESTADO = 'SP';
   ```

11. **Altere o campo ICMS da tabela TB_CLIENTE para 7, considerando apenas clientes que não sejam dos estados: RJ, RO, AC, RR, MG, PR, SC, RS, MS, MT e SP:**

    ```sql
    UPDATE TB_CLIENTE
    SET ICMS = 7
    WHERE ESTADO NOT IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 'RS', 'MS', 'MT', 'SP');
    ```

12. **Crie a tabela ESTADOS com os respectivos campos:**

    ```sql
    CREATE TABLE ESTADOS (
        COD_ESTADO INT PRIMARY KEY IDENTITY(1,1),
        SIGLA CHAR(2),
        ICMS NUMERIC(4,2)
    );
    ```

13. **Copie os dados coletados do seguinte comando SELECT para a tabela ESTADOS utilizando um comando INSERT:**

    ```sql
    INSERT INTO ESTADOS (SIGLA, ICMS)
    SELECT DISTINCT ESTADO, ICMS 
    FROM TB_CLIENTE 
    WHERE ESTADO IS NOT NULL;
    ```

14. **Crie o campo COD_ESTADO na tabela TB_CLIENTE:**

    ```sql
    ALTER TABLE TB_CLIENTE
    ADD COD_ESTADO INT;
    ```

15. **Copie para TB_CLIENTE.COD_ESTADO o código do Estado gerado na tabela ESTADOS:**

    ```sql
    UPDATE C
    SET C.COD_ESTADO = E.COD_ESTADO
    FROM TB_CLIENTE AS C
    INNER JOIN ESTADOS AS E
    ON C.ESTADO = E.SIGLA;
    ```


### **Parte Final do Laboratório**

1. **Listagem de Empregados:**
   
   ```sql
   SELECT 
       NOME,
       SALARIO,
       DATA_ADMISSAO,
       FORMAT(DATA_ADMISSAO, 'MM') AS Mes_Admissao
   FROM TB_EMPREGADO;
   ```
2. **Endereço do Cliente:**

   ```sql
   SELECT
       NOME,
       CONCAT(ENDERECO, ', ', NUMERO, ' - ', BAIRRO, ' - ', CIDADE, '/', ESTADO) AS ENDERECO_COMPLETO
   FROM TB_CLIENTE;
   ```

3. **Nome e Aniversário de Empregados:**

   ```sql
   SELECT 
       SUBSTRING(NOME, 1, CHARINDEX(' ', NOME)) AS PRIMEIRO_NOME,
       FORMAT(DATA_NASCIMENTO, 'dd/MM') AS ANIVERSARIO
   FROM TB_EMPREGADO;
   ```

### **Laboratório 1B: Realizando consultas e ordenando dados**

1. **Registros Iguais entre TB_PRODUTO e TBPROD:**

   ```sql
   SELECT * FROM TB_PROD
   INTERSECT
   SELECT * FROM TB_PRODUTO;
   ```
2. **Registros Apenas em TB_PRODUTO:**

   ```sql
   SELECT * FROM TB_PRODUTO
   EXCEPT
   SELECT * FROM TB_PROD;
   ```

### **Laboratório 2A: Utilizando novamente o banco de dados PEDIDOS**

1. **Pedidos com Data de Emissão Anterior a Janeiro de 2014:**

   ```sql
   SELECT * FROM TB_PEDIDO WHERE DATA_EMISSAO < '2014-01-01'; 
   ```
2. **Pedidos com Data de Emissão no Primeiro Semestre de 2014:**

   ```sql
   SELECT * FROM TB_PEDIDO WHERE YEAR(DATA_EMISSAO) = 2014 AND MONTH(DATA_EMISSAO) <= 6;
   ```

3. **Pedidos com Data de Emissão em Janeiro e Junho de 2014:**

   ```sql
   SELECT * FROM TB_PEDIDO 
   WHERE (YEAR(DATA_EMISSAO) = 2014 AND MONTH(DATA_EMISSAO) = 1)
   OR (YEAR(DATA_EMISSAO) = 2014 AND MONTH(DATA_EMISSAO) = 6);
   ```
4. **Pedidos do Vendedor Código 1 em Janeiro de 2014:**

   ```sql
   SELECT * FROM TB_PEDIDO 
   WHERE YEAR(DATA_EMISSAO) = 2014 
   AND MONTH(DATA_EMISSAO) = 1 
   AND CODVEN = 1;
   ```

5. **Pedidos Emitidos em Janeiro de 2014 em uma Sexta-feira:**

   ```sql
   SELECT * FROM TB_PEDIDO 
   WHERE YEAR(DATA_EMISSAO) = 2014 
   AND MONTH(DATA_EMISSAO) = 1 
   AND DATEPART(WEEKDAY, DATA_EMISSAO) = 6;
   ```

