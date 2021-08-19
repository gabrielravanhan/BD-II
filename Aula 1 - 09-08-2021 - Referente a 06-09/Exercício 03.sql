-- view 01
CREATE VIEW vw_cidade_quantidade_clientes_fornecedores AS
	SELECT cid.nome AS nome_cidade, COUNT(cli.cidade_id) AS quantidade_clientes, COUNT(forn.cidade_id) AS quantidade_fornecedores
		FROM cidade cid
			LEFT JOIN cliente cli
				ON cid.id_cidade = cli.cidade_id
			LEFT JOIN fornecedor forn
				ON cid.id_cidade = forn.cidade_id
		GROUP BY cid.id_cidade;

SELECT * FROM vw_cidade_quantidade_clientes_fornecedores;

-- view 02
CREATE VIEW vw_total_gasto_em_compras AS
	SELECT SUM(valor_total) AS valor_total_gasto_em_compras
		FROM compra;

SELECT * FROM vw_total_gasto_em_compras;

-- view 03 quantidade_soma_media_id_produto
CREATE VIEW vw_media_gata_por_compra AS
	SELECT AVG(valor_total) AS media_gata_por_compra
		FROM compra;

SELECT * FROM vw_media_gata_por_compra;