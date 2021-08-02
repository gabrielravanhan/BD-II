CREATE DATABASE receitas_bolos;

USE receitas_bolos;

CREATE TABLE ingredientes(
	id_ingrediente INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL
);

CREATE TABLE receitas(
	id_receita INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_receita VARCHAR(100) NOT NULL,
	modo_preparo VARCHAR(255) NOT NULL
);

CREATE TABLE ingredientes_receitas(
	id_ingrediente_receita INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    quantidade INT UNSIGNED NOT NULL,
    unidade VARCHAR(10),
    ingrediente_id INT UNSIGNED NOT NULL,
    receita_id INT UNSIGNED NOT NULL
);

ALTER TABLE ingredientes_receitas ADD CONSTRAINT fk_ingrediente
	FOREIGN KEY (ingrediente_id) REFERENCES ingredientes (id_ingrediente);

ALTER TABLE ingredientes_receitas ADD CONSTRAINT fk_receita
	FOREIGN KEY (receita_id) REFERENCES receitas (id_receita);
    
INSERT INTO ingredientes (nome) 
	VALUES ('Farinha'),
	('Ovo'),
    ('Fermento'),
    ('Água'),
    ('Óleo'),
    ('Fubá');

INSERT INTO receitas (nome_receita, modo_preparo)
	VALUES ('Fubá', 'Misture tudo, coloque na batedeira, leve ao forno por 30 minus à 180o. e tudo ficará muito gostoso');

INSERT INTO ingredientes_receitas (quantidade, unidade, ingrediente_id, receita_id)
	VALUES (250, 'ml', 1, 1),
    (3, NULL, 2, 1),
    (1, 'Colher', 3, 1),
    (300, 'ml', 4, 1),
    (150, 'ml', 5, 1),
    (2, 'ml', 6, 1);