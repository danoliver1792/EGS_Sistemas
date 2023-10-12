-- criacao do banco de dados
CREATE DATABASE EMPRESA;

USE EMPRESA;

-- criacao das tabelas
CREATE TABLE PEDIDO (
	idPedido INT PRIMARY KEY,
	nomeCliente VARCHAR(255) NOT NULL,
	dataPedido DATETIME NOT NULL,
	valorPedido DECIMAL(10, 2) NOT NULL
);

CREATE TABLE PRODUTO (
	idProduto INT PRIMARY KEY,
	nomeProduto VARCHAR(255) NOT NULL,
	valorProduto DECIMAL(10, 2) NOT NULL

);

-- tabela associativa para fazer o relacionamento entre as tabelas PEDIDO e PRODUTO
CREATE TABLE ITEM_PEDIDO (
	idRelacionamento INT PRIMARY KEY,
	idPedido INT,
	idProduto INT,
	quantidade INT NOT NULL,
	FOREIGN KEY (idPedido) REFERENCES PEDIDO(idPedido),
	FOREIGN KEY (idProduto) REFERENCES PRODUTO(idProduto)
);

-- inserindo produto na tabela PRODUTO
INSERT INTO PRODUTO VALUES (1, 'COMPUTADOR', 3000.00);

SELECT * FROM PRODUTO;

-- modificando o valor do produto 1
UPDATE PRODUTO
SET valorProduto = 3500.00
WHERE idProduto = 1;

SELECT * FROM PRODUTO;

-- excluindo um produto pelo identificador
DELETE FROM PRODUTO
WHERE idProduto = 1;

SELECT * FROM PRODUTO;

INSERT INTO PRODUTO VALUES (2, 'TELEVISAO', 2500.00);

SELECT * FROM PRODUTO;

-- inserindo pedido na tabela PEDIDO
INSERT INTO PEDIDO VALUES (1, 'Danrlei', GETDATE(), 6000.00);

SELECT * FROM PEDIDO;

-- modificando a data\hora do pedido na tabela PEDIDO
UPDATE PEDIDO
SET dataPedido = '2023-10-12 15:39:00'
WHERE idPedido = 1;

SELECT * FROM PEDIDO;

-- excluindo um pedido pelo identificador
DELETE FROM PEDIDO
WHERE idPedido = 1;

SELECT * FROM PEDIDO;

-- adicionando um produto no pedido com quantidade 5
INSERT INTO PEDIDO VALUES (1, 'Danrlei', GETDATE(), 12500.00)
INSERT INTO ITEM_PEDIDO VALUES (1, 1, 2, 5);

-- procedure para buscar os pedidos dos ultimos dois dias ordenando pela data e hora
CREATE PROCEDURE BuscaPedidos
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @DataInicial DATETIME;
	DECLARE @DataFinal DATETIME;

	SET @DataFinal = GETDATE();
	SET @DataInicial = DATEADD(DAY, -2, @DataFinal);

	SELECT
		idPedido,
		nomeCliente,
		dataPedido,
		valorPedido
	FROM PEDIDO
	WHERE dataPedido BETWEEN @DataInicial AND @DataFinal
	ORDER BY dataPedido;
END;

-- buscando os produtos com menor valor
CREATE PROCEDURE MenorProduto
AS
BEGIN
	SELECT
		nomeProduto,
		valorProduto
	FROM PRODUTO
	ORDER BY valorProduto ASC;
END;
