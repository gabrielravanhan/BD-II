CREATE SCHEMA quitanda_02;

USE quitanda_02;

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

INSERT INTO estado (nome)
	VALUES ('São Paulo'),
	('Minas Gerais');

INSERT INTO cidade (nome, estado_id)
	VALUES ('Lencóis Paulista', 1),
    ('Belo Horizonte', 2);

INSERT INTO cliente (nome, endereco, numero, referencia, cidade_id)
	VALUES ('Sidney', 'Rua do Sid, Avenida do Sid', '401', 'Academia do Sid', 1);

INSERT INTO cliente (nome, endereco, numero, referencia, cidade_id)
	VALUES ('Gabriel', 'Minha Rua, Minha Avenida', '333', 'Minha academia', 2);
    
INSERT INTO fornecedor (nome, cidade_id)
	VALUES ('Cleyton', 2);
    
INSERT INTO fornecedor (nome, cidade_id)
	VALUES ('Roger', 3);

INSERT INTO fornecedor (nome, cidade_id)
	VALUES ('Senhor Madruga', 1);

INSERT INTO tipo_produto (descricao)
	VALUES ('Fruta');

INSERT INTO tipo_produto (descricao)
	VALUES ('Verdura');
    
INSERT INTO produto (nome, tp_produto_id)
	VALUES ('Macã', 1);

INSERT INTO produto (nome, tp_produto_id)
	VALUES ('Banana', 1);
    
INSERT INTO produto (nome, tp_produto_id)
	VALUES ('Alface', 2);

INSERT INTO fornecedor_produto (fornecedor_id, produto_id)
	VALUES (1, 1);

INSERT INTO fornecedor_produto (fornecedor_id, produto_id)
	VALUES (1, 2);

INSERT INTO fornecedor_produto (fornecedor_id, produto_id)
	VALUES (2, 2);

INSERT INTO cidade (nome, estado_id)
	VALUES ('Macatuba', 1);