create schema restaurante;

use restaurante;

create table cidade(
	id_cidade int unsigned not null auto_increment primary key,
	nome_cidade varchar(250)
);

create table funcionario (
	id_funcionario int unsigned not null auto_increment primary key,
	nome varchar (150),
	CPF int,
	cargo varchar (250),
	celular int,
	endereco varchar (250),
	data_nascimento date,
	cidade_id int not null
);

create table fornecedor (
	id_fornecedor int unsigned not null auto_increment primary key,
	nome varchar(150),
	produto_fornecido varchar(150),
	cidade_id int not null
);

create table cliente (
	id_cliente int unsigned not null auto_increment primary key,
	nome varchar(150),
	data_nascimento date,
	email varchar(250),
	endereco varchar(250),
	numero varchar(5),
	cidade_id int not null
);

create table estoque (
	id_estoque int unsigned not null auto_increment primary key,
	tipo_alimento varchar(250),
	quantidade decimal (5,2),
	unidade varchar(50)
);

create table cardapio (
	id_prato int unsigned not null auto_increment primary key,
	nome varchar(250),
	descricao_prato varchar(250),
	valor double
);

create table pedido (
	id_pedido int unsigned not null auto_increment primary key,
	cliente_id int not null,
	n_mesa int, 
	prato_id int,
	horario_entrada datetime,
	horario_saida datetime 
);

create table caixa (  
	id_caixa int unsigned not null auto_increment primary key,
	pagamento_cliente double,
	troco double,
	pedido_id int not null
);

INSERT INTO cidade (nome_cidade)
	VALUES ('Macatuba'),
    ('Lençóis Paulista'),
    ('Bauru'),
    ('Botucatu');

INSERT INTO funcionario (nome, CPF, cargo, celular, endereco, data_nascimento, cidade_id)
	VALUES ('Carlos', 1111, 'Gerente', 111, 'Jardim Carlinhos', '2004-12-19', 1),
    ('Carlos 2', 1112, 'Gerente', 112, 'Jardim Carlinhos', '2004-12-19', 1),
    ('Teco-Teco', 2222, 'Garçom', 221, 'Pego Na Rabeira', '1800-03-01', 2),
    ('Teco-Teco 2', 2223, 'Garçom', 222, 'Pego Na Rabeira', '1800-03-01', 2),
    ('Rogér Rogério', 3333, 'Faxineiro', 331, 'Avenida Rogérinha', '1969-03-26', 3),
    ('Rogér Rogério 2', 3334, 'Faxineiro', 332, 'Avenida Rogérinha', '1969-03-26', 3),
    ('Robson', 4444, 'Caixa', 551, 'Jardim Robson', '2000-01-01', 4),
    ('Robson 2', 4445, 'Caixa', 552, 'Jardim Robson', '2000-01-01', 4);

INSERT INTO fornecedor (nome, produto_fornecido, cidade_id)
	VALUES ('Sidney', 'Presunto', 1),
    ('Ro Furlan', 'Hamburguer', 1),
    ('T. Augusto', 'Champignon', 2),
    ('Reginaldo', 'Cerveja', 2),
    ('Jônatas Bilu', 'Macarrão', 3),
    ('Tunica', 'Refrigerante', 3),
    ('Ronaldinho', 'Picanha', 4),
    ('Régis', 'Costela', 4);

INSERT INTO cliente (nome, data_nascimento, email, endereco, numero, cidade_id)
	VALUES ('Gabriel', '2004-11-10', 'gabrielraiavan@gmail.com', 'Minha Casa', '1', 4),
    ('Davila', '2015-07-08', 'davila@gmail.com', 'Casa do Davila', '2', 4),
    ('André', '2005-02-06', 'andre@gmail.com', 'Casa do André', '3', 3),
    ('Bibi', '2000-02-06', 'bibi@gmail.com', 'Casa do Bibi', '4', 3),
    ('LF', '2021-06-22', 'lf@gmail.com', 'Casa do LF', '5', 2),
    ('Dur', '1999-01-22', 'dur@gmail.com', 'Casa do Dur', '6', 2),
    ('Dida', '1069-07-17', 'didinha@gmail.com', 'Casa de Reabilitação', '7', 1),
    ('Cássio', '1900-12-31', 'cassiao@gmail.com', 'Bidu Palace', '8', 1);

INSERT INTO estoque (tipo_alimento, quantidade, unidade)
	VALUES ('Laticinio', 1.5, 'g'),
	('Frutas', 3.9, 'kg'),
	('Açúcares', 6.5, 'g');

INSERT INTO cardapio (nome, descricao_prato, valor)
	VALUES ('Lasanha', 'Lasanha gostosa', 10.00),
    ('Pizza de ovo', 'Ovos diretamente da granja', 9.00),
    ('Panqueca', 'Panqueca da boa', 8.00),
    ('Escondidinho de frango', 'Belos frangos', 7.00);

INSERT INTO pedido (cliente_id, n_mesa, prato_id, horario_entrada, horario_saida)
	VALUES (1, 1, 1, '2021-04-13 08:32:21', '2021-04-13 08:33:21'),
    (2, 2, 2, '2021-04-13 08:32:21', '2021-04-13 08:33:21'),
    (3, 3, 3, '2021-04-13 08:32:21', '2021-04-13 08:33:21'),
    (4, 4, 4, '2021-04-13 08:32:21', '2021-04-13 08:33:21'),
    (5, 5, 1, '2021-04-13 08:32:21', '2021-04-13 08:33:21'),
    (6, 6, 2, '2021-04-13 08:32:21', '2021-04-13 08:33:21'),
    (7, 7, 3, '2021-04-13 08:32:21', '2021-04-13 08:33:21'),
    (8, 8, 4, '2021-04-13 08:32:21', '2021-04-13 08:33:21');

INSERT INTO caixa (pagamento_cliente, troco, pedido_id)
	VALUES (50.00, 40.00, 1),
    (10.00, 01.00, 2),
    (12.00, 04.00, 3),
    (15.00, 08.00, 4),
    (10.00, 00.00, 5),
    (17.00, 08.00, 6),
    (13.00, 05.00, 7),
    (11.00, 04.00, 8);