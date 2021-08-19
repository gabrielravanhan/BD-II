-- view 01
	SELECT cli.nome AS nome_cliente, cli.endereco, cli.numero, cli.referencia
		FROM cliente cli
			INNER JOIN cidade cid
				ON cli.cidade_id = cid.id_cidade
		WHERE cid.nome = 'Lençóis Paulista';

-- view 02
	SELECT forn.nome AS nome_cliente, cid.nome AS cidade, est.nome AS estado
		FROM cliente forn
			INNER JOIN cidade cid
				ON forn.cidade_id = cid.id_cidade
			INNER JOIN estado est
				ON cid.estado_id = est.id_estado
		WHERE est.nome = 'São Paulo';

-- view 03
	SELECT prod.nome AS produto, tip_prod.descricao
		FROM produto prod
			INNER JOIN tipo_produto tip_prod
				ON prod.tp_produto_id = tip_prod.id_tp_produto
			WHERE tip_prod.descricao = 'Fruta';