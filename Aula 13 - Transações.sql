/*
Trata-se de um processo que tem inicio e fim

É uma forma segura de realizar operações

2 Tipos
Implicita - É do proprio SGBD. Qualquer erro que ocorra, a aplicação aborta a operação.
Exemplo- Apagar um banco em USO, o proprio SQL irá avisar.

Explicita - Quando o usuário define o inicio e o termino de uma operação.



Mais utilizado em UPDATE e DELETE, pois essas ações não são possíveis desfazer.

DTL - Data Transaction Language

BEGIN TRANSACTION ou BEGIN TRAN - Inicio

COMMIT TRANSACATION ou COMMIT TRAN ou COMMIT - Define o fim e confirma as operações

ROLLBACK TRANSACTION ou ROLLBACK TRAN ou ROLLBACK - Define o fim e cancela todas as operações

*/

-- SEMPRE UTILIZAR TRANSCT NOS UPDATES OU DELETE

 Use Consorcio
SELECT * FROM Apolices
-- Explicita
-- Alterar o valor de apolices
UPDATE Apolices
SET valorApolice = valorApolice + 1500;

-- Iniciando a transação
BEGIN TRANSACTION


-- Cancelar uma operação, após o UPDATE
ROLLBACK TRANSACTION

-- verificar se há transação ativa
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
-- para sabermos se o transaction está correto
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
	
-- se não
ROLLBACK TRAN

-- se estiver correto
COMMIT