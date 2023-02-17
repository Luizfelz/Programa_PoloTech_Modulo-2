-- JOINS e UNIONS
CREATE TABLE correntista(
	cliente_id integer PRIMARY KEY,
	nome varchar(40),
	cidade varchar(40));

CREATE TABLE saldo(
	cliente_id integer REFERENCES "correntista" (cliente_id),
	saldo NUMERIC(16,2));

CREATE TABLE tipo_transacao(
	tipo_transacao_id integer PRIMARY KEY,
	nome_transacao varchar(40));

CREATE TABLE transacoes(
	transacao_id integer PRIMARY KEY,
	cliente_id integer REFERENCES "correntista" (cliente_id),
	tipo_transacao_id integer REFERENCES "tipo_transacao" (tipo_transacao_id),
	valor numeric (8,2));

INSERT INTO correntista (cliente_id, nome, cidade)
	VALUES  (1,'Francisco','São Paulo'),
			(2,'João','São Paulo'),
			(3,'Lúcia','Rio de Janeiro'),
			(4,'Rosana','São Paulo'),
			(5,'Laura','São Paulo'),
			(6,'Pedro','São Paulo'),
			(7,'Cristina','Rio de Janeiro'),
			(8,'Rosangela','São Paulo'),
			(9,'Augusto','Rio de Janeiro'),
			(10,'Cecilia','Rio de Janeiro');

INSERT INTO saldo (cliente_id, saldo)
	VALUES  (1,2700.00),
			(2,1550.00),
			(3,2278.50),
			(4,30008.00),
			(5,14000.00),
			(6,50000.00),
			(7,9000.00),
			(8,1500.50),
			(9,2000.00),
			(10,4500.00);

		
INSERT INTO tipo_transacao (tipo_transacao_id, nome_transacao)
	VALUES  (1, 'PixIn'),
			(2, 'PixOut'),
			(3, 'Boleto'),
			(4, 'Imposto'),
			(5, 'Tarifa');
		
INSERT INTO transacoes (transacao_id, cliente_id, tipo_transacao_id, valor)
	VALUES  (1,1,4,250.90),
			(2,1,5,79.80),
			(3,1,1,216.93),
			(4,8,2,71.74),
			(5,7,2,285.92),
			(6,7,1,220.27),
			(7,2,4,250.90),
			(8,5,1,116.37),
			(9,7,2,263.79),
			(10,10,3,48.73),
			(11,4,3,292.85),
			(12,7,1,177.23),
			(13,5,2,272.99),
			(14,4,2,176.17),
			(15,9,3,65.86),
			(16,5,2,150.51),
			(17,8,1,220.69),
			(18,2,5,79.80),
			(19,3,5,79.80),
			(20,4,5,79.80),
			(21,6,1,143.13),
			(22,6,3,128.54),
			(23,4,1,218.46),
			(24,3,2,229.54),
			(25,7,3,278.86),
			(26,7,2,221.88),
			(27,9,2,217.91),
			(28,3,4,250.90),
			(29,7,1,26.48),
			(30,7,3,109.80),
			(31,2,2,95.76),
			(32,9,1,172.12),
			(33,2,3,15.42),
			(34,6,3,58.18),
			(35,7,2,164.85),
			(36,1,1,64.71),
			(37,8,3,150.62),
			(38,1,1,10.68),
			(39,6,1,186.58),
			(40,8,2,76.40),
			(41,3,3,2.35),
			(42,10,3,138.83),
			(43,2,2,32.37),
			(44,1,2,278.95),
			(45,5,5,79.80),
			(46,6,5,79.80),
			(47,8,2,235.90),
			(48,6,3,56.19),
			(49,4,4,250.90),
			(50,7,3,124.25),
			(51,7,1,225.41),
			(52,5,4,250.90),
			(53,1,3,141.95),
			(54,8,3,141.36),
			(55,4,1,89.35),
			(56,1,2,111.23),
			(57,6,4,250.90),
			(58,9,3,21.21),
			(59,10,3,1.59),
			(60,10,3,153.68),
			(61,7,4,250.90),
			(62,6,3,271.81),
			(63,3,3,231.96),
			(64,4,2,81.15),
			(65,8,4,250.90),
			(66,9,4,250.90),
			(67,9,2,103.73),
			(68,2,2,274.50),
			(69,8,1,198.36),
			(70,10,4,250.90),
			(71,9,1,201.85),
			(72,7,5,79.80),
			(73,8,5,79.80),
			(74,6,2,92.88),
			(75,1,3,292.45),
			(76,10,3,246.89),
			(77,7,1,6.95),
			(78,1,1,106.69),
			(79,9,1,229.65),
			(80,5,2,289.34);

