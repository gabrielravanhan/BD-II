-- view 01
CREATE VIEW cliente_estado AS
	SELECT clie.nome AS nome_cliente, est.nome AS estado_cliente
		FROM cliente clie
			INNER JOIN cidade cid
				ON clie.cidade_id = cid.id_cidade
			INNER JOIN estado est
				ON cid.estado_id = estado_id
		GROUP BY clie.id_cilente, est.id_estado;

-- view 02
CREATE VIEW fornecedor_cidade AS
	SELECT forn.nome AS fornecedor, cid.nome AS cidade_fornecedor
		FROM fornecedor forn
			INNER JOIN cidade cid
				ON forn.cidade_id = cid.id_cidade
		GROUP BY forn.id_fornecedor, cid.id_cidade;

-- view 03
CREATE VIEW produto_tio_produto AS
	SELECT prod.nome AS produto, tip_prod.descricao AS tipo_produto
		FROM produto prod
			INNER JOIN tipo_produto tip_prod
				ON prod.tp_produto_id = tip_prod.id_tp_produto
			GROUP BY prod.id_produto, tip_prod.id_tp_produto;