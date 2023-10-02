/*
Laboratório 3A – Utilizando o banco de dados PEDIDOS
1. Coloque em uso o banco de dados PEDIDOS;

2. Liste clientes do estado de São Paulo (SP);
SELECT * FROM
TB_CLIENTE
WHERE ESTADO = 'SP';

3. Liste clientes dos estados de Minas Gerais e Rio de Janeiro (MG, RJ);
SELECT * FROM TB_CLIENTE
WHERE ESTADO IN ('MG', 'RJ');

4. Liste clientes dos estados de São Paulo, Minas Gerais e Rio de Janeiro (SP, MG, RJ);
SELECT * FROM TB_CLIENTE
WHERE ESTADO IN ('SP', 'MG', 'RJ');

5. Liste os vendedores com o nome LEIA;
SELECT * FROM TB_VENDEDOR
WHERE NOME = 'LEIA';

6. Liste todos os clientes que tenham NOME começando com BRINDES;
SELECT * FROM TB_VENDEDOR
WHERE NOME LIKE '%BRINDES';

7. Liste todos os clientes que tenham NOME terminando com BRINDES;
SELECT * FROM TB_VENDEDOR
WHERE NOME LIKE 'BRINDES%';

8. Liste todos os clientes que tenham NOME contendo BRINDES;
SELECT * FROM TB_VENDEDOR
WHERE NOME LIKE '%BRINDES%';

9. Liste todos os produtos com DESCRICAO começando por CANETA;
SELECT * FROM TB_PRODUTO
WHERE DESCRICAO LIKE '%CANETA';

10. Liste todos os produtos com DESCRICAO contendo SPECIAL;
SELECT * FROM TB_PRODUTO
WHERE DESCRICAO LIKE '%SPECIAL%';

11. Liste todos os produtos com DESCRICAO terminando por GOLD;
SELECT * FROM TB_PRODUTO
WHERE DESCRICAO LIKE 'GOLD%';

12. Liste todos os clientes que tenham a letra A como segundo caractere do nome;
SELECT * FROM TB_CLIENTE
WHERE NOME LIKE '%^A%'

13. Liste todos os produtos que tenham 0 (ZERO) como segundo caractere do campo COD_PRODUTO;
SELECT * FROM TB_PRODUTO
WHERE COD_PRODUTO LIKE '%^0%';

14. Liste todos os produtos que tenham a letra A como terceiro caractere do campo COD_PRODUTO.
SELECT * FROM TB_PRODUTO
WHERE COD_PRODUTO LIKE '%^^^A';



*/