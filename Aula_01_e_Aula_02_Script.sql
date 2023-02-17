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