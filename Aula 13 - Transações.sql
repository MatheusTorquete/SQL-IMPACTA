/*
Trata-se de um processo que tem inicio e fim

� uma forma segura de realizar opera��es

2 Tipos
Implicita - � do proprio SGBD. Qualquer erro que ocorra, a aplica��o aborta a opera��o.
Exemplo- Apagar um banco em USO, o proprio SQL ir� avisar.

Explicita - Quando o usu�rio define o inicio e o termino de uma opera��o.



Mais utilizado em UPDATE e DELETE, pois essas a��es n�o s�o poss�veis desfazer.

DTL - Data Transaction Language

BEGIN TRANSACTION ou BEGIN TRAN - Inicio

COMMIT TRANSACATION ou COMMIT TRAN ou COMMIT - Define o fim e confirma as opera��es

ROLLBACK TRANSACTION ou ROLLBACK TRAN ou ROLLBACK - Define o fim e cancela todas as opera��es

*/

-- SEMPRE UTILIZAR TRANSCT NOS UPDATES OU DELETE

 Use Consorcio
SELECT * FROM Apolices
-- Explicita
-- Alterar o valor de apolices
UPDATE Apolices
SET valorApolice = valorApolice + 1500;

-- Iniciando a transa��o
BEGIN TRANSACTION


-- Cancelar uma opera��o, ap�s o UPDATE
ROLLBACK TRANSACTION

-- verificar se h� transa��o ativa
SELECT @@TRANCOUNT;

-- 2 Maneira
-- PASSO 1
BEGIN TRAN -- incia a trans antes do update
	UPDATE Apolices
	SET valorApolice = valorApolice + 1500
	WHERE nContrato = 1000;

-- Para voltar o update
ROLLBACK TRAN

-- Para confirmar o update
COMMIT TRAN

-- Tabelas do sistemas para virmos antes do UPDATE,DELETE ou INSERT.
-- Inserted
-- Deleted
-- UPDATE - Inserted(novo valor) Deleted (valor antigo)
-- Assim que dermos o Rollback ou Commit as tabelas deleted e insert eliminaram os dados

-- verificando as tabelas output que foi realizada
-- para sabermos se o transaction est� correto
Use SisDep
BEGIN TRAN
	UPDATE Funcionario
	SET salario = Salario * 1.1
	OUTPUT
		deleted.idMatricula,
		deleted.NomeFuncionario,
		deleted.Salario AS [Salario Anterior],
		inserted.Salario AS [Novo Salario]
	WHERE Salario <= 3000
	
-- se n�o
ROLLBACK TRAN

-- se estiver correto
COMMIT