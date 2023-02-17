--EXERCÍCIOS
-- Com base no exemplo prático da Aula_01_e_02, considerando a tabela FUNCIONÁRIOS já criada, resolva os exercícios de 1 a 3 abaixo:

--1) Calcule o total de salario por departamento, mas apenas com senioridade Liderança e Gerência

select
	departamento,
	sum(salario) as total_salarios
from funcionarios
where senioridade in ('Liderança', 'Gerência')
group by 1
order by 2 desc;

--2) Calcule quantos funcionarios tem por departamento

select
	departamento,
	count(nome) as qntd_funcionarios
from funcionarios
group by 1
order by 2 desc;
	
--3) Calcule quantos funcionarios tem por senioridade

select
	senioridade,
	count(nome) as qntd_funcionarios
from funcionarios
group by 1
order by 2 desc;

------------------------------------------------------------------------------------------------------------------------

-- Com base na tabela VENDAS, abaixo, resolva os exercícios de 4 a 7:

create table vendas (
	periodo_id integer,
	produto_id integer,
	nome_produto varchar(40),
	quantidade integer,
	valor_unidade numeric (16,2));

insert into vendas values
	(1,1,'Arroz',1,22.50),
	(1,2,'Feijão',1,8.90),
	(1,3,'Óleo',2,7.50),
	(1,4,'Sal',1,4.20),
	(1,5,'Macarrão',2,4.50),
	(2,6,'Cerveja',36,2.5),
	(2,7,'Refrigerante',4,9.80),
	(2,8,'Carne',2,45.00),
	(2,9,'Linguiça',2,15.80),
	(3,1,'Arroz',1,22.50),
	(3,2,'Feijão',1,8.90),
	(3,5,'Macarrão',4,4.50),
	(3,10,'Molho',6,2.20),
	(3,7,'Refrigerante',2,9.80),
	(3,11,'Leite',12,4.60),
	(4,11,'Leite',6,4.60),
	(4,12,'Fralda',1,62.50),
	(4,7,'Refrigerante',2,9.80),
	(4,13,'Sorvete',1,25.50),
	(4,5,'Macarrão',1,4.50),
	(5,1,'Arroz',2,22.50),
	(5,2,'Feijão',2,8.90),
	(5,4,'Sal',1,4.20),
	(5,14,'Açúcar',1,3.90),
	(5,15,'Café',2,8.90),
	(5,11,'Leite',12,4.60),
	(5,16,'Bolacha',4,2.40),
	(6,17,'Morango',1,6.20),
	(6,18,'Banana',1,4.99),
	(6,11,'Leite',4,4.60),
	(6,14,'Açúcar',1,3.90),
	(6,1,'Arroz',1,22.50),
	(6,2,'Feijão',1,8.90),
	(7,19,'Lasanha',1,8.70),
	(7,10,'Molho',4,2.20),
	(7,20,'Presunto',3,8.70),
	(7,21,'Mussarela',3,7.30),
	(7,7,'Refrigerante',1,9.80),
	(7,13,'Sorvete',1,25.50),
	(8,5,'Macarrão',3,4.50),
	(8,3,'Óleo',1,7.50),
	(8,4,'Sal',1,4.20),
	(8,7,'Refrigerante',2,9.80),
	(8,10,'Molho',2,2.20),
	(9,1,'Arroz',1,22.50),
	(9,2,'Feijão',1,8.90),
	(9,3,'Óleo',1,7.50),
	(9,13,'Sorvete',2,25.50),
	(10,5,'Macarrão',2,4.50),
	(10,10,'Molho',4,2.20),
	(10,7,'Refrigerante',2,9.80),
	(10,6,'Cerveja',12,2.5),
	(10,8,'Carne',1,45.00),
	(10,4,'Sal',1,4.20);


--4) Qual é o valor total de cada uma das compras?

select
	periodo_id,
	sum(quantidade * valor_unidade) as soma_compras
from vendas
group by periodo_id
order by periodo_id;

--5) Qual o produto mais vendido em quantidade?

select
	produto_id,
	nome_produto,
	sum(quantidade) as qntd_total
from vendas
group by produto_id, nome_produto
order by qntd_total desc;

--6) Qual o produto que mais vendeu em valor?

select
	produto_id,
	nome_produto,
	sum(quantidade * valor_unidade) as soma_total
from vendas
group by produto_id, nome_produto
order by soma_total desc;

--7) Calcule quantos produtos distintos tem por pedido.

select
	periodo_id,		-- linha 1
	count(distinct produto_id) as qntd_de_produtos
from vendas
group by periodo_id
order by 2 desc;
