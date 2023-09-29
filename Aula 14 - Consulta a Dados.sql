/*
 DQL - DATA QUERY LANGUAGE

 Princial comando.
 SELECT

*/

-- Todas colunas
SELECT * FROM Funcionario;

-- Somente algumas colunas
SELECT idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario;

-- Ordenação de Dados
-- Clausula ORDER BY ASC - CRESCENTE - DESC - DESCRENTE
SELECT idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
ORDER BY Salario DESC;

-- RANK (TOP)
SELECT TOP(10) idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario;

-- Por porcentagem
SELECT TOP(10) PERCENT idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario;

-- 10 maiores salarios
SELECT TOP(10) idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
ORDER BY Salario DESC;

-- Com empates
SELECT TOP(10) WITH TIES idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
ORDER BY Salario DESC;

