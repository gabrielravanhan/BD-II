-- 1) Nesta Consulta você devera selecionar os produtos que contém valores acima de R$ 10 e o tipo da loja, 
-- com o campo nome da loja em ordem decrecente. 
-- O resultado da consulta deverá conter os campos: "nome_lojas","nome_produto","tipo_loja","preco";
select lj.nome as nome_lojas, prd.nome_produto, tplj.descricao_loja as tipo_loja, ljp.preco
from loja lj
inner join loja_produto ljp on lj.id_loja = ljp.id_loja
inner join produto prd on ljp.id_produto = prd.id_produto
inner join tipo_loja tplj on ljp.id_tipo_loja = tplj.id_tipo_loja
where ljp.preco > 10
order by 1 desc;

-- 2) Monte uma consulta somente das lojas de “fast-- food” do primeiro(1°) andar do shopping em ordem alfabética.
-- O resultado da consulta deverá conter os campos: “ID” "nome_Loja", "tipo_loja", “Produto” e o "piso"
select lj.id_loja as ID, lj.nome as nome_loja, tplj.descricao_loja as tipo_loja, prd.nome_produto as Produto, lj.piso
from loja lj
inner join loja_produto ljp on lj.id_loja = ljp.id_loja
inner join produto prd on ljp.id_produto = prd.id_produto
inner join tipo_loja tplj on ljp.id_tipo_loja = tplj.id_tipo_loja
where tplj.descricao_loja = "fast-food" and lj.piso = 1;

-- 3) Consultar lojas onde o produto com precos acima de 20 e 3 peças em estoque, que sejam de lojas do tipo vestuário. 
-- O resultado da consulta deverá conter os campos: "nome_loja", "tipo_loja", "piso_loja", "produto", "cor", "tamanho" , 
-- "preco", "qtde_produto"
select lj.nome as nome_loja, tplj.descricao_loja as tipo_loja, prd.nome_produto as produto, lj.piso,
		cor.descricao_cor as cor, tam.descricao_tamanho as tamanho, ljp.preco, count(ljp.id_produto) as qtde_produto
from loja lj
inner join loja_produto ljp on lj.id_loja = ljp.id_loja
inner join produto prd on ljp.id_produto = prd.id_produto
inner join tipo_loja tplj on ljp.id_tipo_loja = tplj.id_tipo_loja
inner join cor on ljp.id_cor = cor.id_cor
inner join tamanho tam on ljp.id_tamanho = tam.id_tamanho
where ljp.preco > 20 
group by lj.nome, ljp.id_produto
having count(ljp.id_produto)>3;


-- 4) Monte uma consulta que retorne o produto tenis, e lojas que contenham no nome a letra N, 
-- O resultado da consulta deverá conter os campos: "nome_loja", "nome_produto", "tipo_loja", "desricao_tamanho" e "preco" 
select lj.nome as nome_loja, prd.nome_produto, tam.descricao_tamanho as tamanho, ljp.preco
from loja lj
inner join loja_produto ljp on lj.id_loja = ljp.id_loja
inner join produto prd on ljp.id_produto = prd.id_produto
inner join tipo_loja tplj on ljp.id_tipo_loja = tplj.id_tipo_loja
inner join cor on ljp.id_cor = cor.id_cor
inner join tamanho tam on ljp.id_tamanho = tam.id_tamanho
where upper(trim(prd.nome_produto)) like "%TENIS%"
	and upper(lj.nome) like "%N%"
