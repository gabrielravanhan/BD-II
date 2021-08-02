CREATE DATABASE revisao DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE revisao;

CREATE TABLE bolos(
	id_bolo INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_bolo VARCHAR(191)
);

CREATE TABLE receitas(
	id_receita INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    bolo_id INT UNSIGNED NOT NULL,
    receita TEXT
);

CREATE TABLE ingredientes(
	id_ingrediente INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_ingrediente TEXT,
    receita_id INT UNSIGNED NOT NULL
);

ALTER TABLE receitas ADD CONSTRAINT fk_bolo FOREIGN KEY (bolo_id) REFERENCES bolos (id_bolo);

ALTER TABLE ingredientes ADD CONSTRAINT fk_receita FOREIGN KEY (receita_id) REFERENCES receitas (id_receita);

INSERT INTO bolos(nome_bolo)
	VALUES('Bolo de cenoura');

INSERT INTO receitas(bolo_id, receita)
	VALUES(1, 'Em um liquidificador, adicione a cenoura, os ovos e o óleo, depois misture.
Acrescente o açúcar e bata novamente por 5 minutos.
Em uma tigela ou na batedeira, adicione a farinha de trigo e depois misture novamente.
Acrescente o fermento e misture lentamente com uma colher.
Asse em um forno preaquecido a 180° C por aproximadamente 40 minutos.
Despeje em uma tigela a manteiga, o chocolate em pó, o açúcar e o leite, depois misture.
Leve a mistura ao fogo e continue misturando até obter uma consistência cremosa, depois despeje a calda por cima do bolo.');

INSERT INTO ingredientes(nome_ingrediente, receita_id)
	VALUES('1/2 xícara (chá) de óleo. 3 cenouras médias raladas.
4 ovos.
2 xícaras (chá) de açúcar.
2 e 1/2 xícaras (chá) de farinha de trigo.
1 colher (sopa) de fermento em pó.
1 colher (sopa) de manteiga.
3 colheres (sopa) de chocolate em pó.
1 xícara (chá) de açúcar.
1 xícara (chá) de leite.', 1);