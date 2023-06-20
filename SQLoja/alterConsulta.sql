use lojaDeRoupa

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
