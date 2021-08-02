-- 1) Consulte o maior valor que foi pago por um cliente e o número da mesa em que ele estava.
SELECT MAX(cai.pagamento_cliente) AS maior_valor_pago_cliente, ped.n_mesa AS numero_mesa_cliente
	FROM caixa cai
	INNER JOIN pedido ped
		ON cai.pedido_id = ped.id_pedido
	GROUP BY ped.n_mesa;

-- 2) Consulta dos nomes dos fornecedores do município de Bauru e os produtos que fornecem ao restaurante.
SELECT forn.nome AS nome_fornecedor, cid.nome_cidade AS municipio, forn.produto_fornecido AS produtos_fornecem_restaurante
	FROM fornecedor forn
    INNER JOIN cidade cid
		ON forn.cidade_id = cid.id_cidade AND cid.nome_cidade = 'Bauru';
    
-- 3) Listar em ordem alfabética os nomes dos funcionários, seguido do endereço, cidade e seus cargos correspondentes.
SELECT fun.nome AS nome_funcionario, fun.endereco, cid.nome_cidade AS cidade, fun.cargo AS cargo_correspondente
	FROM funcionario fun
	INNER JOIN cidade cid
        ON fun.cidade_id = cid.id_cidade
	ORDER BY fun.nome;

-- 4) Consulta de clientes que sejam da cidade de Botucatu com os seguintes campos "nome do cliente, data de nascimento, email, endereço, número, 
-- nome da cidade, número da mesa, horário de entrada e saída, nome e valor do produto".
SELECT cli.nome AS nome_cliente, cli.data_nascimento, cli.email, cli.endereco, cli.numero, cid.nome_cidade, ped.n_mesa AS numero_mesa,
ped.horario_entrada, ped.horario_saida, car.nome AS nome_produto, car.valor AS valor_produto
	FROM cliente cli
    INNER JOIN cidade cid
		ON cli.cidade_id = cid.id_cidade
	INNER JOIN pedido ped
		ON cli.id_cliente = ped.cliente_id
	INNER JOIN cardapio car
		ON ped.prato_id = car.id_prato AND cid.nome_cidade = 'Botucatu';