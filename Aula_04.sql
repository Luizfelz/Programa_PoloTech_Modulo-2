-- Aula sobre CONSTRAINS

-- CONSTRAINS já vistos: SERIAL, NOT e NULL

-- UNIQUE
create table mercado(
	produto_id integer unique not null,
	nome_produto varchar(40),
	tipo_produto varchar(40),
	valor_produto numeric(8,2));

insert into mercado (produto_id, nome_produto, tipo_produto, valor_produto)
	values  (1,'Pasta de Dente','Higiene',5.50),
			(2,'Refrigerante','Bebidas',9.80),
			(3,'Pão de Forma','Padaria',6.20),
			(4,'Batata Frita','Congelados',17.00);

-- DEFAULT 

drop table if exists mercado; -- dropa a tabela se ela existir

create table mercado(
	produto_id integer unique not null,
	nome_produto varchar(40),
	tipo_produto varchar(40),
	valor_produto numeric(8,2) default 0.0); -- o default cria o valor padrão de 0 caso nenhum valor seja passado

insert into mercado (produto_id, nome_produto, tipo_produto, valor_produto)
	values  (1,'Pasta de Dente','Higiene',5.50),
			(2,'Refrigerante','Bebidas',9.80),
			(3,'Pão de Forma','Padaria',6.20),
			(4,'Batata Frita','Congelados',17.00);
			
insert into mercado (produto_id, nome_produto, tipo_produto)		
	values	(5,'Leite','Laticínios'); -- sem valor, para testar o default


-- CHECK
	
drop table if exists mercado;

create table mercado(
	produto_id integer unique not null,
	nome_produto varchar(40),
	tipo_produto varchar(40),
	estoque integer check (estoque > 0), -- verifica se existe o "produto" na tabela
	valor_produto numeric(8,2) default 0.0);
	
insert into mercado (produto_id, nome_produto, tipo_produto, estoque, valor_produto)
	values  (1,'Pasta de Dente','Higiene',20,5.5),
			(2,'Refrigerante','Bebidas',50,9.80),
			(3,'Pão de Forma','Padaria',4,6.20),
			(4,'Batata Frita','Congelados',15,17.0),
			(5,'Leite','Laticínios',10,8.0);

insert into mercado (produto_id, nome_produto, tipo_produto, estoque, valor_produto)
	values  (6,'Maçã','Hortifruti',2,2.73);


-- CHAVES: chave primária (primary key) e estrangeira (foreign key)

drop table if exists mercado;
drop table if exists vendas;

create table mercado(
	produto_id integer primary key,
	nome_produto varchar(40),
	tipo_produto varchar(40),
	estoque integer check (estoque > 0),
	valor_produto numeric(8,2) default 0.0);

create table vendas(
	venda_id integer primary key,
	quantidade integer,
	produto_id integer references "mercado" (produto_id)); -- referenciar nome das tabelas entre aspas ""


-- Revisão de Queries
-- Tabelas SALES da lista de exercício (última aula, dia 24/12)

select * -- o * retorna TODOS os valores da tabela
from sales;

select
	data_pedido,
	cidade,
	custo_garrafa
from sales;

select * 
from sales
limit 5;


-- DISTINCT: retorna todos os elementos distintos da tabela (daquela coluna específica)

select 
	distinct cidade -- usando um count(distinct cidade) ele retorna a quantidade. Neste caso = 345
from sales;


-- ORDER BY

select 
	item_id,
	venda_garrafa
from sales
order by item_id;

select 
	cidade,
	municipio
from sales
order by cidade, municipio;

select distinct
	cidade,
	municipio
from sales
order by cidade, municipio;


-- WHERE

select *
from sales
where cidade = 'WATERLOO';


-- GROUP BY e AGREGADORES (agregadores: count, max, min, sum, avg)

select 
	pedido_id,
	count(item_id) as quantidade,
	sum(total_venda) as total_pedido
from sales
group by pedido_id
order by pedido_id;


-- COMANDO HAVING

select 
	data_pedido,
	count(pedido_id) as total_pedidos
from sales
group by data_pedido
having count(distinct pedido_id) > 250
order by data_pedido;

