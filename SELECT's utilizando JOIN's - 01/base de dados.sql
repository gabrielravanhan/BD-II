CREATE SCHEMA quitanda;

USE quitanda;

CREATE TABLE estado (
    id_estado INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150)
);

CREATE TABLE cidade (
	id_cidade INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150),
    estado_id INT UNSIGNED NOT NULL
);

CREATE TABLE cliente (
	id_cilente INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150),
    data_nascimento DATE,
    endereco VARCHAR(250),
    numero VARCHAR(5),
    referencia VARCHAR(50),
	cidade_id INT UNSIGNED NOT NULL
);

CREATE TABLE fornecedor (
	id_fornecedor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150),
	cidade_id INT UNSIGNED NOT NULL
);

CREATE TABLE produto (
	id_produto INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150),
    tp_produto_id INT UNSIGNED NOT NULL
);

CREATE TABLE tipo_produto (
	id_tp_produto INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(150)
);

CREATE TABLE fornecedor_produto (
	id_fornecedor_produto INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fornecedor_id INT,
    produto_id INT UNSIGNED NOT NULL
);

INSERT INTO quitanda.estado (nome)
	VALUES ('São Paulo'),
	('Minas Gerais');

INSERT INTO quitanda.cidade (nome, estado_id)
	VALUES ('Lencóis Paulista', 1),
    ('Belo Horizonte', 2);

INSERT INTO quitanda.cliente (nome, endereco, numero, referencia, cidade_id)
	VALUES ('Sidney', 'Rua do Sid, Avenida do Sid', '401', 'Academia do Sid', 1);

INSERT INTO quitanda.cliente (nome, endereco, numero, referencia, cidade_id)
	VALUES ('Gabriel', 'Minha Rua, Minha Avenida', '333', 'Minha academia', 2);
    
INSERT INTO quitanda.fornecedor (nome, cidade_id)
	VALUES ('Cleyton', 2);

INSERT INTO quitanda.fornecedor (nome, cidade_id)
	VALUES ('Senhor Madruga', 1);

INSERT INTO quitanda.tipo_produto (descricao)
	VALUES ('Fruta');

INSERT INTO quitanda.tipo_produto (descricao)
	VALUES ('Verdura');
    
INSERT INTO quitanda.produto (nome, tp_produto_id)
	VALUES ('Macã', 1);

INSERT INTO quitanda.produto (nome, tp_produto_id)
	VALUES ('Banana', 1);
    
INSERT INTO quitanda.produto (nome, tp_produto_id)
	VALUES ('Alface', 2);

INSERT INTO quitanda.fornecedor_produto (fornecedor_id, produto_id)
	VALUES (1, 1);

INSERT INTO quitanda.fornecedor_produto (fornecedor_id, produto_id)
	VALUES (1, 2);

INSERT INTO quitanda.fornecedor_produto (fornecedor_id, produto_id)
	VALUES (2, 2);
    
create table compras (
id_compras int unsigned not null primary key auto_increment,
produto_id int,
fornecedor_id int,
valor_total double,
quantidade double,
data_solicitacao date,
data_prevista_entrega date,
data_recebimento date
);
alter table produto add column prazo_validade int;

insert compras (produto_id, fornecedor_id, quantidade, valor_total, data_solicitacao, data_prevista_entrega)
values (1,1,500, 500, "2021-05-19","2021-05-21");

insert compras (produto_id, fornecedor_id, quantidade, valor_total, data_solicitacao, data_prevista_entrega)
values (2,1,300, 300, "2021-05-19","2021-05-19");

CREATE VIEW vw_cliente_endereco AS
SELECT cli.id_cilente, cli.nome AS nome, cli.endereco, cli.numero AS n_endereco, cid.nome AS cidade, est.nome AS estado
	FROM cliente cli
	INNER JOIN cidade cid 
		ON cli.cidade_id = cid.id_cidade
	INNER JOIN estado est 
		ON cid.estado_id = est.id_estado;

select * from vw_cliente_endereco;

CREATE TABLE tap_cliente AS SELECT * FROM cliente;

CREATE VIEW vw_produto_fornecedor AS
SELECT prod.nome AS produto, forn_prod.preco_aquisicao, forn.nome AS forncedor
    FROM produto prod
    INNER JOIN fornecedor_produto forn_prod
		ON prod.id_produto = forn_prod.produto_id
	INNER JOIN fornecedor forn
		ON forn_prod.fornecedor_id = forn.id_fornecedor;

select * from vw_produto_fornecedor;