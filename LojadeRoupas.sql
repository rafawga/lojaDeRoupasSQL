create database LojaDeRoupa
use LojaDeRoupa

-- Criação das tabelas

-- Tabela Cliente
CREATE TABLE Cliente (
  cliente_id INT PRIMARY KEY,
  nome VARCHAR(50),
  endereco VARCHAR(100),
  telefone VARCHAR(20),
  email VARCHAR(50)
);

-- Tabela Funcionário
CREATE TABLE Funcionario (
  funcionario_id INT PRIMARY KEY,
  nome VARCHAR(50),
  cargo VARCHAR(50),
  salario DECIMAL(10, 2),
  data_contratacao DATE
);

-- Tabela Roupas
CREATE TABLE Roupas (
  roupa_id INT PRIMARY KEY,
  nome VARCHAR(50),
  descricao VARCHAR(100),
  preco DECIMAL(10, 2),
  tamanho VARCHAR(10),
  cor VARCHAR(20)
);

-- Tabela Compra
CREATE TABLE Compra (
  compra_id INT PRIMARY KEY,
  cliente_id INT,
  funcionario_id INT,
  roupa_id INT,
  data_compra DATE,
  quantidade INT,
  FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
  FOREIGN KEY (funcionario_id) REFERENCES Funcionario(funcionario_id),
  FOREIGN KEY (roupa_id) REFERENCES Roupas(roupa_id)
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
  fornecedor_id INT PRIMARY KEY,
  nome VARCHAR(50),
  endereco VARCHAR(100),
  telefone VARCHAR(20),
  email VARCHAR(50)
);

-- Tabela Estoque
CREATE TABLE Estoque (
  estoque_id INT PRIMARY KEY,
  roupa_id INT,
  fornecedor_id INT,
  quantidade_estoque INT,
  FOREIGN KEY (roupa_id) REFERENCES Roupas(roupa_id),
  FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id)
);

-- Tabela Categoria
CREATE TABLE Categoria (
  categoria_id INT PRIMARY KEY,
  nome VARCHAR(50)
);

-- Tabela de relacionamento entre Roupas e Categoria (relacionamento muitos para muitos)
CREATE TABLE Roupas_Categoria (
  roupa_id INT,
  categoria_id INT,
  PRIMARY KEY (roupa_id, categoria_id),
  FOREIGN KEY (roupa_id) REFERENCES Roupas(roupa_id),
  FOREIGN KEY (categoria_id) REFERENCES Categoria(categoria_id)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
  pagamento_id INT PRIMARY KEY,
  compra_id INT,
  metodo_pagamento VARCHAR(50),
  valor_total DECIMAL(10, 2),
  FOREIGN KEY (compra_id) REFERENCES Compra(compra_id)
);


INSERT INTO Cliente (cliente_id, nome, endereco, telefone, email)
VALUES
  (1, 'João Silva', 'Rua A, 123', '(11) 1234-5678', 'joao.silva@email.com'),
  (2, 'Maria Santos', 'Av. B, 456', '(11) 9876-5432', 'maria.santos@email.com'),
  (3, 'Pedro Oliveira', 'Rua C, 789', '(11) 1111-2222', 'pedro.oliveira@email.com');

-- Inserção de dados fictícios na tabela Funcionario
INSERT INTO Funcionario (funcionario_id, nome, cargo, salario, data_contratacao)
VALUES
  (1, 'Angela Aparecida', 'Gerente', 5000.00, '2020-01-01'),
  (2, 'Geci', 'Batista', 2500.00, '2021-03-15');

-- Inserção de dados fictícios na tabela Roupas
INSERT INTO Roupas (roupa_id, nome, descricao, preco, tamanho, cor)
VALUES
  (4, 'Shorts Preto', 'Short moletem preto', 29.90, 'G', 'Preto'),
  (1, 'Camiseta Branca', 'Camiseta básica branca de algodão', 29.90, 'M', 'Branca'),
  (2, 'Calça Jeans', 'Calça jeans tradicional', 99.90, '38', 'Azul'),
  (3, 'Vestido Floral', 'Vestido estampado com flores', 79.90, 'P', 'Colorido');


-- Inserção de dados fictícios na tabela Compra
INSERT INTO Compra (compra_id, cliente_id, funcionario_id, roupa_id, data_compra, quantidade)
VALUES
  (1, 1, 2, 1, '2023-06-01', 2),
  (2, 2, 2, 3, '2023-06-02', 1),
  (3, 3, 1, 2, '2023-06-03', 3);


  INSERT INTO Fornecedor (fornecedor_id, nome, endereco, telefone, email)
VALUES
  (1, 'Fornecedor A', 'Rua X, 111', '(11) 7777-8888', 'fornecedor_a@email.com'),
  (2, 'Fornecedor B', 'Av. Y, 222', '(11) 9999-0000', 'fornecedor_b@email.com'),
  (3, 'Fornecedor C', 'Rua Z, 333', '(11) 2222-3333', 'fornecedor_c@email.com');


