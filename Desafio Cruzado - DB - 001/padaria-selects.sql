-- 1 - Consulta de fornecedores com os campos “nome do fornecedor, CNPJ do fornecedor, rua do fornecedor, número do fornecedor, bairro do fornecedor, 
-- cidade do fornecedor, estado do fornecedor e quantidade de produtos fornecidos”. 
SELECT forn.nome AS nome_fornecedor, forn.cnpj AS cnpj_fornecedor, forn.rua AS rua_fornecedor, forn.numero as numero_fornecedor, 
forn.bairro AS bairro_fornecedor, cida.nome AS cidade_fornecedor, esta.nome AS estado_fornecedor, COUNT(forn_prod.fornecedor_id)
AS quantidade_produtos_fornecidos
	FROM fornecedores forn
    INNER JOIN cidades cida
		ON forn.cidade_id = cida.id_cidade
	INNER JOIN estados esta
		ON cida.estado_id = esta.id_estado
	INNER JOIN fornecedores_produtos forn_prod
		ON forn.id_fornecedor = forn_prod.fornecedor_id
	GROUP BY forn.id_fornecedor, forn.cnpj, forn.rua, forn.numero, forn.bairro, cida.id_cidade, esta.id_estado;

-- 2 – Consulta de clientes com os campos “nome do cliente, CPF do cliente, sexo do cliente, número do celular do cliente, cidade do cliente, estado 
-- do cliente e quantidade de vendas realizadas para este cliente. Esta consulta deverá trazer todos os clientes.
SELECT clie.nome AS nome_cliente, clie.cpf AS cpf_cliente, clie.sexo AS sexo_cliente, clie.celular AS numero_celular_cliente, cida.nome AS cidade_cliente, 
esta.nome AS estado_cliente, COUNT(vend.id_venda) AS numero_vendas_realizadas_cliente
	FROM clientes clie
    LEFT JOIN cidades cida
		ON clie.cidade_id = cida.id_cidade
	INNER JOIN estados esta
		ON cida.estado_id = esta.id_estado
	LEFT JOIN vendas vend	
		ON clie.id_cliente = vend.cliente_id
	GROUP BY clie.id_cliente, clie.cpf, clie.sexo, clie.celular, cida.id_cidade, esta.id_estado;

-- 3 - Consulta de cidades com os campos “nome da cidade, nome do estado da cidade, quantidade de clientes, quantidade de clientes homens,
--  quantidade de clientes mulheres. Esta consulta deverá trazer todas as cidades.
SELECT cida.nome AS nome_cidade, esta.nome AS nome_estado_cidade, COUNT(clie.id_cliente) AS quantidade_clientes,
SUM(IF(clie.sexo = 'M', 1, 0)) AS quantidade_clientes_homens, SUM(IF(clie.sexo = 'F', 1, 0)) AS quantidade_clientes_mulheres
	FROM cidades cida
    LEFT JOIN estados esta
		ON cida.estado_id = esta.id_estado
	LEFT JOIN clientes clie
		ON cida.id_cidade = clie.cidade_id
	GROUP BY cida.id_cidade, esta.id_estado;

-- 4 - Consulta de vendas com os campos “nome do cliente, número da nota fiscal, data e hora da emissão, valor total da compra, 
-- número total de produtos e valor médio por produto”.
SELECT clie.nome AS nome_cliente, vend.numero_fiscal AS numero_nota_fiscal, vend.data_hora_emissao,
SUM(prod.preco) AS valor_total_compra, COUNT(prod.preco) AS numero_total_produtos, ROUND(avg(prod.preco), 2) AS valor_medio_produto
	FROM vendas vend
	INNER JOIN clientes clie
		ON vend.cliente_id = clie.id_cliente
	INNER JOIN produtos_vendas prod_vend
		ON vend.id_venda = prod_vend.venda_id
	INNER JOIN produtos prod
		ON prod_vend.produto_id = prod.id_produto
	GROUP BY clie.id_cliente, vend.numero_fiscal,  vend.data_hora_emissao;