/*
CAST - converter tipo de dados
(valor referencias as tipo de dado)

CONVERT -  converter tipo de dados
(tipo de dados, valor referencia, estilo)

FORMAT - formatar dados
(valor referencia, formato, cultupra/pais)

format(campo, 'c', 'en-us') em dolar
format(campo, 'c', 'pt-br') em br

datas
format(campo data, 'd', 'pt-br')
format(campo data, 'dd - mm - yyyy', 'pt-br')

*/

-- convertendo datetime para data.
SELECT
	NomeFuncionario,
	CAST(Admissao AS DATE) AS [Data Alterada]
FROM Funcionario

-- agora com CONVERT, os c�digo v�o de 1 a 14 os mais utilizados.(tipo de datas)
SELECT
	NomeFuncionario,
	CONVERT(VARCHAR, Admissao, 1) AS [Padr�o Amerciano Data],
	CONVERT(VARCHAR, Admissao, 2) AS [Padr�o ISO INTERNACIONAL],
	CONVERT(VARCHAR, Admissao, 3) AS [Padr�o Brasil - sem s�culo]
FROM Funcionario


-- format para datas e moedas
SELECT
	NomeFuncionario,
	FORMAT(Salario, 'C', 'en-us') AS [Dolar],
	FORMAT(Salario, 'C', 'pt-br') AS [Real],
	FORMAT(Admissao, 'd', 'PT-BR') AS [Data BR],
	FORMAT(Admissao, 'D', 'PT-BR') AS [Data por extenso]
FROM Funcionario