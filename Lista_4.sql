-- EXERCICIOS
-- 1) Usando a tabela sales, crie uma tabela onde teremos uma coluna categorica
--com as semanas e uma coluna númerica com o lucro total para cada semana.
select
	extract(week from A.data_pedido) as semana,
	sum((A.venda_garrafa - A.custo_garrafa) * A.garrafas_vendidas) as total_vendido_na_semana
from sales A
group by semana 
order by semana;

-- 2) Usando a tabela sales, identifique todas as cidades que tem no nome
--as letras DE juntas, e calcule a quantidade de cidades (mostrar as cidades)
select
	count(distinct A.cidade) as qntd
from sales A
where cidade like '%DE%';

select
	A.cidade
from sales A
where cidade like '%DE%'
group by A.cidade;

-- 3) Utilizando o exercicio sobre o mercado, categorize os pedidos de acordo
--com o valor total gasto (sugira uma separaçaõ entre 6 categorias)
	
	-- exercício abaixo está ERRADO
select
	F.faixa_valor,
	A.pedido_id,
	sum(A.quantidade * B.valor_unitario) as valor_total
from
	 (select
	  case when sum(A.quantidade * B.valor_unitario) < 85.0 then 'Faixa 1 - Até R$ 85,00'
	 	   when sum(A.quantidade * B.valor_unitario) < 170.0 then 'Faixa 2 - de R$ 85,00 a R$ 170,00'
		   when sum(A.quantidade * B.valor_unitario) < 240.0 then 'Faixa 3 - de R$ 170,00 a R$ 240,00'
	 	   when sum(A.quantidade * B.valor_unitario) < 320.0 then 'Faixa 4 - de R$ 240,00 a R$ 320,00' 
	 	   when sum(A.quantidade * B.valor_unitario) < 410.0 then 'Faixa 5 - de R$ 320,00 a R$ 410,00' else 'Faixa 6 - acima de R$ 410,00' end as faixa_valor
	  from pedidos A
	  left join produtos B on A.produto_id = B.produto_id) as F, pedidos A
left join produtos B on A.produto_id = B.produto_id 
group by A.pedido_id,F.faixa_valor
order by A.pedido_id;


-- 4) Usando o exercicio sobre correntistas, monte uma tabela com saldo e saldo_atual (parecido com o que foi feito em aula),
-- mas agora utilizando as 100 transações, usando subqueries
select
	S.cliente_id,
	S.saldo,
	sum(B.entrada +	B1.entrada1) as total_entrada,
	sum(C.saida + C2.saida2) as total_saida,
	sum(S.saldo + (B.entrada +	B1.entrada1) + (C.saida + C2.saida2)) as saldo_atual
from saldo S
left join (select
				A.cliente_id,
				sum(A.valor) as entrada
			from transacoes A
			left join tipo_transacao B on A.tipo_transacao_id = B.tipo_transacao_id 
			where B.nome_transacao  = 'PixIn'
			group by A.cliente_id 
			order by A.cliente_id) B on S.cliente_id = B.cliente_id
left join (select
				A1.cliente_id,
				sum(A1.valor) as entrada1
			from transacoes2 A1
			left join tipo_transacao B1 on A1.tipo_transacao_id = B1.tipo_transacao_id 
			where B1.nome_transacao  = 'PixIn'
			group by A1.cliente_id 
			order by A1.cliente_id) B1 on S.cliente_id = B1.cliente_id
left join (select
				A.cliente_id,
				-sum(A.valor) as saida
			from transacoes A
			left join tipo_transacao B on A.tipo_transacao_id = B.tipo_transacao_id 
			where B.nome_transacao  != 'PixIn'
			group by A.cliente_id 
			order by A.cliente_id) C on S.cliente_id = C.cliente_id
left join (select
				A2.cliente_id,
				-sum(A2.valor) as saida2
			from transacoes2 A2
			left join tipo_transacao B2 on A2.tipo_transacao_id = B2.tipo_transacao_id 
			where B2.nome_transacao  != 'PixIn'
			group by A2.cliente_id 
			order by A2.cliente_id) C2 on S.cliente_id = C2.cliente_id
group by S.cliente_id, S.saldo
order by S.cliente_id;