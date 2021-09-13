CREATE SCHEMA ifood;

USE ifood;

CREATE TABLE clientes (
	id_cliente INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cliente VARCHAR (191) NOT NULL,
    email VARCHAR (191),
    fone VARCHAR (191)
);

CREATE TABLE entregadores (
	id_entregador INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    entregador VARCHAR (191) NOT NULL,
    fone VARCHAR (191),
    placa_moto VARCHAR (191)
);

CREATE TABLE comida (
	id_comida INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    comida VARCHAR (191) NOT NULL,
    preco DOUBLE (14, 2)
);

CREATE TABLE pedido (
	id_pedido INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE NOT NULL,
    local_entrega VARCHAR (191) NOT NULL,
    cliente_id INT UNSIGNED NOT NULL,
    entregador_id INT UNSIGNED NOT NULL,
    comida_id INT UNSIGNED NOT NULL
);

INSERT INTO clientes (cliente, email, fone)
	VALUES
		('Val', 'val@val', '997267983'),
        ('Maria Antonia', 'tunica@gmail.com', '996099906');

INSERT INTO entregadores (entregador, fone, placa_moto)
	VALUES
		('Marcão', '9969696924', '0000000'),
        ('Guto', '9364242424', '242424'),
        ('Robertinho', '123456789', '696969');

INSERT INTO comida (comida, preco)
	VALUES
		('Lasanha', 15.00),
        ('Pizza', 20.00),
        ('Sorvete Blue Ice', 10.00);

INSERT INTO pedido (data_pedido, local_entrega, cliente_id, entregador_id, comida_id)
	VALUES
		('2004-11-10', 'Casa do Val', 1, 1, 1),
        ('2005-02-06', 'Casa do Val', 1, 2, 2),
        ('2021-04-13', 'Casa da Tunica', 2, 2, 3),
        ('2021-08-21', 'Casa da Tunica', 2, 3, 3);

INSERT INTO comida (comida, preco)
	VALUES
		('Miojo', 1.00)