/*
 Execute o script: Cap06_Lab01_CriaBanco.sql;2. 
 
 Apresente todas as salas de aula para as quais não há nenhum curso marcado;

SELECT SALA.*
FROM SALA
LEFT JOIN CURSO ON SALA.ID_SALA = CURSO.ID_SALA
WHERE CURSO.ID_SALA IS NULL;

 
 3. Apresente todos os treinamentos para os quais não há instrutor;
 SELECT TREINAMENTO.*
FROM TREINAMENTO
LEFT JOIN INSTRUTOR ON TREINAMENTO.ID_TREINAMENTO = INSTRUTOR.ID_TREINAMENTO
WHERE INSTRUTOR.ID_TREINAMENTO IS NULL;

 
 4. Apresente os alunos (CAD_PESSOAS) que não têm e nem tiveram cursos agendados;
 SELECT PESSOA.*
FROM CAD_PESSOAS PESSOA
LEFT JOIN CURSO_ALUNO ON PESSOA.ID_PESSOA = CURSO_ALUNO.ID_ALUNO
WHERE CURSO_ALUNO.ID_ALUNO IS NULL;

 
 5. Apresente os departamentos que não possuem funcionários cadastrados;
 SELECT DEPARTAMENTO.*
FROM DEPARTAMENTO
LEFT JOIN FUNCIONARIO ON DEPARTAMENTO.ID_DEPARTAMENTO = FUNCIONARIO.ID_DEPARTAMENTO
WHERE FUNCIONARIO.ID_DEPARTAMENTO IS NULL;

 
 6. Apresente os cargos para os quais não existem funcionários cadastrados;
 SELECT CARGO.*
FROM CARGO
LEFT JOIN FUNCIONARIO ON CARGO.ID_CARGO = FUNCIONARIO.ID_CARGO
WHERE FUNCIONARIO.ID_CARGO IS NULL;

 
 7. Apresente as pessoas que sejam de estados cujo ICMS seja menor que 7;
 SELECT PESSOA.*
FROM CAD_PESSOAS PESSOA
WHERE PESSOA.ESTADO IN (SELECT ESTADO FROM ESTADOS WHERE ICMS < 7);

 
 8. Apresente os dados do instrutor que possui o maior valor hora (VLR_HORA);
 SELECT TOP 1 INSTRUTOR.*
FROM INSTRUTOR
ORDER BY INSTRUTOR.VLR_HORA DESC;

 
 9. Apresente os dados do instrutor que possui o menor valor hora (VLR_HORA).

 SELECT * FROM CAD_PESSOAS
 WHERE ID_PESSOA IN ( SELECT ID_PESSOA_INSTR FROM CAD_INSTRUTORES_TREINAMENTOS
		WHERE VLR_HORA = (SELECT MIN(VLR_HORA) FROM CAD_INSTRUTORES_TREINAMENTOS)



*/