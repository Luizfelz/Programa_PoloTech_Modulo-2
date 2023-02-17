-- Os exercícios a seguir levam em consideração a tabela SALES, criada em aulas passadas.

-- 1. Quais são as 10 marcas que lucraram acima de 1000 dolares no dia 30/11/2022?
select 
	marca_id,
	data_pedido,
	sum((venda_garrafa - custo_garrafa) * garrafas_vendidas) as lucro 
from sales
where data_pedido = '2022-11-30'
group by marca_id, data_pedido
having sum((venda_garrafa - custo_garrafa) * garrafas_vendidas) > 1000
order by lucro desc
limit 10;

-- 2. Qual a cidade que mais vendeu litros para aqueles que venderam mais do que 2000 litros de bebidas?
select
	cidade,
	sum(volume_litros_vendidos) as total_litros_vendido
from sales
group by cidade 
having sum(volume_litros_vendidos) > 2000
order by total_litros_vendido desc
limit 1;

-- 3.  Qual o municipio que mais vendeu em dolares para totais menores que 15 mil dolares?
select 
	municipio,
	sum(total_venda) as total_vendido
from sales
group by municipio
having sum(total_venda) < 15000
order by total_vendido desc
limit 1;

-- 4. Quais as 5 marcas que tiveram os menores custos nas cidades de WATERLOO e DES MOINES?
select 
	marca_id,
	sum(garrafas_vendidas  * custo_garrafa) as custo_total
from sales
where cidade = 'WATERLOO' or cidade = 'DES MOINES'  -- where cidade in ('WATERLOO','DES MOINES')
group by marca_id
order by custo_total
limit 5;