INSERT INTO Estoque (estoque_id, roupa_id, fornecedor_id, quantidade_estoque)
VALUES
  (7, 2, 3, 3),   -- Calça Jeans fornecida pelo Fornecedor C
  (8, 3, 3, 6),   -- Vestido Floral fornecido pelo Fornecedor C
  (9, 1, 1, 12);  -- Shorts Jeans fornecido pelo Fornecedor A

-- Inserção de dados fictícios na tabela Categoria
INSERT INTO Categoria (categoria_id, nome)
VALUES
  (1, 'Camisetas'),
  (2, 'Calças'),
  (3, 'Vestidos'),
  (4, 'Shorts');

-- Inserção de dados fictícios na tabela Roupas_Categoria (relacionamento muitos para muitos entre Roupas e Categoria)
INSERT INTO Roupas_Categoria (roupa_id, categoria_id)
VALUES

  (1, 1),  -- Camiseta Branca pertence à categoria Camisetas
  (2, 2),  -- Calça Jeans pertence à categoria Calças
  (3, 3),  -- Vestido Floral pertence à categoria Vestidos
  (4, 4);


------ insersao tabela de pagamentos FORMA AUTOMATICA
--DECLARE @novo_pagamento_id INT;
--SELECT @novo_pagamento_id = ISNULL(MAX(pagamento_id), 0) + 1
--FROM Pagamento;
--INSERT INTO Pagamento (pagamento_id, compra_id, metodo_pagamento, valor_total)
--SELECT @novo_pagamento_id, cp.compra_id, 'Dinheiro', r.preco * cp.quantidade
--FROM Compra cp
--JOIN Roupas r ON cp.roupa_id = r.roupa_id
--WHERE cp.compra_id = @novo_pagamento_id;

INSERT INTO Pagamento (pagamento_id, compra_id, metodo_pagamento, valor_total)
VALUES
  (1, 1, 'Cartão de Crédito', 59.80),
  (2, 2, 'Boleto Bancário', 79.90),
  (3, 3, 'Cartão de Débito', 299.70);


----------------------------------------------------------------------------------------------------------------------------------------------------------

---------------  2 ALTER

ALTER TABLE Pagamento
ADD Teste int;
select * from Pagamento

ALTER TABLE Pagamento
DROP COLUMN Teste
select * from Pagamento

ALTER TABLE funcionario
ADD ativo int not null  DEFAULT 1;
select * from Funcionario

ALTER TABLE funcionario
DROP COLUMN ativo
select * from Funcionario


-------------- 5 CONSULTAS

-- roupas acima de 30 reais
SELECT nome, preco
FROM Roupas
WHERE preco < 30.0;

-- funcionarios com mais vendas
SELECT f.nome AS nome_funcionario, COUNT(cp.compra_id) as [Qtd vendas], SUM(p.valor_total) AS [Valor Vendido]
FROM Funcionario f
JOIN Compra cp ON f.funcionario_id = cp.funcionario_id
join Pagamento P on p.compra_id = cp.compra_id
GROUP BY f.funcionario_id, f.nome
ORDER BY [Valor Vendido] DESC;

------ roupa com mais quantidade no estoque
SELECT TOP 1 r.roupa_id, r.nome, e.quantidade_estoque
FROM Roupas r
JOIN Estoque e ON r.roupa_id = e.roupa_id
ORDER BY e.quantidade_estoque DESC;


---- funcionario que menos recebe
SELECT *
FROM Funcionario
WHERE salario = (
  SELECT MIN(salario)
  FROM Funcionario
);

-- roupa mais vendida
SELECT TOP 1 r.nome AS roupa_mais_vendida, SUM(c.quantidade) AS total_vendas
FROM Compra c
JOIN Roupas r ON c.roupa_id = r.roupa_id
GROUP BY r.nome
ORDER BY total_vendas DESC;



---------------------- VIEWS
--- view de compras
CREATE VIEW ViewCompras AS
SELECT c.nome AS Cliente, r.nome AS Roupa, f.nome AS Funcionario, r.Preco, p.Metodo_Pagamento
FROM Compra cp
JOIN Cliente c ON cp.cliente_id = c.cliente_id
JOIN Roupas r ON cp.roupa_id = r.roupa_id
JOIN Funcionario f ON cp.funcionario_id = f.funcionario_id
JOIN Pagamento p ON cp.compra_id = p.compra_id;

SELECT *
FROM ViewCompras

CREATE VIEW ViewEstoque AS
SELECT r.nome, r.descricao, e.quantidade_estoque
FROM Estoque e
JOIN Roupas r ON e.roupa_id = r.roupa_id;

SELECT *
FROM ViewEstoque
----------------------------



------------- TRIGGER
CREATE TRIGGER trg_DeleteFuncionario
ON Funcionario
INSTEAD OF DELETE
AS
BEGIN
    UPDATE Funcionario
    SET ativo = 0
    WHERE funcionario_id IN (SELECT funcionario_id FROM DELETED);
END;

DELETE FROM Funcionario WHERE funcionario_id = 2;
SELECT * from Funcionario