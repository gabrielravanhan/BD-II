-- pesquisa em multiplas tabelas
-- quem é o proprietário?
SELECT p.nome_proprietario
	FROM aluguel a 
		INNER JOIN proprietario p 
			ON a.proprietario_id = p.id_proprietario;

-- quem é o proprietário?
-- o que ele alugou?
SELECT p.nome_proprietario, i.tipo, i.endereco, i.valor_aluguel
	FROM aluguel a 
		INNER JOIN proprietario p 
			ON a.proprietario_id = p.id_proprietario
		INNER JOIN imovel i	
			ON a.imovel_id = i.id_imovel;

-- quem é o proprietário?
-- o que ele alugou?
-- qual corretor alugou?
SELECT p.nome_proprietario, i.tipo, i.endereco, i.valor_aluguel, c.nome_corretor, c.telefone
	FROM aluguel a 
		INNER JOIN proprietario p 
			ON a.proprietario_id = p.id_proprietario
		INNER JOIN imovel i	
			ON a.imovel_id = i.id_imovel
		INNER JOIN corretor c
			ON a.corretor_id = c.id_corretor;

-- SÓ PRECISAVA TER FEITO ESSE
-- quem é o proprietário?
-- o que ele alugou?
-- qual corretor alugou?
-- quem alugou ?
SELECT p.nome_proprietario, i.tipo, i.endereco, i.valor_aluguel, c.nome_corretor, c.telefone, c.email, iq.nome_inquilino, iq.sexo
	FROM aluguel a 
		INNER JOIN proprietario p 
			ON a.proprietario_id = p.id_proprietario
		INNER JOIN imovel i	
			ON a.imovel_id = i.id_imovel
		INNER JOIN corretor c
			ON a.corretor_id = c.id_corretor
		INNER JOIN inquilino iq
			ON a.inquilino_id = iq.id_inquilino;

-- LEFT - proprietario SEM imovel
SELECT p.nome_proprietario, p.telefone, i.tipo, i.endereco, i.valor_aluguel, c.nome_corretor, c.email, iq.nome_inquilino, iq.sexo
	FROM proprietario p
		LEFT JOIN aluguel a
			ON a.proprietario_id = p.id_proprietario
		LEFT JOIN imovel i
			ON a.imovel_id = i.id_imovel
		LEFT JOIN corretor c
			ON a.corretor_id = c.id_corretor
		LEFT JOIN inquilino iq
			ON a.inquilino_id = iq.id_inquilino;

-- LEFT - imovel SEM proprietário ou sem inquilino
SELECT p.nome_proprietario, p.telefone, i.tipo, i.endereco, i.valor_aluguel, c.nome_corretor, c.email, iq.nome_inquilino, iq.sexo
	FROM imovel i
		LEFT JOIN aluguel a	
			ON a.imovel_id = i.id_imovel
		LEFT JOIN proprietario p
			ON a.proprietario_id = p.id_proprietario
		LEFT JOIN corretor c
			ON a.corretor_id = c.id_corretor
		LEFT JOIN inquilino iq
			ON a.inquilino_id = iq.id_inquilino;

-- RIGHT - proprietario SEM imovel
SELECT p.nome_proprietario, p.telefone, i.tipo, i.endereco, i.valor_aluguel, c.nome_corretor, c.email, iq.nome_inquilino, iq.sexo
	FROM aluguel a
		RIGHT JOIN inquilino iq
			ON a.inquilino_id = iq.id_inquilino
		RIGHT JOIN imovel i
			ON a.imovel_id = i.id_imovel
		RIGHT JOIN corretor c
			ON a.corretor_id = c.id_corretor
		RIGHT JOIN proprietario p
			ON a.proprietario_id = p.id_proprietario;

-- RIGHT - imovel SEM proprietário ou sem inquilino
SELECT p.nome_proprietario, p.telefone, i.tipo, i.endereco, i.valor_aluguel, c.nome_corretor, c.email, iq.nome_inquilino, iq.sexo
	FROM aluguel a
		RIGHT JOIN inquilino iq
			ON a.inquilino_id = iq.id_inquilino	
		RIGHT JOIN corretor c
			ON a.corretor_id = c.id_corretor
		RIGHT JOIN proprietario p
			ON a.proprietario_id = p.id_proprietario
		RIGHT JOIN imovel i
			ON a.imovel_id = i.id_imovel;