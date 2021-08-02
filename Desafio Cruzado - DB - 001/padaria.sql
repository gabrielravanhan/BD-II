CREATE DATABASE padaria;

USE padaria;

CREATE TABLE estados (
	id_estado INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(191) NOT NULL,
	sigla CHAR(2)
);

CREATE TABLE cidades (
	id_cidade INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(191) NOT NULL,
	estado_id INT UNSIGNED NOT NULL
);

CREATE TABLE clientes (
	id_cliente INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(191) NOT NULL,
	cpf VARCHAR(12) NOT NULL UNIQUE,
	data_nascimento DATE NOT NULL,
	celular VARCHAR(12),
	sexo CHAR(1) NOT NULL,
	rua VARCHAR(191) NOT NULL,
	numero VARCHAR(6) NOT NULL,
	bairro VARCHAR(191) NOT NULL,
	cidade_id INT UNSIGNED NOT NULL
);

CREATE TABLE fornecedores (
	id_fornecedor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(191) NOT NULL,
	cnpj VARCHAR(14) NOT NULL UNIQUE,
	email VARCHAR(191),
	rua VARCHAR(191) NOT NULL,
	numero VARCHAR(6) NOT NULL,
	bairro VARCHAR(191) NOT NULL,
	cidade_id INT UNSIGNED NOT NULL
);

CREATE TABLE produtos (
	id_produto INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(191) NOT NULL,
	preco DECIMAL(14,2) NOT NULL,
	quantidade DOUBLE,
	unidade VARCHAR(5)
);

CREATE TABLE vendas (
	id_venda INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	cliente_id INT UNSIGNED NOT NULL,
	numero_fiscal INT NOT NULL,
	data_hora_emissao DATETIME NOT NULL
);

CREATE TABLE produtos_vendas (
	id_produto_venda INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	produto_id INT UNSIGNED NOT NULL,
	venda_id INT UNSIGNED NOT NULL
);

CREATE TABLE fornecedores_produtos (
	id_fornecedor_produto INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	fornecedor_id INT UNSIGNED NOT NULL,
	produto_id INT UNSIGNED NOT NULL,
	preco DECIMAL(14,2)
);

ALTER TABLE cidades ADD CONSTRAINT fk_estado_cidade
	FOREIGN KEY (estado_id) REFERENCES estados (id_estado);

ALTER TABLE clientes ADD CONSTRAINT fk_cidade_cliente
	FOREIGN KEY (cidade_id) REFERENCES cidades (id_cidade);

ALTER TABLE fornecedores ADD CONSTRAINT fk_cidade_fornecedor
	FOREIGN KEY (cidade_id) REFERENCES cidades (id_cidade);

ALTER TABLE vendas ADD CONSTRAINT fk_cliente_venda
	FOREIGN KEY (cliente_id) REFERENCES clientes (id_cliente);
    
ALTER TABLE produtos_vendas ADD CONSTRAINT fk_venda_produto_venda
	FOREIGN KEY (venda_id) REFERENCES vendas (id_venda);

ALTER TABLE produtos_vendas ADD CONSTRAINT fk_produto_produto_venda
	FOREIGN KEY (produto_id) REFERENCES produtos (id_produto);

ALTER TABLE fornecedores_produtos ADD CONSTRAINT fk_fornecedor_fornecedor_produto
	FOREIGN KEY (fornecedor_id) REFERENCES fornecedores (id_fornecedor);

ALTER TABLE fornecedores_produtos ADD CONSTRAINT fk_produto_fornecedor_produto
	FOREIGN KEY (produto_id) REFERENCES produtos (id_produto);

INSERT INTO estados (nome, sigla)
	VALUES ('São Paulo', 'SP'),
    ('Rio de Janeiro', 'RJ'),
    ('Minas Gerais', 'MG'),
    ('Bahia', 'BA'),
    ('Acre', 'AC');

INSERT INTO cidades (nome, estado_id)
	VALUES ('Macatuba', 1),
    ('Lençóis Paulista', 1),
    ('Arraial do Cabo', 2),
    ('Belo Horizonte', 3),
    ('Salvador', 4),
    ('Rio Branco', 5);

