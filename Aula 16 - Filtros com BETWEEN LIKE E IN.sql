-- BETWEEN útil para realizar pesquisas por intervalos
-- salario entre 1500 e 300
SELECT
	idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE Salario BETWEEN 1500 AND 3000


-- Exemplos com Datas, funcionario admitidos em 2005
-- necessitamos da função CONVERT, pois a data está em DATETIME, por isso passamos o valor e , 120 que é o formato utilizado ANO MES E DIA
SELECT
    idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE Admissao BETWEEN CONVERT(DATETIME, '2005-01-01', 120) AND CONVERT(DATETIME, '2005-12-31', 120);


-- IN útil para buscar por listas
-- buscando por departamentos com IN (trabalhar com listas)
SELECT
    idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE idDepartamento IN(1,3,5,6,10);


-- LIKE útil para realizar por partes de conteúdo
/*
	Caracteres Coringa
	
	% = 1 ou mais caracteres desconhecidos
	_ = somente 1 caracter desconhecido
*/

-- Primeira letra do funcionário começa com A o restante não importa
SELECT
   idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE NomeFuncionario LIKE 'A%'
ORDER BY NomeFuncionario; 


-- Primeira letra A, segunda tanto faz, a 3 tem que ser A
SELECT
   idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE NomeFuncionario LIKE 'A_A%'
ORDER BY NomeFuncionario; 


-- Pessoas com nome terminam com OLIVEIRA
SELECT
   idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE NomeFuncionario LIKE '%Oliveira'
ORDER BY NomeFuncionario; 

-- Qualquer parte tenha SILVA
SELECT
   idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE NomeFuncionario LIKE '%Silva%'
ORDER BY NomeFuncionario; 