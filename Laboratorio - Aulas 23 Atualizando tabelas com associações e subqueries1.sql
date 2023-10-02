/*
Laboratório 1A – Atualizando tabelas com associações e subqueries1. 

Coloque em uso o banco de dados PEDIDOS0;

2. Altere a tabela TB_CARGO, mudando o salário inicial do cargo OFFICE BOY para 600,00;
BEGIN TRAN
	UPDATE CARGO
	SET SALARIO_INIC = 600
	FROM TB_CARGO
	WHERE CARGO = 'Office Boy';

ROLLBACK TRAN

COMMIT TRAN

3. Altere a tabela de cargos, estipulando 10% de aumento para o campo SALARIO_INIC de todos os cargos;
BEGIN TRAN
	UPDATE CARGO
	SET SALARIO_INIC *= 1.10
	FROM TB_CARGO;

ROLLBACK TRAN

COMMIT TRAN

4.  Transfira  para  o  campo  SALARIO  da  tabela  TB_EMPREGADO  
o  salário  inicial  cadastrado no cargo correspondente da TB_CARGO;

BEGIN TRAN
	UPDATE TB_EMPREGADO
	SET SALARIO = CA.SALARIO_INIC
	FROM TB_EMPREGADO AS EM
	INNER JOIN TB_CARGO AS CA
	ON EM.COD_CARGO = CA.COD_CARGO

ROLLBACK TRAN

COMMIT TRAN



5. Reajuste os preços de venda de todos os produtos de modo que 
fiquem 30% acima do preço de custo (PRECO_VENDA = PRECO_CUSTO * 1.3);

BEGIN TRAN
	UPDATE PRECO_VENDA
	SET PRECO_VENDA = PRECO_CUSTO * 1.3
	FROM TB_PRODUTO
ROLLBACK TRAN

COMMIT TRAN

6.  Reajuste  os  preços  de  venda  dos  produtos  com  COD_TIPO  =  5,  de  modo  que  fiquem 20% acima do preço de custo;
BEGIN TRAN
	UPDATE PRECO_VENDA
	SET PRECO_VENDA = PRECO_CUSTO * 1.2
	FROM TB_PRODUTO
	WHERE COD_TIPO = 5
ROLLBACK TRAN

7. Reajuste os preços de venda dos produtos com descrição do tipo igual à REGUA, 
de modo que fiquem 40% acima do preço de custo. 

BEGIN TRAN
	UPDATE PRECO_VENDA
	SET PRECO_VENDA = PRECO_CUSTO * 1.4
	FROM TB_PRODUTO AS P
	INNER JOIN TB_TIPOPRODUTO AS PO
	ON P.COD_TIPO = PO.COD_TIPO
	WHERE P.DESCRICAO = 'REGUA';

ROLLBACK TRAN

COMMIT TRAN

Para isso, considere as seguintes informações:•PRECO_VENDA = PRECO_CUSTO * 1.4;
•Para produtos com TB_TIPOPRODUTO.TIPO = 'REGUA';
•É necessário fazer um JOIN de TB_PRODUTO com TB_TIPOPRODUTO.


8. Altere a tabela TB_ITENSPEDIDO de modo que todos os itens com produto indicado como VERMELHO passem a ser LARANJA. 

BEGIN TRAN
	UPDATE TB_ITENSPEDIDO
	SET CODCOR = (SELECT CODCOR FROM TB_COR WHERE COR = 'LARANJA')
	WHERE COD_PRODUTO IN (SELECT COD_PRODUTO FROM TB_PRODUTO WHERE COR = 'VERMELHO');
	
-- Verifique os resultados antes de COMMIT

-- Se tudo estiver correto, você pode COMMIT para salvar as alterações
-- COMMIT TRAN
-- Se algo estiver errado, você pode ROLLBACK para desfazer as alterações
-- ROLLBACK TRAN


Considere somente os pedidos com data de entrega em outubro de 2014;

9. Altere o campo ICMS da tabela TB_CLIENTE para 12.
Considere apenas clientes dos estados: RJ, RO, AC, RR, MG, PR, SC, RS, MS e MT;

BEGIN TRAN
	UPDATE TB_CLIENTE
	SET ICM = 12
	FROM TB_CLIENTE
	WHERE ESTADO IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 'RS', 'MS', 'MT')

COMMI TRAN

ROLLBACK TRAN

189 Manipulando dados com junções Aula 23

10. Altere o campo ICMS para 18, apenas para clientes de SP;

BEGIN TRAN
	UPDATE TB_CLIENTE
	SET ICM = 18
	FROM TB_CLIENTE
	WHERE ESTADO = 'SP';

COMMIT TRAN

ROLLBACK TRAN

11.  Altere  o  campo  ICMS  da  tabela  TB_CLIENTE para  7.  
Considere  apenas  clientes  que não sejam dos estados: RJ, RO, AC, RR, MG, PR, SC, RS, MS, MT e SP;

BEGIN TRAN
	UPDATE TB_CLIENTE
	SET ICM = 7
	FROM TB_CLIENTE
	WHERE ESTADO NOT IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 'RS', 'MS', 'MT','SP')

COMMI TRAN

ROLLBACK TRAN



12. Crie a tabela ESTADOS com os respectivos campos:•COD_ESTADO: Inteiro, autonumeração e chave primária;
•SIGLA: Char(2);•ICMS: Numérico, tamanho 4 com 2 decimais.

CREATE TABLE estados
(
    COD_ESTADO INT PRIMARY KEY AUTO_INCREMENT,
    SIGLA CHAR(2),
    ICMS NUMERIC(4, 2)
);



13. Copie os dados coletados do seguinte comando SELECT para a tabela ESTADOS utilizando um comando 
INSERT:SELECT DISTINCT ESTADO, ICMS FROM TB_CLIENTE WHERE ESTADO IS NOT NULLO 
SELECT deve retornar 21 linhas e não repetir o Estado. 
Se o resultado for diferente, é porque os UPDATES de ICMS estão incorretos.

INSERT INTO ESTADOS (SIGLA, ICMS)
SELECT DISTINCT ESTADO, ICMS 
FROM TB_CLIENTE 
WHERE ESTADO IS NOT NULL;


14. Crie o campo COD_ESTADO na tabela TB_CLIENTE;

ALTER TABLE TB_CLIENTE
ADD COD_ESTADO INT,
ADD CONSTRAINT FK_TB_CLIENTE_TB_ESTADOS FOREIGN KEY (COD_ESTADO) REFERENCES TB_ESTADOS(COD_ESTADO);





15.  Copie  para  TB_CLIENTE.COD_ESTADO  o  código  do  Estado  gerado  na  tabela  ESTADOS.
UPDATE C
SET C.COD_ESTADO = E.COD_ESTADO
FROM TB_CLIENTE AS C
INNER JOIN TB_ESTADOS AS E
ON C.ESTADO = E.ESTADO;


*/