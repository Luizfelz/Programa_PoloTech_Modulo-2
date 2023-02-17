/* Comando para criar a tabela */
create table professores (
	professores_id SERIAL not null,
	nome varchar(40),
	dominio1 varchar(40),
	dominio2 varchar(40),
	dominio3 varchar(40));

/* Comando para inserir valores na tabela */
insert into professores (nome, 
						dominio1, 
						dominio2, 
						dominio3) 
		values ('Sandro Saorin',
				'Java',
				'Machine Learning',
				'Data Science');

/* Excluir tabela */
drop table professores;

/* inserindo mais dados */
insert into professores (nome, 
						dominio1, 
						dominio2, 
						dominio3) 
		values ('André Juan', 'Python', 'Data Science', 'Estatística'),
			   ('Renata Marchese', 'Estatística', 'Data Science', 'Machine Learning'),
			   ('Larissa Moreira', 'Python', 'SQL', 'Data Science');

/* Deletando conteúdo da tabela */
/* delete from professores where professores_id = 1;   <- deleta um id único */
delete from professores where professores_id in (1,2,3,4); /* <- deleta vários id's */

/* Atualizando um dado na tabela */
update professores set dominio2 = 'Data Science' where professores_id = 8;

update professores set professores_id = 1 where nome = 'Sandro Saorin';
update professores set professores_id = 2 where nome = 'André Juan';
update professores set professores_id = 3 where nome = 'Renata Marchese';
update professores set professores_id = 4 where nome = 'Larissa Moreira';

update professores set dominio3 = 'SQL' where professores_id = 4;

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EXPLICAÇÃO DE COMANDOS E SUAS FUNCIONALIDADES COM EXEMPLO PRÁTICO:

-- Criar uma tabela nomeado como funcionarios
-- e nessa tabela deve conter:
--	funcionario_id (integer)
--	nome
--	departamento
--	cargo
--	senioridade
--	salario numeric

create table funcionarios (
	funcionario_id integer,
	nome varchar(40),
	departamento varchar(40),
	cargo varchar(40),
	senioridade varchar(40),
	salario numeric (8,2));

insert into funcionarios values
	(1,'João Paulo','RH','Analista','Junior',2000),
	(2,'Lúcia','RH','Analista','Pleno',3000),
	(3,'Rosana','RH','Analista','Senior',4000),
	(4,'Elisabete','RH','Coordenador','Liderança',5000),
	(5,'Amanda','RH','Gerente','Gerência',7000),
	(6,'Rafael','Analytics','Analista','Junior',3000),
	(7,'Pedro','Analytics','Analista','Pleno',5000),
	(8,'Lucas','Analytics','Analista','Pleno',5000),
	(9,'Luiz Antônio','Analytics','Analista','Senior',7000),
	(10,'Giovanni','Analytics','Analista','Senior',7000),
	(11,'Nadia','Analytics','Coordenador','Liderança',9000),
	(12,'Carmen','Analytics','Gerente','Gerência',11000),
	(13,'Maurício','Dados','Analista','Pleno',5000),
	(14,'Bruno Silva','Dados','Analista','Senior',8000),
	(15,'Andressa','Dados','Cientista','Junior',5000),
	(16,'José de Sousa','Dados','Cientista','Junior',6500),
	(17,'Helena','Dados','Cientista','Pleno',7000),
	(18,'Bruna','Dados','Cientista','Pleno',7000),
	(19,'Bruno Pereira','Dados','Cientista','Pleno',8000),
	(20,'Bianca','Dados','Cientista','Senior',11000),
	(21,'Murilo','Dados','Coordenador','Liderança',12000),
	(22,'Gisele','Dados','Coordenador','Liderança',14000),
	(23,'Paulo','Dados','Gerente','Gerência',18000),
	(24,'Wesley','Dados','Engenheiro','Junior',6000),
	(25,'Vagner','Dados','Engenheiro','Pleno',9000),
	(26,'Léticia','Dados','Engenheiro','Pleno',9000),
	(27,'Sandro','Dados','Engenheiro','Senior',11000),
	(28,'Enzo','Dados','Engenheiro','Senior',12000),
	(29,'Lavinia','Dados','Engenheiro','Senior',12000),
	(30,'Andrei','Dev','Engenheiro de Software','Junior',4000),
	(31,'George','Dev','Engenheiro de Software','Junior',4000),
	(32,'Caio','Dev','Engenheiro de Software','Pleno',5000),
	(33,'Edna','Dev','Engenheiro de Software','Pleno',5000),
	(34,'Debora','Dev','Engenheiro de Software','Pleno',6500),
	(35,'Luiza','Dev','Engenheiro de Software','Pleno',6000),
	(36,'Pedro Henrique','Dev','Engenheiro de Software','Pleno',6000),
	(37,'Willian','Dev','Engenheiro de Software','Senior',7000),
	(38,'Viviane','Dev','Engenheiro de Software','Senior',9000),
	(39,'Mnnuel','Dev','Coordenador','Liderança',8000),
	(40,'Lurdes','Dev','Coordenador','Liderança',9500),
	(41,'Hygor','Dev','Gerente','Gerência',10000),
	(42,'Ana Paula','Financeiro','Analista','Junior',2000),
	(43,'Luciana','Financeiro','Analista','Junior',2000),
	(44,'Lorena','Financeiro','Analista','Junior',2500),
	(45,'Sara','Financeiro','Analista','Junior',2500),
	(46,'Cintia','Financeiro','Analista','Pleno',3000),
	(47,'Karina','Financeiro','Analista','Pleno',3000),
	(48,'Camila','Financeiro','Analista','Senior',3500),
	(49,'Afonso','Financeiro','Coordenador','Liderança',4500),
	(50,'Cibele','Financeiro','Gerente','Gerência',5000);


