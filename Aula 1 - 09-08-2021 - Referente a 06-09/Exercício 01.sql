-- view 01
CREATE VIEW vw_compras AS
	SELECT prod.nome AS produto, forn.nome AS fornecedor, cid.nome AS cidade_fornecedor, est.nome AS estado_fornecedor, com.valor_total, com.quantidade,
    com.data_solicitacao, com.data_prevista_entrega, com.data_recebimento
		FROM compra com
			INNER JOIN produto prod
				ON com.produto_id = prod.id_produto
			INNER JOIN fornecedor forn
				ON com.fornecedor_id = forn.id_fornecedor
			INNER JOIN cidade cid
				ON forn.cidade_id = cid.id_cidade
			INNER JOIN estado est
				ON cid.estado_id = est.id_estado;

SELECT * FROM vw_compras;

-- view 02
CREATE VIEW vw_tipos_produtos AS
	SELECT tip_prod.descricao AS descicao_produto, prod.nome AS produto, forn.nome AS forncedor
		FROM tipo_produto tip_prod
			INNER JOIN produto prod
				ON tip_prod.id_tp_produto = prod.tp_produto_id
			INNER JOIN fornecedor_produto forn_prod
				ON prod.id_produto = forn_prod.produto_id
			INNER JOIN fornecedor forn
				ON forn_prod.fornecedor_id = forn.id_fornecedor;

SELECT * FROM vw_tipos_produtos;

-- view 03
CREATE VIEW vw_fornecedores AS
	SELECT forn.nome AS nome_fornecedor, prod.nome AS produto_fornecido, cid.nome AS cidade_fornecedor, est.nome AS estado_fornecedor
		FROM fornecedor forn
			INNER JOIN fornecedor_produto forn_prod
				ON forn.id_fornecedor = forn_prod.fornecedor_id
			INNER JOIN produto prod
				ON forn_prod.produto_id = prod.id_produto
			INNER JOIN cidade cid
				ON forn.cidade_id = cid.id_cidade
			INNER JOIN estado est
				ON cid.estado_id = est.id_estado;

SELECT * FROM vw_fornecedores;