-- 1. Consulta de clientes com os campos "Nome do Cliente, Endereço, Numero, Referencia, Nome da Cidade e Nome do Estado"
SELECT A.nome AS nome_cliente, A.endereco, A.numero, A.referencia, B.nome AS nome_cidade, C.nome AS nome_estado
	FROM quitanda.cliente A
    LEFT JOIN quitanda.cidade B
    ON  A.cidade_id = B.id_cidade
    INNER JOIN quitanda.estado C
    ON B.estado_id = C.id_estado;

-- 2. Consulta de fornecedores com os campos  "Nome do Fornecedor, Nome da Cidade, Nome do Estado"
SELECT A.nome AS nome_fornacedor, B.nome AS nome_cidade, C.nome AS nome_estado
	FROM quitanda.fornecedor A
    LEFT JOIN quitanda.cidade B
    ON A.cidade_id = B.id_cidade
    INNER JOIN quitanda.estado C
    ON B.estado_id = C.id_estado;

-- 3. Consulta de produtos com os campos "Nome do Produto, Descrição do tipo do produtos"
SELECT A.nome AS nome_produto, B.descricao AS descricao_tipo_produto
	FROM quitanda.produto A
    LEFT JOIN quitanda.tipo_produto B
    ON A.tp_produto_id = B.id_tp_produto;

-- 4. Consulta de fornecedores e quais os produtos que eles distribuem com os campos "Nome do Fornecedor, Nome do produto, Nome do tipo do Produto, Nome da Cidade do Fornecedor"
SELECT A.nome AS nome_fornecedor, B.nome AS nome_produto, C.descricao AS nome_tipo_produto, D.nome AS nome_cidade_fornecedor
	FROM quitanda.tipo_produto C
    INNER JOIN quitanda.produto B
    ON C.id_tp_produto = B.tp_produto_id
    INNER JOIN quitanda.fornecedor_produto E
    ON  B.id_produto = E.produto_id
    RIGHT JOIN quitanda.fornecedor A
    ON A.id_fornecedor = E.fornecedor_id
    INNER JOIN quitanda.cidade D
    ON A.cidade_id = D.id_cidade;

-- 5. Consulta de produtos que os fornecedores sejam do estado de Minas Gerais com os campos "Nome do Fornecedor, Nome do produto, Nome do tipo do Produto, Nome da Cidade do Fornecedor, Nome do Estado do Fornecedor"
SELECT A.nome AS nome_fornecedor, B.nome AS nome_produto, C.descricao AS nome_tipo_produto, D.nome AS nome_cidade_fornecedor, E.nome AS nome_estado_fornecedor
	FROM quitanda.estado E
    INNER JOIN quitanda.cidade D
    ON E.id_estado = D.estado_id
	RIGHT JOIN quitanda.fornecedor A
    ON D.id_cidade = A.cidade_id
    LEFT JOIN quitanda.fornecedor_produto F
    ON A.id_fornecedor = F.fornecedor_id
    RIGHT JOIN quitanda.produto B
    ON F.produto_id = B.id_produto
    INNER JOIN quitanda.tipo_produto C
    ON B.tp_produto_id = C.id_tp_produto
	WHERE E.nome = 'Minas Gerais';

SELECT a.nome AS "Nome do Produto", b.descricao AS "Descrição do Produto"
FROM produto a 
LEFT JOIN tipo_produto b
ON a.tp_produto_id = b.id_tp_produto;

SELECT p.nome AS "Nome do Produto", tp.descricao AS "Descrição do Produto", f.nome AS 'Nome do Fornecedor'
FROM produto p
LEFT JOIN tipo_produto tp
	ON p.tp_produto_id = tp.id_tp_produto
LEFT JOIN fornecedor_produto fp
	ON p.id_produto = fp.produto_id
LEFT JOIN fornecedor f
	ON fp.fornecedor_id = f.id_fornecedor;

SELECT p.nome AS "Nome do Produto", tp.descricao AS "Descrição do Produto", f.nome AS 'Nome do Fornecedor'
FROM fornecedor f
INNER JOIN fornecedor_produto fp
	ON f.id_fornecedor = fp.fornecedor_id
RIGHT JOIN produto p
	ON fp.produto_id = p.id_produto
LEFT JOIN tipo_produto tp
	ON p.tp_produto_id = tp.id_tp_produto;