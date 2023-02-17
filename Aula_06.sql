-- SUBQUERIES

-- Monte uma tabela com o saldo atual e as atualizacoes de saldo (entrada e saida)
-- tabela entradas
drop table tb_entrada;
drop table tb_saida;

create table tb_entrada as
select
	A.cliente_id,
	sum(A.valor) as entrada
from transacoes A
left join tipo_transacao B on A.tipo_transacao_id = B.tipo_transacao_id 
where B.nome_transacao  = 'PixIn'
group by A.cliente_id 
order by A.cliente_id;


create table tb_saida as
select
	A.cliente_id,
	-sum(A.valor) as saida
from transacoes A
left join tipo_transacao B on A.tipo_transacao_id = B.tipo_transacao_id 
where B.nome_transacao  != 'PixIn'
group by A.cliente_id 
order by A.cliente_id;


select 
	A.cliente_id,
	A.saldo,
	B.entrada,
	C.saida
from saldo A
left join tb_entrada B on A.cliente_id = B.cliente_id 
left join tb_saida C on A.cliente_id  = C.cliente_id;


-- usando sub-queries:
select 
	A.cliente_id,
	A.saldo,
	B.entrada,
	C.saida
from saldo A
left join (select
				A.cliente_id,
				sum(A.valor) as entrada
			from transacoes A
			left join tipo_transacao B on A.tipo_transacao_id = B.tipo_transacao_id 
			where B.nome_transacao  = 'PixIn'
			group by A.cliente_id 
			order by A.cliente_id) B on A.cliente_id = B.cliente_id
left join (select
				A.cliente_id,
				-sum(A.valor) as saida
			from transacoes A
			left join tipo_transacao B on A.tipo_transacao_id = B.tipo_transacao_id 
			where B.nome_transacao  != 'PixIn'
			group by A.cliente_id 
			order by A.cliente_id) C on A.cliente_id = C.cliente_id;	


-- CASE WHEN
select 
	A.cliente_id,
	A.saldo,
	case when B.entrada is null then 0 else B.entrada end as entrada,
	case when C.saida is null then 0 else C.saida end as saida
from saldo A
left join tb_entrada B on A.cliente_id = B.cliente_id 
left join tb_saida C on A.cliente_id  = C.cliente_id;
      
-- criando uma coluna para SALDO ATUAL
select 
	A.cliente_id,
	A.saldo,
	case when B.entrada is null then 0 else B.entrada end as entrada,
	case when C.saida is null then 0 else C.saida end as saida,
	A.saldo + (case when B.entrada is null then 0 else B.entrada end) + (case when C.saida is null then 0 else C.saida end) as saldo_atual
from saldo A
left join tb_entrada B on A.cliente_id = B.cliente_id 
left join tb_saida C on A.cliente_id  = C.cliente_id;
  

-- outro exemplo com 'CASE WHEN'
select 
	cliente_id,
	idade,
	case when idade <= 30 then 'Faixa 1 - Até 30 anos'
		 when idade <= 40 then 'Faixa 2 - 30-40 anos'
		 when idade <= 50 then 'Faixa 3 - 40-50 anos'
		 when idade <= 60 then 'Faixa 4 - 50-60 anos' else 'Faixa 5 - > 60 anos' end as fx_idade
from clientes;

select 
	fx_idade,
	count(*) as qntds_clientes
from (select 
			cliente_id,
			idade,
			case when idade <= 30 then 'Faixa 1 - Até 30 anos'
				 when idade <= 40 then 'Faixa 2 - 30-40 anos'
		 		when idade <= 50 then 'Faixa 3 - 40-50 anos'
		 		when idade <= 60 then 'Faixa 4 - 50-60 anos' else 'Faixa 5 - > 60 anos' end as fx_idade
		from clientes) as A
group by fx_idade
order by fx_idade;

-- MANIPULANDO DATAS E TEXTOS

-- TEXTOS MINUSCULAS
select 
	('BOA NOITE TURMA COMO ESTAO'),
	lower('BOA NOITE TURMA COMO ESTAO');


-- TEXTOS MAIUSCULAS
select 
	('boa noite turma como estao'),
	upper('boa noite turma como estao');


-- Função LIKE (busca para ver se existe strings iguais)
-- Exemplo que dá false
select 
	'SANDRO SAORIN' like 'SANDRO';

-- Exemplo que da true
select 
	'SANDRO SAORIN' like 'SANDRO SAORIN';

-- %: valida trecho de palavras
-- % a direita = pode ter mais coisa a direita da palavra
select 
	'SANDRO SAORIN' like 'SANDRO%';	-- começa com SANDRO (tudo que vem antes do %)	

-- % a esquerda = pode ter mais coisa a esquerda da palavra
select 
	'SANDRO SAORIN' like '%SAORIN';	 -- termina com SAORIN (tudo que vem depois do %)					

-- % em ambos os lados: valida se existe aquele trecho dentro da string
select 
	'SANDRO SAORIN' like '%AND%'; -- possui AND em algum lugar (no meio da frase)


-- CONCAT
select concat('SANDRO','SAORIN','DA','SILVA');

select concat('SANDRO',' SAORIN',' DA',' SILVA');

--SUBSTRING (SUBSTR)
-- COMO FUNCIONA SUBSTR(PALAVRA, POSIÇÃO DE INICIO NA PALAVRA, E O COMPRIMENTO QUE VAI PERCORRER)
select substring('SANDRO SAORIN DA SILVA', 1, 6);

select substring('SANDRO SAORIN DA SILVA', 4, 12);

-- DATAS
-- Customizando datas
select 
	data_pedido,
from sales s
limit 10;

select 
	data_pedido,
	to_char(data_pedido, 'dd/mm/yyyy') as nova_data_pedido
from sales s
limit 10;

select 
	data_pedido,
	to_char(data_pedido, 'dd month yyyy') as nova_data_pedido
from sales s
limit 10;

--EXTRAINDO O DIA
select 
	data_pedido,
	extract(day from data_pedido) as dia,
	extract(month from data_pedido) as mês,
	extract(year from data_pedido) as ano,
	extract(week from data_pedido) as semana
from sales s
limit 10;		

-- Data de hoje
select current_date as data_hoje;

select current_time as hora_agora;

select current_timestamp as dia_e_hora_agr;

select extract(month from current_date) as mês_hoje;

