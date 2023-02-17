-- PROVA MÓDULO 02 - 20/01/2023
-- Aluno: Luiz Fonseca

-- PROVA
-- BANCO DE DADOS: PIZZARIA

-- 1) CRIAÇÃO DAS TABELAS
-- RODE OS CODIGOS ABAIXO PARA A CRIAÇÃO DAS TABELAS

CREATE TABLE menu_pizzas(
	pizza_id integer PRIMARY KEY,
	nome_produto varchar(40),
	tipo_produto varchar(40),
	preco numeric(6,2));

CREATE TABLE ref_entregador(
	entregador_id integer PRIMARY KEY,
	nome_entregador varchar(40));

CREATE TABLE ref_pagamento(
	pagamento_id integer PRIMARY KEY,
	forma_pagamento varchar(40));

CREATE TABLE entrega(
	entrega_id integer,
	pizza_id integer REFERENCES "menu_pizzas" (pizza_id),
	quantidade integer);

CREATE TABLE pagamento(
	entrega_id integer,
	pagamento_id integer REFERENCES "ref_pagamento" (pagamento_id));

CREATE TABLE entregador(
	entrega_id integer,
	entregador_id integer REFERENCES "ref_entregador" (entregador_id));


-- 2) INSERT DAS TABELAS
-- RODE OS INSERTS PARA PREENCHER AS TABELAS

INSERT INTO menu_pizzas (pizza_id, nome_produto, tipo_produto, preco)
	VALUES  (1,'Margherita','Salgadas',89.10),
			(2,'Calabresa','Salgadas',84.50),
			(3,'Frango com Catupiry','Salgadas',99.20),
			(4,'Portuguesa','Salgadas',98.30),
			(5,'Pepperoni','Salgadas',99.10),
			(6,'4 Queijos','Salgadas',90.20),
			(7,'Prestígio','Doces',79.70),
			(8,'M&Ms com Nutella','Doces',99.80),
			(9,'Romeu e Julieta','Doces',79.60),
			(10,'Cola','Refrigerantes',8.90),
			(11,'Limão','Refrigerantes',10.90);
		
		
INSERT INTO ref_entregador (entregador_id, nome_entregador)
	VALUES  (1,'Robson'),
			(2,'Julio'),
			(3,'Gabriela');
		

INSERT INTO ref_pagamento (pagamento_id, forma_pagamento)
	VALUES (1,'App'),
           (2,'Na Entrega');
          
          
INSERT INTO entrega (entrega_id, pizza_id, quantidade)
	VALUES  (1,6,2),
			(1,10,2),
			(2,4,1),
			(2,7,2),
			(2,11,1),
			(3,5,2),
			(3,1,2),
			(3,9,2),
			(3,10,1),
			(4,6,2),
			(4,4,1),
			(4,7,2),
			(5,2,1),
			(5,11,1),
			(6,5,2),
			(6,6,1),
			(6,9,2),
			(6,10,2),
			(7,5,1),
			(7,2,1),
			(7,7,2),
			(7,10,2),
			(8,1,2),
			(8,8,2),
			(8,11,1),
			(9,2,1),
			(9,7,2),
			(10,4,2),
			(10,1,1),
			(10,8,1),
			(10,11,1),
			(11,6,2),
			(11,7,1),
			(12,6,2),
			(12,3,2),
			(12,10,2),
			(13,4,2),
			(13,11,1),
			(14,1,1),
			(14,2,2),
			(14,11,1),
			(15,6,2),
			(15,11,2),
			(16,4,1),
			(16,3,1),
			(16,7,1),
			(16,11,2),
			(17,4,2),
			(17,6,2),
			(17,10,1),
			(18,7,1),
			(18,10,2),
			(19,1,2),
			(19,5,1),
			(19,7,2),
			(20,3,1),
			(20,10,1),
			(21,5,2),
			(21,3,1),
			(21,10,1),
			(22,2,2),
			(22,6,2),
			(22,4,1),
			(22,8,1),
			(23,8,2),
			(23,7,2),
			(24,5,2),
			(24,8,1),
			(24,10,1),
			(25,1,1),
			(25,10,2),
			(26,4,2),
			(26,7,1),
			(26,10,2),
			(27,5,1),
			(27,11,2),
			(28,6,2),
			(28,4,2),
			(28,10,1),
			(29,4,1),
			(29,10,1),
			(30,4,2),
			(30,6,2),
			(30,8,1),
			(30,11,1),
			(31,3,2),
			(31,11,1),
			(32,1,1),
			(32,9,2),
			(32,11,2),
			(33,3,2),
			(33,10,1),
			(34,5,2),
			(34,7,1),
			(34,11,1),
			(35,1,2),
			(35,10,1),
			(36,5,2),
			(36,2,1),
			(36,10,2),
			(37,4,1),
			(37,6,2),
			(37,2,2),
			(37,8,2),
			(38,3,1),
			(38,10,1),
			(39,4,1),
			(39,8,1),
			(39,11,2),
			(40,6,1),
			(40,9,2),
			(41,5,1),
			(41,4,1),
			(41,6,2),
			(42,7,1),
			(42,9,1),
			(43,1,2),
			(43,7,2),
			(43,11,2),
			(44,7,2),
			(44,10,2),
			(45,1,2),
			(45,4,2),
			(45,3,1),
			(45,10,2),
			(46,3,2),
			(46,9,1),
			(47,6,2),
			(47,9,2),
			(47,10,2);
		
		
