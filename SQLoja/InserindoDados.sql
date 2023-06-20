use LojaDeRoupa

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