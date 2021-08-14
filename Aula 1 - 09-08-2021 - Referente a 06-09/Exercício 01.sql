-- view 01
CREATE VIEW vw_cliente_endereco AS
	SELECT cli.id_cilente, cli.nome AS nome, cli.endereco, cli.numero AS n_endereco, cid.nome AS cidade, est.nome AS estado
		FROM cliente cli
			INNER JOIN cidade cid 
				ON cli.cidade_id = cid.id_cidade
			INNER JOIN estado est 
				ON cid.estado_id = est.id_estado;

-- view 02
CREATE VIEW vw_tipo_produto AS
	SELECT tip_prod.descricao AS descicao_produto, prod.nome AS produto, forn.nome AS forncedor
		FROM tipo_produto tip_prod
			INNER JOIN produto prod
				ON tip_prod.id_tp_produto = prod.tp_produto_id
			INNER JOIN fornecedor_produto forn_prod
				ON prod.id_produto = forn_prod.produto_id
			INNER JOIN fornecedor forn
				ON forn_prod.fornecedor_id = forn.id_fornecedor;

-- view 03
CREATE VIEW vw_fornecedor AS
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