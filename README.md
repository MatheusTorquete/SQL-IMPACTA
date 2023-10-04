# SQL Server - Principais Conceitos e Comandos


### Banco de Dados
- **CREATE DATABASE**: Cria um novo banco de dados.
- **USE DATABASE**: Seleciona um banco de dados específico para ser usado.

### Tabelas
- **CREATE TABLE**: Cria uma nova tabela no banco de dados.
- **ALTER TABLE**: Modifica uma tabela existente (adiciona, remove ou modifica colunas).
- **DROP TABLE**: Exclui uma tabela do banco de dados.

### Consultas
- **SELECT**: Recupera dados de uma ou mais tabelas.
- **WHERE**: Filtra os resultados com base em uma condição específica.
- **ORDER BY**: Ordena os resultados em ordem ascendente ou descendente.

### Modificação de Dados
- **INSERT INTO**: Insere novos registros em uma tabela.
- **UPDATE**: Modifica dados existentes em uma tabela.
- **DELETE**: Exclui registros de uma tabela.

## Funções Agregadas
- **SUM()**: Calcula a soma dos valores em uma coluna.
- **AVG()**: Calcula a média dos valores em uma coluna.
- **COUNT()**: Conta o número de registros em uma consulta.
- **MAX()**: Retorna o valor máximo em uma coluna.
- **MIN()**: Retorna o valor mínimo em uma coluna.

## Funções de Strings
- **LEN()**: Retorna o comprimento de uma string.
- **LEFT()**: Retorna os primeiros caracteres de uma string.
- **RIGHT()**: Retorna os últimos caracteres de uma string.
- **LOWER()**: Converte uma string para minúsculas.
- **UPPER()**: Converte uma string para maiúsculas.
- **SUBSTRING()**: Retorna uma parte específica de uma string.

## Funções de Data e Hora
- **GETDATE()**: Retorna a data e hora atuais.
- **DATEPART()**: Retorna uma parte específica de uma data ou hora (dia, mês, ano, etc.).
- **DATEDIFF()**: Retorna a diferença entre duas datas ou horas.

## Constraints
- **PRIMARY KEY**: Define uma chave primária para uma tabela.
- **FOREIGN KEY**: Define uma chave estrangeira para estabelecer relações entre tabelas.
- **CHECK**: Impõe uma condição específica para os valores em uma coluna.
- **UNIQUE**: Garante que os valores em uma coluna são únicos.

## Operadores e Cláusulas Úteis
- **BETWEEN**: Filtra resultados dentro de um intervalo específico.
- **LIKE**: Filtra resultados com base em padrões de texto.
- **IN**: Especifica uma lista de valores para corresponder em uma cláusula WHERE.
- **INTERSECT**: Retorna os resultados que estão presentes em ambas as consultas.
- **EXCEPT**: Retorna os resultados que estão presentes na primeira consulta, mas não na segunda.

## Subqueries
- **Subqueries Escalares**: Retorna um único valor (pode ser usado em SELECT, WHERE, etc.).
- **Subqueries Correlacionadas**: Referencia colunas da consulta externa na subconsulta.
- **Subqueries com EXISTS**: Retorna verdadeiro se a subconsulta encontrar algum resultado.

## Temporary Tables
- **CREATE TABLE #nome_da_tabela**: Cria uma tabela temporária que existe apenas durante a sessão atual.
- **DROP TABLE #nome_da_tabela**: Exclui a tabela temporária.
