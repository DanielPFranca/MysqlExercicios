create database ficha;
use ficha;

create table turma(
	turmaID bigint not null auto_increment,
    nome varchar(30) not null,
    periodo enum("Manha", "Tarde", "Noite") not null,
    primary key(turmaID)
);


create table curso(
	cursoID bigint not null auto_increment,
    nome varchar(30) not null,
    turmaFK bigint not null,
    primary key(cursoID),
    foreign key (turmaFK) references turma(turmaID)
);



create table itens(
	itemID bigint not null auto_increment,
    item varchar(200) not null,
    primary key (itemID)
);

create table registros(
	regID bigint not null auto_increment,
    itemID bigint not null,
    aluno varchar(30) null,
    cursoFK bigint not null,
    N_satisf enum('Ruim', 'Regular', 'Bom', 'Otimo') not null,
    N_import enum('Alta', 'Media', 'Baixa') not null,
    primary key(regID),
    foreign key (cursoFK) references curso(cursoID)
);


create table observacoes(
	observacaoID bigint not null auto_increment,
    observacao text null,
    registroFK bigint not null,
	primary key(observacaoID),
    foreign key (registroFK) references registros(regID)
);



insert into turma (nome, periodo) values ('A', 'Manha'), ('A', 'Tarde'), ('A', 'Noite'), ('B', 'Manha'), ('B', 'Tarde'), ('B', 'Noite'), ('C', 'Manha'), ('C', 'Tarde'), ('C', 'Noite');

insert into curso (nome, turmaFK) values ('Desenvolvimento de Sistemas', '3'), ('Desenvolvimento de Sistemas', '6'), ('Desenvolvimento de Sistemas', '9'),
('Mecânica', '1'), ('Mecânica', '4'), ('Mecânica', '7'), ('Mecatrônica', '2'), ('Mecatrônica', '5'), ('Mecatrônica', '8'), ('Eletrônica', '1'), ('Eletrônica', '5'), ('Eletrônica', '9'); 
select * from turma;
select * from curso;

insert into itens (item) values ('Limpeza e conservação da sala de aula e da oficina'),
('Disponibilidade de equipamentos, máquinas e ferramentas para realização do curso'),
('Qualidade de apostilas, livros e textos, quanto a impressão e a adequação da informação'),
('Cumprimento do horário das aulas'),
('Cumprimento dos objetivos propostos para o curso'),
('Preocupação do docente com o aproveitamento dos alunos'),
('Domínio do docente sobre os assuntos tratados'),
('O aprendizado, na teoria e na prática, em relação ao esperado'),
('Conteúdo do curso, em relação às expectativas'),
('Atendimento da recepção / secretaria da escola'),
('Atendimento telefônico da escola'),
('Atendimento da cantina / lanchonete'),
('Atendimento da Biblioteca');

insert into registros (itemID, aluno, cursoFK, N_satisf, N_import) values (1, 'Heittor',1 , 'Bom', 'Alta'), (2, 'Heittor',1 , 'Bom', 'Media'), (3, 'Heittor',1 , 'Regular', 'Alta'), (4, 'Heittor',1 , 'Baixa', 'Alta'), (5, 'Heittor',1 , 'Ruim', 'Media'), (6, 'Heittor',1 , 'Regular', 'Alta'), (7, 'Heittor',1 , 'Bom', 'Alta'),
(8, 'Heittor',1 , 'Ruim', 'Media'),(9, 'Heittor',1 , 'Bom', 'Media'), (10, 'Heittor',1 , 'Ruim', 'Baixa'), (11, 'Heittor',1 , 'Bom', 'Alta'), (12, 'Heittor',1 , 'Bom', 'Media'), (13, 'Heittor',1 , 'Ruim', 'Media'),
(1, 'Daniel',7 , 'Bom', 'Alta'), (2, 'Daniel',7 , 'Regular', 'Alta'), (3, 'Daniel',7 , 'Ruim', 'Media'), 
(4, 'Daniel',7 , 'Baixa', 'Alta'), (5, 'Daniel',7 , 'Bom', 'Media'), (6, 'Daniel',7 , 'Ruim', 'Alta'), (7, 'Daniel',7 , 'Ruim', 'Baixa'),
(8, 'Daniel',7, 'Ruim', 'Media'),(9, 'Daniel',7 , 'Bom', 'Media'), (10, 'Daniel',7 , 'Bom', 'Alta'), (11, 'Daniel',7 , 'Bom', 'Alta'), (12, 'Daniel',7, 'Regular', 'Alta'), (13, 'Daniel',7 , 'Bom', 'Alta');


insert into registros (itemID, cursoFK, N_satisf, N_import) values (1,7 , 'Bom', 'Alta'), (2,7 , 'Regular', 'Alta'), (3,7 , 'Ruim', 'Media'), 
(4,1 , 'Ruim', 'Media'), (5, 1 , 'Bom', 'Media'), (6, 1 , 'Ruim', 'Alta'), (7, 1 , 'Ruim', 'Baixa'),
(8, 1 , 'Ruim', 'Media'),(9, 1 , 'Regular', 'Media'), (10, 1 , 'Bom', 'Alta'), (11, 1 , 'Bom', 'Alta'), (12, 1 , 'Regular', 'Alta'), (13, 1 , 'Bom', 'Alta');








