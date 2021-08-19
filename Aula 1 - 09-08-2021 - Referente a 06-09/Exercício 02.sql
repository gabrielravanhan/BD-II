-- view 01
CREATE VIEW vw_cliente_estado AS
	SELECT clie.nome AS nome_cliente, est.nome AS estado_cliente
		FROM cliente clie
			INNER JOIN cidade cid
				ON clie.cidade_id = cid.id_cidade
			INNER JOIN estado est
				ON cid.estado_id = est.id_estado
		GROUP BY clie.id_cliente, est.id_estado;

SELECT * FROM vw_cliente_estado;

-- view 02
CREATE VIEW vw_fornecedor_cidade AS
	SELECT forn.nome AS fornecedor, cid.nome AS cidade_fornecedor
		FROM fornecedor forn
			INNER JOIN cidade cid
				ON forn.cidade_id = cid.id_cidade
		GROUP BY forn.id_fornecedor, cid.id_cidade;

SELECT * FROM vw_fornecedor_cidade;

-- view 03
CREATE VIEW vw_produto_tipo_produto AS
	SELECT prod.nome AS produto, tip_prod.descricao AS tipo_produto
		FROM produto prod
			INNER JOIN tipo_produto tip_prod
				ON prod.tp_produto_id = tip_prod.id_tp_produto
			GROUP BY prod.id_produto, tip_prod.id_tp_produto;

SELECT * FROM vw_produto_tipo_produto;