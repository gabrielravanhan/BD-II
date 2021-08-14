-- view 01
CREATE VIEW cidade_quantidade_clientes_fornecedores AS
	SELECT cid.nome AS nome_cidade, COUNT(cli.cidade_id) AS quantidade_clientes, COUNT(forn.cidade_id) AS quantidade_fornecedores
		FROM cidade cid
			LEFT JOIN cliente cli
				ON cid.id_cidade = cli.cidade_id
			LEFT JOIN fornecedor forn
				ON cid.id_cidade = forn.cidade_id
		GROUP BY cid.id_cidade;

-- view 02

	SELECT tip_prod.descricao AS tipo_produto, SUM(prod.) soma_peco_protudos_desse_tipo
		FROM tipo_produto tip_prod
			INNER JOIN produto prod
				ON tip_prod.id_tp_produto = prod.tp_produto_id
		GROUP BY tip_prod.id_tp_produto;