INSERT INTO pagamento (entrega_id, pagamento_id)
	VALUES  (1,1),
			(2,2),
			(3,1),
			(4,2),
			(5,1),
			(6,2),
			(7,1),
			(8,1),
			(9,1),
			(10,2),
			(11,1),
			(12,2),
			(13,1),
			(14,1),
			(15,2),
			(16,2),
			(17,2),
			(18,1),
			(19,1),
			(20,1),
			(21,1),
			(22,1),
			(23,1),
			(24,1),
			(25,1),
			(26,1),
			(27,1),
			(28,1),
			(29,1),
			(30,1),
			(31,1),
			(32,2),
			(33,1),
			(34,2),
			(35,2),
			(36,1),
			(37,2),
			(38,2),
			(39,2),
			(40,2),
			(41,1),
			(42,2),
			(43,1),
			(44,2),
			(45,1),
			(46,2),
			(47,2);
		
		
INSERT INTO entregador (entrega_id, entregador_id)
	VALUES  (1,1),
			(2,1),
			(3,1),
			(4,3),
			(5,1),
			(6,2),
			(7,2),
			(8,3),
			(9,1),
			(10,1),
			(11,2),
			(12,3),
			(13,2),
			(14,2),
			(15,1),
			(16,2),
			(17,2),
			(18,1),
			(19,2),
			(20,2),
			(21,2),
			(22,3),
			(23,3),
			(24,2),
			(25,1),
			(26,2),
			(27,1),
			(28,2),
			(29,3),
			(30,2),
			(31,3),
			(32,2),
			(33,1),
			(34,2),
			(35,1),
			(36,1),
			(37,2),
			(38,3),
			(39,3),
			(40,3),
			(41,1),
			(42,2),
			(43,2),
			(44,2),
			(45,3),
			(46,2),
			(47,3);


-- 3) Quantos pedidos teve cada um dos tipos de produto (salgadas, doces e refrigerantes)?
	-- quantidade de pedidos que tem esses itens
	-- agrupar nas categorias: salgadas, doces e refrigerantes
	-- não pode ter nenhum item com mais de 47 (usar distinct)
	-- é a QUANTIDADE DE PEDIDOS, e não de pizzas
select
	A.tipo_produto,
	count(distinct B.entrega_id) as qntd_por_tipo
from menu_pizzas A
left join entrega B on B.pizza_id = A.pizza_id 
group by A.tipo_produto
order by A.tipo_produto;


-- 4) Monte uma tabela com o total gasto em cada um dos pedidos
select 
	A.entrega_id,
	sum(A.quantidade * B.preco) as valor_total
from entrega A
left join menu_pizzas B on B.pizza_id = A.pizza_id 
group by A.entrega_id
order by A.entrega_id;


-- 5) Monte uma tabela com ranqueamento dos produtos mais vendidos em valor (utilize os nomes!)
	-- usar o NOME das pizzas
	-- qual a pizza mais vendida
	-- agrupar pelos NOMES dos produtos e calcular o quanto foi vendido em cada um deles (em dinheiro)
	-- qntd de pizza * valor da pizza
