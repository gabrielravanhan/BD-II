SELECT p.nome AS nome_produto, p.preco_venda, fp.preco_aquisicao, p.preco_venda - fp.preco_aquisicao as ganho_quitanda_venda, f.nome AS nome_fornecedor
	FROM produto p
    INNER JOIN fornecedor_produto fp
    ON p.id_produto = fp.produto_id
    INNER JOIN fornecedor f
    ON fp.fornecedor_id = f.id_fornecedor;