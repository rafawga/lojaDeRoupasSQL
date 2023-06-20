use LojaDeRoupa

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