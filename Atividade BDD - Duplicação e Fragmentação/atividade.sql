-- CRIAÇÃO PARA REPLICAÇÃO--
CREATE DATABASE hard_rock01;

USE hard_rock01;

CREATE TABLE bandas (
	id_banda INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL
);

CREATE DATABASE hard_rock02;

USE hard_rock02;

CREATE TABLE bandas (
	id_banda INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL
);

-- REPLICAÇÃO --
INSERT INTO hard_rock01.bandas (nome)
	VALUES ('Aerosmith');

INSERT INTO hard_rock01.bandas (nome)
	VALUES ('Bon Jovi');

INSERT INTO hard_rock02.bandas (nome)
	VALUES ('Aerosmith');

INSERT INTO hard_rock02.bandas (nome)
	VALUES ('Bon Jovi');

-- CRIAÇÃO PARA FRAGMENTAÇÃO--
CREATE DATABASE heavy_metalaj;

USE heavy_metalaj;

CREATE TABLE bandas (
	id_banda INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL
);

CREATE DATABASE heavy_metalkz;

USE heavy_metalkz;

CREATE TABLE bandas (
	id_banda INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL
);

-- FRAGMENTAÇÃO --
INSERT INTO heavy_metalaj.bandas (nome)
	VALUES ('Guns N Roses');

INSERT INTO heavy_metalaj.bandas (nome)
	VALUES ('AC/DC');

INSERT INTO heavy_metalkz.bandas (nome)
	VALUES ('Led Zeppelin');

INSERT INTO heavy_metalkz.bandas (nome)
	VALUES ('Metallica');