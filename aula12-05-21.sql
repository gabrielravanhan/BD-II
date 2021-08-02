ALTER TABLE produto
	ADD COLUMN preco_venda DOUBLE UNSIGNED NOT NULL;

ALTER TABLE fornecedor_produto
	ADD COLUMN preco_aquisicao DOUBLE UNSIGNED NOT NULL;

UPDATE produto
	SET preco_venda = 3.5
    WHERE id_produto = 1;

UPDATE produto
	SET preco_venda = 4
    WHERE id_produto = 2;
    
UPDATE produto
	SET preco_venda = 5
    WHERE id_produto = 3;

UPDATE fornecedor_produto
	SET preco_aquisicao = 1
    WHERE id_fornecedor_produto = 1;

UPDATE fornecedor_produto
	SET preco_aquisicao = 2
    WHERE id_fornecedor_produto = 2;

UPDATE fornecedor_produto
	SET preco_aquisicao = 3
    WHERE id_fornecedor_produto = 3;