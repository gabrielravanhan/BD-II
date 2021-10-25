CREATE SCHEMA imobiliaria;

USE imobiliaria;
 
CREATE TABLE proprietario (
    id_proprietario INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_proprietario VARCHAR(191) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(12) NOT NULL,
    email VARCHAR(191) NOT NULL
);

CREATE TABLE imovel (
	id_imovel INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    proprietario_id INT UNSIGNED NOT NULL,
	valor_aluguel DECIMAL(14, 2) UNSIGNED NOT NULL,
    tipo VARCHAR(191) NOT NULL,
    endereco VARCHAR(191) NOT NULL,
    descricao VARCHAR(191) NOT NULL
);

CREATE TABLE corretor (
	id_corretor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_corretor VARCHAR(191) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(12) NOT NULL,
    email VARCHAR(191) NOT NULL
);

CREATE TABLE inquilino (
	id_inquilino INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_inquilino VARCHAR(191) NOT NULL,
    fiador VARCHAR(191) NOT NULL,
    sexo CHAR(1) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(12) NOT NULL
);

CREATE TABLE aluguel (
	id_aluguel INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    proprietario_id INT UNSIGNED NOT NULL,
    imovel_id INT UNSIGNED NOT NULL,
    corretor_id INT UNSIGNED NOT NULL,
    inquilino_id INT UNSIGNED NOT NULL,
    data_inicio DATE NOT NULL,
    data_termino DATE NOT NULL
);

ALTER TABLE imovel ADD CONSTRAINT fk_proprietario_imovel  FOREIGN KEY (proprietario_id) REFERENCES proprietario (id_proprietario);

ALTER TABLE aluguel ADD CONSTRAINT fk_proprietario_aluguel FOREIGN KEY (proprietario_id) REFERENCES proprietario (id_proprietario);

ALTER TABLE aluguel ADD CONSTRAINT fk_imovel_aluguel FOREIGN KEY (imovel_id) REFERENCES imovel (id_imovel);

ALTER TABLE aluguel ADD CONSTRAINT fk_corretor_aluguel FOREIGN KEY (corretor_id) REFERENCES corretor (id_corretor);

ALTER TABLE aluguel ADD CONSTRAINT fk_inquilino_aluguel FOREIGN KEY (inquilino_id) REFERENCES inquilino (id_inquilino);

INSERT INTO proprietario (nome_proprietario, cpf, telefone, email)
	VALUES 
		('Bidu', '111.111.111-11', '14 997060567', 'rogerio.furlan4@etec.sp.gov.br'),
		('LF', '222.222.222-22', '14 997378118', 'luiz.andrade30@etec.sp.gov.br'),
        ('Ronan', '333.333.333-33', '14 981575657', 'ronan.zenatti@etec.sp.gov.br'),
        ('Tiagão', '444.444.444-44', '14 998272612', 'tiago.vieira20@etec.sp.gov.br'),
        ('Doni', '555.555.555-55', '14 997890660', 'jose.cornachin3@etec.sp.gov.br');
        
INSERT INTO imovel (proprietario_id, valor_aluguel, tipo, endereco, descricao)
	VALUES
		(1, 1000000.00, 'Palácio', 'Rua do Bidu', 'Legal'),
        (2, 9999999.99, 'Casa', 'Recanto dos Carecas', 'Incrível'),
        (3, 1100.00, 'Apartamento', 'Replit','SOS'),
        (4, 8000000.00, 'Bunker', "Tiago's Village", 'Nota 2'),
        (5, 10.00, 'Chácara', 'Zona Franca', 'DONI IS THE BEST');

INSERT INTO corretor (nome_corretor, cpf, telefone, email)
	VALUES 
    ('Sid', '101.010.101-01', '14 969696969', 'sidney.silva25@etec.sp.gov.br'),
    ('Diegão', '121.212.121-21', '14 924242424', 'diego.eiras01@etec.sp.gov.br'),
    ('Marcão', '131.313.131-31', '14 924692469', 'marco.antunes@etec.sp.gov.br'),
    ('Roque', '141.414.141-41', '14 969424269', 'roque.maitino@etec.sp.gov.br '),
    ('Joca', '151.515.151-51', '14 912345678', 'joao.angelico@etec.sp.gov.br');

INSERT INTO inquilino (nome_inquilino, sexo, data_nascimento, telefone, fiador)
	VALUES 
    ('Gabriel', 'M', '2004-11-10', '14 998724956', 'Chorão'),
    ('Tunica', 'F', '2004-04-13', '14 996099906', 'Simone'),
    ('Bilu', 'M', '2004-10-09', '14 997034613', 'Léo do Mercadinho'),
    ('André', 'M', '2005-02-06', '14 999042041', 'Robertinho'),
    ('Davila', 'M', '2004-07-08', '14 998641204', 'Irmão dele');

INSERT INTO aluguel (proprietario_id, imovel_id, corretor_id, inquilino_id, data_inicio, data_termino)
	VALUES
    (1, 1, 1, 1, '2021-04-13', '2021-12-31'),
    (2, 2, 2, 2, '2020-11-10', '2021-12-30'),
    (3, 3, 3, 3, '1999-05-01', '2021-11-10'),
    (4, 4, 4, 4, '1969-12-24', '2022-02-01'),
    (5, 5, 5, 5, '2001-01-01', '2024-07-08');