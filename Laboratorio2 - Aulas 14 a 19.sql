/* Aulas 4 a 19 Laboratório 2A – 
Utilizando o banco de dados PEDIDOS e listando suas tabelas com base em novos critérios1.

Coloque em uso o banco de dados PEDIDOS;


2. Liste tabela TB_PRODUTO, criando campo calculado (QTD_REAL - QTD_MINIMA), e filtre os registros resultantes, 
mostrando somente aqueles que tiverem a quantidade real abaixo da quantidade mínima;
Neste caso, o exercício não cita as colunas que devem ser exibidas. 
Sendo assim, basta  utilizar  o  símbolo  asterisco  (*)  ou,  então,  colocar  as  colunas  que  julgar  importantes.

SELECT ID_PRODUTO, DESCRICAO, COD_UNIDADE, COD_TIPO, PRECO_CUSTO, PRECO_VENDA, QTD_ESTIMADA, (QTD_REAL - QTD_MINIMA) AS DIFERENCA
FROM TB_PRODUTO
WHERE QTD_REAL < QTD_MINIMA;

3. Liste a tabela TB_PRODUTO, mostrando os registros que tenham quantidade real acima de 5000;
SELECT * FROM TB_PRODUTO
WHERE QTD_REAL > 5000;

4. Liste produtos com preço de venda inferior a R$0,50;
SELECT * FROM TB_PRODUTO
WHERE PRECO_VENDA < 0.50;

5. Liste a tabela TB_PEDIDO com valor total (VLR_TOTAL) acima de R$15.000,00;
SELECT * FROM TB_PEDIDO
WHERE VLR_TOTAL > 150000;

6. Liste produtos com QTD_REAL entre 500 e 1000 unidades;
SELECT * FROM TB_PRODUTO
WHERE QTD_REAL BETWEEN 500 AND 1000;

7. Liste pedidos com valor total entre R$15.000,00 e R$25.000,00;
SELECT * FROM PEDIDO
WHERE VLR_TOTAL BETWEEN 150000 AND 250000;

8. Liste produtos com quantidade real acima de 5000 e código do tipo igual a 6; 
SELECT * FROM TB_PRODUTO
WHERE QTD_REAL > 5000 AND COD_TIPO = 6;

9. Liste produtos com quantidade real acima de 5000 ou código do tipo igual a 6; 
SELECT * FROM TB_PRODUTO
WHERE QTD_REAL > 5000 OR COD_TIPO = 6;


10. Liste pedidos com valor total inferior a R$100,00 ou acima de R$100.000,00;
SELECT * FROM TB_PEDIDO
WHERE VLR_TOTAL < 100 OR VLR_TOTAL > 100000;




11. Liste produtos com QTD_REAL menor que 500 ou maior que 1000.
SELECT * FROM TB_PRODUTO
WHERE QTD_REAL < 500 OR QTD_REAL > 1000;



*/