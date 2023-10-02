/*
FULL JOIN - traz todos os registros dos lados direitos e esquerdos.

SELECT colunas
FROM tabela1
FULL JOIN tabela2
ON tabela1.coluna = tabela2.coluna

*/

-- Todos os dados União de funcionário e dependente, nome, admissão e nascimento

SELECT
	f.NomeFuncionario,
	f.Admissao,
	d.NomeDependente,
	d.NascimentoDependente
FROM Funcionario AS F
FULL JOIN Dependente AS D
ON F.idMatricula = D.idMatricula
ORDER BY f.NomeFuncionario;


/*
CROSS JOIN
Cruzamento dos dados
Não há necessidade de colocar a clausula ON.
*/

-- Cruzando dados dos departamentos e projetos
-- Nome dos projetos e qual departamento.

SELECT
	d.NomeDepartamento,
	P.NomeProjeto,
	p.DataInicio,
	p.DataTermino
FROM Depto AS D
CROSS JOIN PROJETO AS P