INSERT INTO clientes (nome, cpf, data_nascimento, celular, sexo, rua, numero, bairro, cidade_id)
	VALUES ('Gabriel', '111111111-11', '2004-11-10', '14 998724956', 'M', 'Equador', '129', 'Santa Rita', 1),
    ('André', '222222222-22', '2005-02-06', '14 999042041', 'M', 'Portugal', '265', 'Jardim Europa', 1),
    ("Luiz D'Avila", '333333333-33', '2004-07-08', '14 998641204', 'M', 'Antonia Foganholli Paccola', '523', 'Maria Luiza II', 2),
    ('Carlos', '444444444-44', '2004-12-19', '14 998166753', 'M', 'Borba Gato', '117', 'Jardim Ubirama', 2),
    ("Rogério Bidu Furlan", '555555555-55', '1968-03-26', '14 969246924', 'M', 'Algoritmo', '69', 'Jardim Arduino', 3),
    ("LF de Andrade", '666666666-66', '1969-05-29', '14 997378118', 'M', 'brModelo', 'A190', 'DFD', 4),
    ("Sid Vieira", '777777777-77', '1969-12-12', '14 998171132', 'M', 'Meus Queridos', '24', 'CorelDRAW', 5),
    ("Tiagão Augusto", '888888888-88', '1999-01-01', '14 998272612', 'M', 'Cogumelos', '000', 'Jardim Fagundes', 6),
    ("Jônatas", '999999999-99', '2004-10-09', '14 997034613', 'M', 'Cogumelos II', 'A1A', 'Jardim Bilu', 6),
    ('Maria Antonia', '101010101-10', '2004-04-13', '14 996099906', 'F', 'Avenida Brasil', '013', 'Centro', 2),
    ('Rainara', '101010101-11', '2004-10-07', '14 996301189', 'F', 'Alfeneros', 'XYZ11', 'Farol da Barra', 4),
    ('Maria Clara', '101010101-12', '2004-03-23', '14 996849611', 'F', 'Chile', '007', 'Jardim Asiático', 4);

INSERT INTO fornecedores (nome, cnpj, email, rua, numero, bairro, cidade_id)
	VALUES ('Kron-IT', '11111111111111', 'kronit@yahoo.com', 'Nelo Lini', '29', 'Jardim Morumbi', 2),
    ('Bidu Bolachas/Biscoitos', '11111111111112', 'bolachas.biscoitos.bidu@hotmail.com', 'Cogumelos III', '2424', 'Jardim Industrial', 5),
    ('Salgadinhos Furlan', '11111111111113', 'furlansalgadinhos@gmail.com', 'São José', '660', 'Jardim Pablo Escobar', 3),
    ('Dolly', '11111111111114', 'dolly@dolly.com', 'Dolly', 'd0ll1', 'Jardim Seu Amiguinho', 1);

INSERT INTO produtos (nome, preco, quantidade, unidade)
    VALUES ('Pão de Forma Careca', 7.50, 350, 'g'),
	('Biscoito de Polvilho Rogérinho', 4.70 , 400 , 'g'),
	('Bolacha Zenatti', 4.50, 200, 'g'),
	('Bolo de Cenoura', 7.99, 350, 'g'),
	('Mortadela Do Povo', 2.50, 100, 'g'),
	('Salgadinho Furlan', 3.50, 300, 'g'),
	('Manteiga Da Vila', 5.50, 300, 'g'),
	('Refrigerante Dolly Guaraná', 6.00, 2, 'L');

INSERT INTO fornecedores_produtos (fornecedor_id, produto_id, preco)
	VALUES (1, 7, 2.00),
    (1, 1, 1.50),
    (1, 4, 3.50),
    (2, 2, 2.50),
    (2, 3, 2.00),
    (1, 5, 0.50),
    (3, 6, 0.25),
    (4, 8, 3.00);

INSERT INTO vendas (cliente_id, numero_fiscal, data_hora_emissao)
	VALUES (1, 111, '2021-04-13 08:32:21'),
    (2, 222, '2020-07-08 12:00:00'),
    (3, 333, '2021-06-15 14:37:23'),
    (4, 444, '2018-06-12 13:01:01'),
    (9, 995, '2020-11-10 07:45:07'),
    (10, 106, '2021-01-07 09:17:13'),
    (11, 117, '2016-01-01 05:30:42'),
    (12, 128, '2017-12-03 19:58:59');

INSERT INTO produtos_vendas (produto_id, venda_id)
	VALUES (2, 1),
    (8, 1),
    (3, 1),
    (1, 2),
    (5, 2),
    (4, 3),
    (8, 3),
    (1, 4),
    (7, 4),
    (6, 5),
    (8, 6),
    (8, 6),
    (2, 7),
    (8, 8),
    (5, 8),
    (1, 8);