-- JOINS
-- Qual é a cidade que mais transacionou?

-- LEFT JOIN
select 
	B.cidade, -- puxa a coluna 'cidade' da tabela 'B'
	count(A.transacao_id) as qntd_transacoes -- puxa tudo da tabela 'A'
from transacoes A -- o 'A' é uma abreviação do nome da tabela 'transacoes'
left join correntista B on A.cliente_id = B.cliente_id
group by B.cidade;

-- RIGHT JOIN
select 
	B.cidade, -- puxa a coluna 'cidade' da tabela 'B'
	count(A.transacao_id) as qntd_transacoes -- puxa tudo da tabela 'A'
from correntista A -- o 'A' é uma abreviação do nome da tabela 'transacoes'
left join transacoes B on A.cliente_id = B.cliente_id
group by B.cidade;

-- total por tipo de transacao?
select 
	A.nome_transacao,
	sum(B.valor) as total_transacao
from tipo_transacao A
right join transacoes B on A.tipo_transacao_id = B.tipo_transacao_id
group by A.nome_transacao
order by total_transacao desc;

-- INNER JOIN
create table tabela1 as
select *
from correntista
where cliente_id > 3;

select * from tabela1;

create table tabela2 as
select *
from saldo
where cliente_id < 7;

select * from tabela2;

select 
	A.cliente_id,
	A.nome,
	B.saldo
from tabela1 A
inner join tabela2 B on A.cliente_id = B.cliente_id; -- retorna todos os valores no qual os ID's aparecem em ambas as tabelas


-- FULL JOIN
select 
	A.cliente_id,
	A.nome,
	B.saldo
from tabela1 A
full join tabela2 B on A.cliente_id = B.cliente_id; -- retorna todos os valores, mas os que não possuem ID's iguais em ambas as tabelas o valor retorna NULL


-- Monte uma tabela com o saldo atual e as atualizacoes de saldo (entrada e saída)
-- tabela entradas
create table entrada as
select
	A.cliente_id,
	sum(A.valor) as entrada
from transacoes A
left join tipo_transacao B on A.tipo_transacao_id = B.tipo_transacao_id 
where B.nome_transacao = 'PixIn'
group by A.cliente_id
order by A.cliente_id;

-- tabela saídas
create table saida as
select
	A.cliente_id,
	-sum(A.valor) as saida
from transacoes A
left join tipo_transacao B on A.tipo_transacao_id = B.tipo_transacao_id 
where B.nome_transacao != 'PixIn'
group by A.cliente_id
order by A.cliente_id;

-- tabela atual
select 
	A.cliente_id,
	A.saldo,
	B.entrada,
	C.saida
from saldo A
left join entrada B on A.cliente_id = B.cliente_id
left join saida C on A.cliente_id = C.cliente_id;


-- UNIONS
-- UNIONS é um empilhamento de tabelas
-- UNION ALL: não remove linhas duplicadas
-- UNION: remove as linhas duplicadas	

CREATE TABLE transacoes2(
	transacao_id integer PRIMARY KEY,
	cliente_id integer REFERENCES "correntista" (cliente_id),
	tipo_transacao_id integer REFERENCES "tipo_transacao" (tipo_transacao_id),
	valor numeric (8,2));

INSERT INTO transacoes2 (transacao_id, cliente_id, tipo_transacao_id, valor)
	VALUES  (81,1,2,182.58),
			(82,10,3,131.67),
			(83,3,2,213.47),
			(84,8,3,105.19),
			(85,9,2,254.57),
			(86,9,2,182.12),
			(87,6,3,75.93),
			(88,5,1,219.25),
			(89,6,2,252.67),
			(90,9,1,174.20),
			(91,10,2,102.83),
			(92,4,2,143.71),
			(93,9,5,79.80),
			(94,10,5,79.80),
			(95,1,3,32.24),
			(96,4,2,75.50),
			(97,1,3,239.13),
			(98,4,1,67.34),
			(99,1,1,196.98),
			(100,9,3,24.84);

select *
from transacoes2;

select -- exemplo trazendo TUDO das duas tabelas
	*
from transacoes
union all
select 
	*
from transacoes2;


select -- exemplo trazendo somente 'transacao_id' e 'valor' das duas tabelas
	transacao_id,
	valor
from transacoes
union all
select 
	transacao_id,
	valor
from transacoes2;
