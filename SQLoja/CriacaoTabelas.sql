create lojaDeRoupa
use LojaDeRoupa
-- CRIAÇÃO DO BANCO DE DADOS

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
