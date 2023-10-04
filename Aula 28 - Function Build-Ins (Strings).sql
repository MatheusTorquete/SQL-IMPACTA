/*
Funções para manipular textos.
*/


SELECT
	NomeFuncionario,
	LEN(NomeFuncionario) AS [N de caracter],
	idMatricula,
	LEFT(IdMatricula,2) AS [Esquerda],
	RIGHT(IdMatricula, 1) AS [Direita],
	REPLACE(IdMatricula, '10', '20') AS [Substituindo 10 por 20],
	CHARINDEX('silva', NomeFuncionario, 1) AS [Localizar no campo funcionario a partir da 1 posição],
	SUBSTRING(nomeFuncionario, 1, 10) AS [Nome a partir da 1 posição até o 10],
	SUBSTRING(NomeFuncionario, 1, CHARINDEX(' ', NomeFuncionario, 1) -1) AS [Primeiro Nome]
FROM Funcionario


-- Remoção de Espaços

SELECT RTRIM('Impacta        ');

SELECT LTRIM('     Impacta');

-- Podemos combinar as duas, pois não há uma que remova das duas
SELECT RTRIM(LTRIM(' A H '));

-- Letras maisculas e minuculas
SELECT UPPER(NomeFuncionario) AS [Maisculas],
		LOWER(NomeFuncionario) AS [Minusculas]
FROM Funcionario;


-- Replicar os caracteres
SELECT REPLICATE('*', 10) AS [repetição de 10 vezes da string];


-- Inverter um texto
SELECT REVERSE('IMPACTA');

-- Concatenação
SELECT 
	idMatricula,
	NomeFuncionario,
	CONCAT(Idmatricula ,'-',idDepartamento, '-', idCargo) AS [Concatenar]
FROM Funcionario