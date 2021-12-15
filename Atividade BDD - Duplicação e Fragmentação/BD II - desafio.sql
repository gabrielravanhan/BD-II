create database bancoaz;
use bancoaz;

create table clienteaz(
idcli	int,
cliente varchar(30)
);

insert into clienteaz values (1,'Marco');
insert into clienteaz values (2,'Antunes');

select * from clienteaz;

create database bancoaz2;
use bancoaz2;

create table clienteaz(
idcli	int,
cliente varchar(30)
);

insert into clienteaz values (1,'Marco');
insert into clienteaz values (2,'Antunes');

select * from clienteaz;

go;
create procedure replica_dados
-- parametros externos recebidos na execução da stored procedure
    @vidcli		int,
    @vcliente	varchar(30)
as
    insert into bancoaz.dbo.clienteaz(idcli,cliente)
    values (@vidcli,@vcliente);
    insert into bancoaz2.dbo.clienteaz(idcli,cliente)
    values (@vidcli,@vcliente);
	select * from bancoaz.dbo.clienteaz; 
	select * from bancoaz2.dbo.clienteaz;

exec replica_dados 3,'Ze';
exec replica_dados 4,'Maria';

select * from bancoaz.dbo.clienteaz; 
select * from bancoaz2.dbo.clienteaz;

-- 
create database bancoaj;
use bancoaj;

create table clienteaj(
idcli	int,
cliente varchar(30)
);

insert into clienteaj values (1,'Andre');
insert into clienteaj values (2,'Antonio');

select * from clienteaj;

create database bancokz;
use bancokz;

create table clientekz(
idcli	int,
cliente varchar(30)
);

insert into clientekz values (3,'Marco');
insert into clientekz values (4,'Mario');

select * from clientekz;

go;
create procedure fragmenta_dados
-- parametros externos recebidos na execução da stored procedure
    @vidcli		int,
    @vcliente	varchar(30)
as
	declare @letra char(1)
	set @letra = upper(substring(@vcliente,1,1));
	if @letra in ('A','B','C','D','E','F','G','H','I','J')
		begin
			insert into bancoaj.dbo.clienteaj(idcli,cliente)
			values (@vidcli,@vcliente);
		end
	else
		begin
			insert into bancokz.dbo.clientekz(idcli,cliente)
			values (@vidcli,@vcliente);
		end
	select * from bancoaj.dbo.clienteaj; 
	select * from bancokz.dbo.clientekz;

exec fragmenta_dados 5,'Angela';
exec fragmenta_dados 6,'Nair';
exec fragmenta_dados 7,'Bia';
exec fragmenta_dados 8,'Zenaide';



