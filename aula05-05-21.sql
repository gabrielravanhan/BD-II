create schema agrupar;

use agrupar;

create table cliente (
	id_cliente int unsigned not null primary key auto_increment,
    nome varchar(250),
    contato varchar(150),
    endereco varchar(250),
    cidade  varchar(100),
    codigo_postal  varchar(10),
    pais varchar(80)
);

insert into cliente (nome, contato, endereco, cidade, codigo_postal, pais) values ('Alfreds Futterkiste','Maria Anders','Obere Str. 57','Berlin','12209','Germany');
insert into cliente (nome, contato, endereco, cidade, codigo_postal, pais) values ('Ana Trujillo Emparedados y helados','Ana Trujillo','Avda. de la Constitución 2222','México D.F.','5021','Mexico');
insert into cliente (nome, contato, endereco, cidade, codigo_postal, pais) values ('Antonio Moreno Taquería','Antonio Moreno','Mataderos 2312','México D.F.','5023','Mexico');
insert into cliente (nome, contato, endereco, cidade, codigo_postal, pais) values ('Around the Horn','Thomas Hardy','120 Hanover Sq.','London','WA1 1DP','UK');
insert into cliente (nome, contato, endereco, cidade, codigo_postal, pais) values ('Berglunds snabbköp','Christina Berglund','Berguvsvägen 8','Luleå','S-958 22','Sweden');
insert into cliente (nome, contato, endereco, cidade, codigo_postal, pais) values ('Joaquim da Silva Xavier','Dom Pedro I','Alameda dos enforcados','Salvador','85942','Brasil');
insert into cliente (nome, contato, endereco, cidade, codigo_postal, pais) values ('Pele','Xuxa','Rua dos Santos, 321','Santos','05715','Brasil');
insert into cliente (nome, contato, endereco, cidade, codigo_postal, pais) values ('Roberto Dinamite','João','Avenida Botafogo, 576','Rio de Janeiro','21906','Brasil');

-- GROUP BY
-- HAVING
-- FUNÇÕES DE AGREGAÇÃO - count(), sum(), avg()
-- ORDENAÇÃO DE DADOS - ORDER BY
-- MIN(), MAX()	

SELECT pais,
	COUNT(id_cliente) AS contador_id_cliente, -- contador
	SUM(id_cliente) AS soma_id_cliente, -- soma
	AVG(id_cliente) AS media_id_cliente, -- média
	MIN(id_cliente) AS min_id_cliente, -- minimo
	MAX(id_cliente) AS max_id_cliente -- máximo
FROM agrupar.cliente
GROUP BY pais
ORDER BY 2 DESC;

SELECT pais,
	COUNT(id_cliente) AS contador_id_cliente -- contador
FROM agrupar.cliente
-- WHERE pais = 'Brasl';
GROUP BY pais
HAVING COUNT(id_cliente) > 1
ORDER BY 2 DESC;