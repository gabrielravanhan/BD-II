-- 1) Consulte o maior valor que foi pago por um cliente e o número da mesa em que ele estava.
select cli.nome as cliente, ped.n_mesa, max(card.valor) as max_valor
from pedido ped 
inner join cliente cli on ped.cliente_id = cli.id_cliente
inner join cardapio card on ped.prato_id = card.id_prato
group by id_pedido;

-- 2) Consulta dos nomes dos fornecedores do município de Bauru e os produtos que fornecem ao restaurante.
select forn.nome as fornecedor, forn.produto_fornecido, cid.nome_cidade
from fornecedor forn
inner join cidade cid on forn.cidade_id = cid.nome_cidade
where upper(trim(cid.nome_cidade)) = "BAURU";

-- 3) Listar em ordem alfabética os nomes dos funcionários, seguido do endereço, cidade e seus cargos correspondentes.
select func.nome, func.endereco, cid.nome_cidade, func.cargo
from funcionario func
inner join cidade cid on func.cidade_id = cid.id_cidade
order by 1,2,3,4;


-- 4) Consulta de clientes que sejam da cidade de Botucatu com os seguintes campos "nome do cliente, data de nascimento, 
-- email, endereço, número, nome da cidade, número da mesa, horário de entrada e saída, nome e valor do produto"
select cli.nome as cliente, cli.data_nascimento, cli.email, cli.endereco, cli.numero, cid.nome_cidade,
		ped.n_mesa as numero_mesa, ped.horario_entrada, ped.horario_saida, card.nome as nome_produto,
        card.valor as valor_produto
from pedido ped 
inner join cliente cli on ped.cliente_id = cli.id_cliente
inner join cidade cid on cli.cidade_id = cid.id_cidade
inner join cardapio card on ped.prato_id = card.id_prato;