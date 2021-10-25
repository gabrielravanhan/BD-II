-- EXERCÍCIOS

-- 1 qual o nome e email dos corretores que alugaram casa
SELECT cor.nome_corretor, cor.email
	FROM corretor cor
		INNER JOIN aluguel alu	ON cor.id_corretor = alu.corretor_id
        INNER JOIN imovel imo	ON alu.imovel_id = imo.id_imovel
	WHERE imo.tipo = 'Casa';

-- 2 qual o nome e telefone dos inquilinos que alugaram apartamento
SELECT inq.nome_inquilino, inq.telefone
	FROM inquilino inq
		INNER JOIN aluguel alu	ON inq.id_inquilino = alu.inquilino_id
        INNER JOIN imovel imo	ON alu.imovel_id = imo.id_imovel
	WHERE imo.tipo = 'Apartamento';

-- 3 listar o nome dos fiadores de casa ou apartamentos
SELECT inq.fiador
	FROM inquilino inq
		INNER JOIN aluguel alu	ON inq.id_inquilino = alu.inquilino_id
        INNER JOIN imovel imo	ON alu.imovel_id = imo.id_imovel
	WHERE imo.tipo IN('Casa', 'Apartamento');

-- 4 qual o nome dos corretos que alugaram chacaras
SELECT cor.nome_corretor
	FROM corretor cor
		INNER JOIN aluguel alu	ON cor.id_corretor = alu.corretor_id
        INNER JOIN imovel imo	ON alu.imovel_id = imo.id_imovel
	WHERE imo.tipo = 'Chácara';

-- 5 qual a descrição das casas alugadas
SELECT imo.descricao AS descricao_casa
	FROM imovel imo
		INNER JOIN aluguel alu	ON imo.id_imovel = alu.imovel_id
	WHERE imo.tipo = 'Casa';

-- 6 mostrar todos os dados da tabela aluguel (proprietário, imovel, corretor e inquilino)
--   mas somente dos contratos com vencimento até dezembro de 2021
SELECT pro.nome_proprietario, imo.tipo, cor.nome_corretor, inq.nome_inquilino
	FROM aluguel alu
		INNER JOIN proprietario pro	ON alu.proprietario_id = pro.id_proprietario
        INNER JOIN imovel imo		ON alu.imovel_id = imo.id_imovel
        INNER JOIN corretor cor		ON alu.corretor_id = cor.id_corretor
        INNER JOIN inquilino inq	ON alu.inquilino_id = inq.id_inquilino;

-- 7 mostrar todos os dados da tabela aluguel (proprietário, imovel, corretor e inquilino)
--   mas somente dos contratos vencidos
SELECT pro.nome_proprietario, imo.tipo, cor.nome_corretor, inq.nome_inquilino
	FROM aluguel alu
		INNER JOIN proprietario pro	ON alu.proprietario_id = pro.id_proprietario
        INNER JOIN imovel imo		ON alu.imovel_id = imo.id_imovel
        INNER JOIN corretor cor		ON alu.corretor_id = cor.id_corretor
        INNER JOIN inquilino inq	ON alu.inquilino_id = inq.id_inquilino;

-- 8 mostrar todos os dados da tabela aluguel (proprietário, imovel, corretor e inquilino)
--   mas somente dos contratos ativos ou seja não vencidos
SELECT pro.nome_proprietario, imo.tipo, cor.nome_corretor, inq.nome_inquilino
	FROM aluguel alu
		INNER JOIN proprietario pro	ON alu.proprietario_id = pro.id_proprietario
        INNER JOIN imovel imo		ON alu.imovel_id = imo.id_imovel
        INNER JOIN corretor cor		ON alu.corretor_id = cor.id_corretor
        INNER JOIN inquilino inq	ON alu.inquilino_id = inq.id_inquilino;

-- 9 mostrar os dados de inquilinos que alugaram apartamento com valores de aluguel 
--   entre 1000 e 1300
SELECT inq.nome_inquilino, inq.fiador, inq.sexo, inq.data_nascimento, inq.telefone
	FROM inquilino inq
		INNER JOIN aluguel alu	ON inq.id_inquilino = alu.inquilino_id
		INNER JOIN imovel imo	ON alu.imovel_id = imo.id_imovel
	WHERE imo.tipo = 'Apartamento' AND valor_aluguel BETWEEN 1000 AND 1300;

-- 10 mostrar todos os dados da tabela aluguel (proprietário, imovel, corretor e inquilino)
--    SOMENTE dos contratos ativos do tipo casa e com valores de aluguel entre 1000 a 2000 
SELECT pro.nome_proprietario, imo.tipo, cor.nome_corretor, inq.nome_inquilino
	FROM aluguel alu
		INNER JOIN proprietario pro	ON alu.proprietario_id = pro.id_proprietario
        INNER JOIN imovel imo		ON alu.imovel_id = imo.id_imovel
        INNER JOIN corretor cor		ON alu.corretor_id = cor.id_corretor
        INNER JOIN inquilino inq	ON alu.inquilino_id = inq.id_inquilino;
