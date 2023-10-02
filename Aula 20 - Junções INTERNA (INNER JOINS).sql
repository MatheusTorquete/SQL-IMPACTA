/*
Junção de tabelas por meio das relaçoes por PK e FK.

INNER JOIN

SELECT colunas FROM tabela1
[INNER JOIN] tabela2
ON tabela1.coluna = tabela2.coluna
*/

-- Trazendo informação da tabela Funcionario unindo com a tabela Localidade
-- Nome, Salario, admissão e qual a localidade dele
SELECT f.NomeFuncionario, f.Salario, f.Admissao, l.Cidade, l.Uf
FROM Funcionario as F
INNER JOIN Localidade as L
ON f.idLocalidade = L.idLocalidade
ORDER BY f.Salario DESC;



-- Unindo 3 tabelas, trazendo o departamento do funcionario também

SELECT
f.NomeFuncionario, d.NomeDepartamento, f.Admissao,f.Salario, l.Cidade
FROM Funcionario AS f
INNER JOIN Localidade AS l
ON f.idLocalidade = l.idLocalidade
INNER JOIN Depto as D
ON f.idDepartamento = d.idDepartamento



/*  Join com 6 tabelas. Vai exibir:      
TB_ITENSPEDIDO.NUM_PEDIDO      
TB_ITENSPEDIDO.NUM_ITEM
TB_ITENSPEDIDO.COD_PRODUTO      
TB_PRODUTO.DESCRICAO    
TB_ITENSPEDIDO.QUANTIDADE      
TB_ITENSPEDIDO.PR_UNITARIO      
TB_TIPOPRODUTO.TIPO      
TB_UNIDADE.UNIDADE      
TB_COR.COR      
TB_PEDIDO.DATA_EMISSAO      

Filtrando TB_PEDIDO emitidos em Janeiro de 2014*/
SELECT   I.NUM_PEDIDO,
		I.NUM_ITEM, 
		I.COD_PRODUTO, 
		PR.DESCRICAO,   
		I.QUANTIDADE, 
		I.PR_UNITARIO, 
		T.TIPO, U.UNIDADE, 
		CR.COR,  
		PE.DATA_EMISSAO 
FROM TB_ITENSPEDIDO I   
JOIN TB_PRODUTO PR   
ON I.ID_PRODUTO   = PR.ID_PRODUTO   JOIN TB_COR CR     
ON I.CODCOR       = CR.CODCOR   JOIN TB_TIPOPRODUTO T 
ON PR.COD_TIPO    = T.COD_TIPO   JOIN TB_UNIDADE U    
ON PR.COD_UNIDADE = U.COD_UNIDADE   JOIN TB_PEDIDO PE    
ON I.NUM_PEDIDO   = PE.NUM_PEDIDO     
WHERE PE.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31';
