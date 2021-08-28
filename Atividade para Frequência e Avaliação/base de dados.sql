CREATE SCHEMA atividade_frequencia_mencao;

USE atividade_frequencia_mencao;

CREATE TABLE medicos (
	id_medico INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(40) NOT NULL,
	fone varchar(20) NULL,
	email varchar(40) NULL,
	dtnasc DATE NOT NULL,
	salario DECIMAL(7, 2) NOT NULL
);

INSERT INTO medicos (nome, fone, email, dtnasc, salario)
	VALUES ('Getulina', NULL, NULL, '2000-06-30', 1200);

INSERT INTO medicos (nome, fone, email, dtnasc, salario)
	VALUES ('Geovalda','3262-8890',NULL,'2000-02-01', 1900);
    
INSERT INTO medicos (nome, fone, email, dtnasc, salario)
	VALUES ('Graça','99798-1234','graça@uol.com.br','1990-12-10', 5200);
    
INSERT INTO medicos (nome, fone, email, dtnasc, salario)
	VALUES ('Natalina', '3261-1234', NULL, '2019-10-31',1990);
    
INSERT INTO medicos (nome, fone, email, dtnasc, salario)
	VALUES ('Uvina', '99988-1234', 'uvina@uol.com.br', '1995-11-03', 900);
    
INSERT INTO medicos (nome, fone, email, dtnasc, salario)
	VALUES ('Rosalina', '97878-8787', 'rosa@uol.com.br', '1989-11-03', 9000);

INSERT INTO medicos (nome, fone, email, dtnasc, salario)
	VALUES ('Valdir', '9984-8766', 'val@uol.com.br', '1960-12-04', 15000);

INSERT INTO medicos (nome, fone, email, dtnasc, salario)
	VALUES ('Osmar', '9966-2469', 'osmar@uol.com.br', '1969-06-09', 6999);