/*
GETDATE - retorna data e hora

DAY - retorna o dia de uma data

MONTH - retorna o mes de uma data

YEAR - retorna o ano de uma data

EOMONTH - retorna o ultimo dia do mes

DATEFROMPARTS - retorna data a partir de parametros

DATEDIFF - retorna a diferença entre duas datas

DATEADD - adiciona um valor em data

DATENAME - retorna o nome do dia e da semana ou mes
*/


SELECT GETDATE();

Use SisDep
-- mostrando dia mes e ano contratação dos funcionários
SELECT
	NomeFuncionario, Admissao,
	DAY(Admissao) AS [Dia],
	MONTH(Admissao) AS [Mês],
	YEAR(Admissao) AS [Ano]
FROM Funcionario

-- retornar admitidos na 1 quinzena de qualquer mes do 2 semestre dos ano 200 2003 2005 2008 2010
SELECT
	NomeFuncionario, Admissao,
	DAY(Admissao) AS [Dia],
	MONTH(Admissao) AS [Mês],
	YEAR(Admissao) AS [Ano]
FROM Funcionario
WHERE 
	DAY(Admissao) <= 15 
	AND MONTH(Admissao) >= 7
	AND YEAR(Admissao) IN(2000,2003,2005,2008,2010);



	--- 0 é o mês atual, retorna o último dia do mes que está.
	SELECT EOMONTH(GETDATE(),0);


	--- retorna a data que passamos, é útil quando precisa utilizar a data separada
	SELECT DATEFROMPARTS(2017,1,10);


	-- interessante usar diferença entre dias entre duas datas
	/*
	YEAR YYYY
	QUARTER Q
	MONTH M
	WEEK WW
	DAY D
	*/
	SELECT DATEDIFF(DAY,'1993/03/01', GETDATE()) AS [DIAS DE VIDA]
	SELECT DATEDIFF(MONTH,'1993/03/01', GETDATE()) AS [MES DE VIDA]
	SELECT DATEDIFF(YEAR,'1993/03/01', GETDATE()) AS [ANOS DE VIDA]
	SELECT DATEDIFF(QUARTER,'1993/03/01', GETDATE()) AS [TRIMESTRES DE VIDA]
	SELECT DATEDIFF(WEEK,'1993/03/01', GETDATE()) AS [semanas DE VIDA]


	-- contagem daqui 65 dias
	SELECT DATEADD(DAY, 65, GETDATE()) AS [DIAS]
	SELECT DATEADD(MONTH, 65, GETDATE()) AS [MES]
	SELECT DATEADD(YEAR, 65, GETDATE()) AS [ANOS]
	SELECT DATEADD(WEEK, 65, GETDATE()) AS [SEMANAS]
	SELECT DATEADD(QUARTER, 65, GETDATE()) AS [TRIMESTRES]




	--- Descobrindo dia da semana e mes de contratação
	SELECT
		NomeFuncionario,
		Admissao,
		DATENAME(WEEKDAY, Admissao) AS [Dia da semana],
		DATENAME(MONTH,Admissao) AS [Mês]
	FROM Funcionario