-- CRIAÇÃO PARA REPLICAÇÃO--
CREATE DATABASE loja01;

USE loja01;

CREATE TABLE instrumentos (
	id_instrumento INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL
);

CREATE DATABASE loja02;

USE loja02;

CREATE TABLE instrumentos (
	id_instrumento INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL
);

-- REPLICAÇÃO --
INSERT INTO loja01.instrumentos (nome)
	VALUES ('Guitarra');

INSERT INTO loja01.instrumentos (nome)
	VALUES ('Baixo');

INSERT INTO loja01.instrumentos (nome)
	VALUES ('Bateria');

INSERT INTO loja02.instrumentos (nome)
	VALUES ('Guitarra');

INSERT INTO loja02.instrumentos (nome)
	VALUES ('Baixo');

INSERT INTO loja02.instrumentos (nome)
	VALUES ('Bateria');

-- CRIAÇÃO PARA FRAGMENTAÇÃO--
CREATE DATABASE bandas01;

USE bandas01;

CREATE TABLE bandas_hard_rock (
	id_banda INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL
);

CREATE TABLE bandas_heavy_metal (
	id_banda INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL
);

CREATE DATABASE bandas02;

USE bandas02;

CREATE TABLE bandas_hard_rock (
	id_banda INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL
);

CREATE TABLE bandas_heavy_metal (
	id_banda INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL
);

-- FRAGMENTAÇÃO --
INSERT INTO bandas01.bandas_hard_rock (nome)
	VALUES ('Guns N Roses');

INSERT INTO bandas01.bandas_hard_rock (nome)
	VALUES ('AC/DC');

INSERT INTO bandas01.bandas_hard_rock (nome)
	VALUES ('Led Zeppelin');

INSERT INTO bandas02.bandas_heavy_metal (nome)
	VALUES ('Metallica');

INSERT INTO bandas02.bandas_heavy_metal (nome)
	VALUES ('Iron Maiden');

INSERT INTO bandas02.bandas_heavy_metal (nome)
	VALUES ('Megadeth');

INSERT INTO bandas02.bandas_hard_rock (nome)
	VALUES ('Guns N Roses');

INSERT INTO bandas02.bandas_hard_rock (nome)
	VALUES ('AC/DC');

INSERT INTO bandas02.bandas_hard_rock (nome)
	VALUES ('Led Zeppelin');

INSERT INTO bandas01.bandas_heavy_metal (nome)
	VALUES ('Metallica');

INSERT INTO bandas01.bandas_heavy_metal (nome)
	VALUES ('Iron Maiden');

INSERT INTO bandas01.bandas_heavy_metal (nome)
	VALUES ('Megadeth');