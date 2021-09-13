-- 1) Desenvolver uma view com inner join com todas as tabelas.
CREATE VIEW vw_exercicio01 AS
	SELECT com.comida AS pedido, com.preco, cli.cliente, ent.entregador
		FROM pedido ped
			INNER JOIN clientes cli
				ON ped.cliente_id = cli.id_cliente
			INNER JOIN entregadores ent
                ON ped.entregador_id = ent.id_entregador
			INNER JOIN comida com
				ON ped.comida_id = com.id_comida;

SELECT * FROM vw_exercicio01;

-- 2) Desenvolver uma view com left join ou rigth join com pelo menos 2 tabelas.
CREATE VIEW vw_exercicio02 AS
	SELECT cli.cliente, cli.email,  cli.fone AS telefone, ped.data_pedido
		FROM clientes cli
			LEFT JOIN pedido ped
				ON cli.id_cliente = ped.cliente_id;

SELECT * FROM vw_exercicio02;

-- 3) Desenvolver uma view com COUNT e SUM no mesmo script utilizando a tabela pedido.
CREATE VIEW vw_exercicio03 AS
	SELECT COUNT(ped.id_pedido) AS quantidade_pedidos, SUM(com.preco) AS ganhos_com_os_pedidos
		FROM pedido ped
			INNER JOIN comida com
				ON ped.comida_id = com.id_comida;

SELECT * FROM vw_exercicio03;

-- 04) Desenvolver uma view com LIKE e IN no mesmo script utilizando a tabela comida.
CREATE VIEW vw_exercicio04 AS
	SELECT *
		FROM comida
			WHERE comida LIKE 'S%' OR id_comida IN(2, 4, 6, 8, 10);
            
SELECT * FROM vw_exercicio04;

-- 05) Desenvolver uma view com group by utilizando uma tabela a sua escolha.
CREATE VIEW vw_exercicio05 AS
	SELECT *
		FROM entregadores
			GROUP BY id_entregador;

SELECT * FROM vw_exercicio05;