-- Comando SELECT 
select * 			-- <- Seleciona TUDO da tabela funcionarios
from funcionarios; 

select 				-- <- Seleciona as colunas especificas da tabela funcionarios
	nome,			-- cada coluna em uma linha, identado e com vírgula
	senioridade		-- não é necessário vírgula na última coluna requerida
from funcionarios;


-- Comando LIMIT 
select *			-- <- Seleciona TUDO da tabela funcionarios, mas com limite de linhas estabelecido
from funcionarios
limit 3;

-- Comando ORDER BY
select *		    -- <- Seleciona TUDO da tabela funcionarios, mas com limite de linhas estabelecido
from funcionarios	-- e com a ordenação dos ID's invertida para pegar os 3 últimos
order by funcionario_id desc
limit 3;

-- Comando WHERE
select *			-- <- Seleciona TUDO da tabela funcionarios, mas com limite de linhas estabelecido
from funcionarios	-- e especificando que os ID's devem ser maiores que 40. Isso tras os ID's em ordem crescente
where funcionario_id > 40;

select				-- <- Igual o restante, mas filtra de acordo com a senioridade
	departamento,
	salario
from funcionarios
where senioridade = 'Junior';

-- Comando GROUP BY
select				-- <- Igual o resto, mas agrupa de acordo com a coluna departamento (que foi selecionada) e
	departamento,	-- depois soma todos os valores dos salarios e acrescenta na coluna total_salarios (criada para inserção dessa soma)
	sum(salario) as total_salarios
from funcionarios
group by departamento
order by departamento;

select 
	departamento,	-- <- Igual o de cima, mas ao invés da soma ele faz a média e ordena tanto pelo departamento
	senioridade,	-- quanto pela senioridade.
	avg(salario) as media_salarial
from funcionarios
group by departamento, senioridade
order by departamento, senioridade;

-- Arredondando numeros quebrados com round
select 
	departamento,	
	senioridade,	
	ROUND(avg(salario)) as media_salarial
from funcionarios
group by departamento, senioridade
order by departamento, senioridade;

-- Comando COUNT
select				
	departamento,
	sum(salario) as total_salarios,
	count(salario) as qntd_funcionarios,
	round(sum(cast(salario as numeric)) / count(cast(salario as numeric)), 2) as salario_medio
from funcionarios
group by departamento
order by departamento;

-- comando cast
select 
	departamento,	
	senioridade,	
	ROUND(avg(cast(salario as numeric)), 2) as media_salarial
from funcionarios
group by departamento, senioridade
order by departamento, senioridade;

-- comando DISTINCT
select			-- <- Mostra os "tipos" de classificações que existem na coluna senioridade
	distinct senioridade
from funcionarios;