select
	A.nome_produto,
	sum(A.preco * B.quantidade) as total_vendido
from menu_pizzas A
left join entrega B on B.pizza_id  = A.pizza_id 
group by A.nome_produto 
order by total_vendido desc;


-- 6) Quanto foi arrecadado em cada tipo de pagamento em valor (App e na entrega)?
	-- agrupar pelo tipo de pagamento e o total dos valores em cada um deles, ou seja, quanto foi o total pago em APP e o total pago na entrega
	-- a resposta é em VALOR (DINHEIRO)
select 
	A.forma_pagamento,
	sum(C.quantidade * D.preco) as valor_total
from ref_pagamento A
left join pagamento B on B.pagamento_id = A.pagamento_id
left join entrega C on C.entrega_id = B.entrega_id
left join menu_pizzas D on D.pizza_id = C.pizza_id
group by A.forma_pagamento 
order by A.forma_pagamento;


-- 7) Monte uma tabela com o nome dos entregadores(as) e a quantidade de pedidos
-- entregues por cada um
	-- cada linha vai ter o nome de um entregador
	-- usar o COUNT() 
	-- a soma dos três (ou seja, das três linhas) tem que dar 47 pq o máximo de pedidos é 47
select
	B.nome_entregador,
	count(A.entrega_id) as qntd_entregas
from entregador A
left join ref_entregador B on B.entregador_id = A.entregador_id
group by B.nome_entregador
order by qntd_entregas desc;


-- 8) Quais são as principais pizzas salgadas vendidas pelo App em quantidade?
-- Monte uma tabela com o ranqueamento delas pela quantidade
	-- pizzas salgadas E vendidas pelo APP. São dois filtros
	-- monta a tabela INTEIRA do rank, mas trazer somente as salgadas e as que foram vendidas pelo APP
select 
	A.nome_produto,
	sum(B.quantidade) as qntd_total
from menu_pizzas A
left join entrega B on B.pizza_id = A.pizza_id
left join pagamento C on C.entrega_id = B.entrega_id
left join ref_pagamento D on D.pagamento_id = C.pagamento_id
where D.forma_pagamento = 'App' and A.tipo_produto = 'Salgadas'
group by A.nome_produto
order by qntd_total desc;



-- 9) Quantos pedidos teve em cada forma de pagamento (pelo App e na entrega)?
	-- cada linha vai ter uma forma de pagamento: uma APP e outra NA ENTREGA
	-- a soma tem que dar 47, pq so tem 47 pedidos
select 
	A.forma_pagamento,
	count(distinct B.entrega_id) as qntd_entregue
from ref_pagamento A
left join pagamento B on B.pagamento_id = A.pagamento_id
left join entrega C on C.entrega_id = B.entrega_id
group by A.forma_pagamento 
order by A.forma_pagamento;


-- 10) Monte uma tabela de comissão para os entregadores, onde as colunas serão
-- nome do entregador, forma de pagamento (app ou entrega) e comissão (que será paga ao entregador)
-- Regra da comissão: pagamentos pelo App: 10% comissão, na entrega: 5% comissão
-- ARREDONDE PARA DUAS CASAS DECIMAIS
		-- usar o CASE WHEN para contar e criar as colunas
		-- serão 6 linhas, pois são 3 entregadores e 2 tipos de entregas
		-- usar SUM() dos pedidos pagos pelo app e os pagos na entrega
select
	A.nome_entregador,
	case when D.forma_pagamento = 'App' then 'App' else 'Na Entrega' end as Forma_Pagamento,
	sum(case when D.forma_pagamento = 'App' then round(F.preco * E.quantidade * 0.10, 2)
		     when D.forma_pagamento = 'Na Entrega' then round(F.preco * E.quantidade * 0.05, 2) end) as Comissão
from ref_entregador A
left join entregador B on B.entregador_id = A.entregador_id
left join pagamento C on C.entrega_id = B.entrega_id 
left join ref_pagamento D on D.pagamento_id = C.pagamento_id
left join entrega E on E.entrega_id = B.entrega_id 
left join menu_pizzas F on F.pizza_id = E.pizza_id
group by A.nome_entregador, Forma_Pagamento
order by A.nome_entregador;

