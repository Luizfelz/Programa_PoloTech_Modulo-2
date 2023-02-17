-- GROUPING SETS
-- Banco de dados: Correntistas
	-- construir uma tabela que tenha: Cidade, nome_transacao e valor_transacao

select *
from correntista;

create table transacoes_total as
select *
from transacoes
union all
select *
from transacoes2;

select *
from tipo_transacao

select
	C.cidade,
	B.nome_transacao,
	sum(A.valor) as total
from transacoes_total A
left join tipo_transacao B on A.tipo_transacao_id = B.tipo_transacao_id 
left join correntista C on A.cliente_id = C.cliente_id 
group by 1, 2
order by 1, 2;


select
	C.cidade,
	B.nome_transacao,
	sum(A.valor) as total
from transacoes_total A
left join tipo_transacao B on A.tipo_transacao_id = B.tipo_transacao_id 
left join correntista C on A.cliente_id = C.cliente_id 
group by grouping sets (C.cidade, B.nome_transacao, (C.cidade, B.nome_transacao))
order by 1, 2;


-- ROLLUP 

select
	C.cidade,
	B.nome_transacao,
	sum(A.valor) as total
from transacoes_total A
left join tipo_transacao B on A.tipo_transacao_id = B.tipo_transacao_id 
left join correntista C on A.cliente_id = C.cliente_id 
group by rollup (C.cidade, B.nome_transacao)
order by 1, 2; 


-- CUBE 

select
	C.cidade,
	B.nome_transacao,
	sum(A.valor) as total
from transacoes_total A
left join tipo_transacao B on A.tipo_transacao_id = B.tipo_transacao_id 
left join correntista C on A.cliente_id = C.cliente_id 
group by cube (C.cidade, B.nome_transacao)
order by 1, 2;


-- OVER PARTITION BY e FUNÇÕES DE JANELA
create table tab_wf as
select
	C.cidade,
	B.nome_transacao,
	sum(A.valor) as total
from transacoes_total A
left join tipo_transacao B on A.tipo_transacao_id = B.tipo_transacao_id 
left join correntista C on A.cliente_id = C.cliente_id 
group by 1, 2
order by 1, 2;

select *
from tab_wf

select
	cidade,
	nome_transacao,
	total,
	sum(total) over(partition by cidade order by nome_transacao) as sum_cum,
	count(total) over(partition by cidade order by nome_transacao) as num_rows,
	avg(total) over(partition by cidade order by nome_transacao) as media,
	first_value(total) over(partition by cidade order by nome_transacao) as prim_valor,
	lag(total) over(partition by cidade order by nome_transacao) as total_dmenos1,
	lag(total,2) over(partition by cidade order by nome_transacao) as total_dmenos2
from tab_wf

select
	cidade,
	nome_transacao,
	total,
	lead(total) over (partition by cidade order by nome_transacao) as lead1,
	lead(total, 2) over (partition by cidade order by nome_transacao) as lead2
from tab_wf


-- Exercícios sugeridos, com base no conteúdo abordado acima.

-- 1) Usando o banco de dados da hamburgueria, monte uma tabela com as seguintes informações: nome_secao, nome_item e total gasto


-- 2) Monte o ROLLUP para a tabela acima com o agrupamento nome_secao, nome_item


-- 3) Calcule a soma acumulada e a diferença para a tabela do item 1


-- 4) Monte uma tabela agregada com as seguintes informações: forma_pgto, descricao_status e total de pedidos


-- 5) Faça a contagem e a soma acumulada para a tabela acima


-- 6) Monte com as tabelas de correntistas uma tabela agregada com cidade, nome_cliente, tipo_transacao e total das transações


-- 7) Com a tabela acima, calcule o LAG, a diferença e a soma acumulada 

