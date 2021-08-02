create schema receita_bolo_nova;

use receita_bolo_nova;

create table ingrediente (
    id_ingrediente int unsigned not null primary key auto_increment,
    nome varchar(150)
);

create table receita (
    id_receita int unsigned not null primary key auto_increment,
    nome_receita varchar(150),
    modo_preparo varchar(250)
);

create table ingrediente_receita (
    id_ingrediente_receita  int unsigned not null primary key auto_increment,
    receita_id int unsigned not null,
    ingrediente_id int unsigned not null,
    quantia int not null,
    unidade varchar(10) 
);

alter table ingrediente_receita add constraint fk_ingrediente_receita_receita foreign key (receita_id) references receita (id_receita);
alter table ingrediente_receita add constraint fk_ingrediente_receita_ingrediente foreign key (ingrediente_id) references ingrediente (id_ingrediente);

INSERT INTO ingrediente (nome) 
	VALUES ('Farinha'),
	('Ovo'),
    ('Fermento'),
    ('Água'),
    ('Óleo'),
    ('Fubá');

INSERT INTO receita (nome_receita, modo_preparo)
	VALUES ('Fubá', 'Misture tudo, coloque na batedeira, leve ao forno por 30 minus à 180o. e tudo ficará muito gostoso');

INSERT INTO ingrediente_receita (quantia, unidade, ingrediente_id, receita_id)
	VALUES (250, 'ml', 1, 1),
    (3, NULL, 2, 1),
    (1, 'Colher', 3, 1),
    (300, 'ml', 4, 1),
    (150, 'ml', 5, 1),
    (2, 'ml', 6, 1);

select rc.nome_receita, rc.modo_preparo, rc.obs,ing01.nome as ingrediente_01, rc.quantia_01, rc.unidade_01,
            ing02.nome as ingrediente_02, rc.quantia_02, rc.unidade_02,
            ing03.nome as ingrediente_03, rc.quantia_03, rc.unidade_03,
            ing04.nome as ingrediente_04, rc.quantia_04, rc.unidade_04,
            ing05.nome as ingrediente_05, rc.quantia_05, rc.unidade_05
from receita_bolo.receita rc,
    receita_bolo.ingrediente ing01, receita_bolo.ingrediente ing02, receita_bolo.ingrediente ing03,
    receita_bolo.ingrediente ing04, receita_bolo.ingrediente ing05
where rc.ingrediente_id_01 = ing01.id_ingrediente
    and    rc.ingrediente_id_02 = ing02.id_ingrediente
    and    rc.ingrediente_id_03 = ing03.id_ingrediente
    and    rc.ingrediente_id_04 = ing04.id_ingrediente
    and    rc.ingrediente_id_05 = ing05.id_ingrediente;