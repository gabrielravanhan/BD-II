SELECT tpp.descricao as descricao_tipo_produto, COUNT(tpp.id_tp_produto) as qtde_produto, AVG(p.preco_venda) as valor_medio
	FROM tipo_produto tpp
    INNER JOIN produto p
    ON tpp.id_tp_produto = p.tp_produto_id
    GROUP BY tpp.descricao
    HAVING SUM(p.preco_venda) > 3;