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

select * from itens;

insert into registros (itemID, aluno, cursoFK, N_satisf, N_import) values 
(1, 'Heittor',1 , 'Bom', 'Alta'),
(2, 'Heittor',1 , 'Bom', 'Media'), 
(3, 'Heittor',1 , 'Regular', 'Alta'), 
(4, 'Heittor',1 , 'Otimo', 'Alta'), 
(5, 'Heittor',1 , 'Ruim', 'Media'), 
(6, 'Heittor',1 , 'Regular', 'Alta'), 
(7, 'Heittor',1 , 'Bom', 'Alta'),
(8, 'Heittor',1 , 'Ruim', 'Media'),
(9, 'Heittor',1 , 'Bom', 'Media'), 
(10, 'Heittor',1 , 'Ruim', 'Baixa'), 
(11, 'Heittor',1 , 'Bom', 'Alta'), 
(12, 'Heittor',1 , 'Bom', 'Media'), 
(13, 'Heittor',1 , 'Ruim', 'Media'),
(1, 'Daniel',7 , 'Bom', 'Alta'), 
(2, 'Daniel',7 , 'Regular', 'Alta'), 
(3, 'Daniel',7 , 'Ruim', 'Media'), 
(4, 'Daniel',7 , 'Otimo', 'Alta'), 
(5, 'Daniel',7 , 'Bom', 'Media'), 
(6, 'Daniel',7 , 'Ruim', 'Alta'), 
(7, 'Daniel',7 , 'Ruim', 'Baixa'),
(8, 'Daniel',7, 'Ruim', 'Media'),
(9, 'Daniel',7 , 'Otimo', 'Media'), 
(10, 'Daniel',7 , 'Bom', 'Alta'), 
(11, 'Daniel',7 , 'Bom', 'Alta'), 
(12, 'Daniel',7, 'Regular', 'Alta'), 
(13, 'Daniel',7 , 'Bom', 'Alta');



insert into registros (itemID, aluno, cursoFK, N_satisf, N_import) values 
(1, 'Julia',12 , 'Bom', 'Baixa'), 
(2, 'Julia',12 , 'Regular', 'Alta'), 
(3, 'Julia',12 , 'Ruim', 'Media'), 
(4, 'Julia',12 , 'Ruim', 'Alta'), 
(5, 'Julia',12 , 'Bom', 'Media'), 
(6, 'Julia',12 , 'Ruim', 'Alta'), 
(7, 'Julia',12 , 'Bom', 'Media'),
(8, 'Julia',12, 'Ruim', 'Media'),
(9, 'Julia',12 , 'Otimo', 'Media'), 
(10, 'Julia',12 , 'Regular', 'Baixa'), 
(11, 'Julia',12 , 'Bom', 'Alta'), 
(12, 'Julia',12, 'Regular', 'Alta'), 
(13, 'Julia',12 , 'Otimo', 'Media'),

(1, 'Luiza',2 , 'Ruim', 'Alta'), 
(2, 'Luiza',2 , 'Regular', 'Media'), 
(3, 'Luiza',2 , 'Ruim', 'Media'), 
(4, 'Luiza',2 , 'Ruim', 'Alta'), 
(5, 'Luiza',2 , 'Regular', 'Alta'), 
(6, 'Luiza',2 , 'Ruim', 'Alta'), 
(7, 'Luiza',2 , 'Bom', 'Media'),
(8, 'Luiza',2, 'Bom', 'Baixa'),
(9, 'Luiza',2 , 'Otimo', 'Media'), 
(10, 'Luiza',2 , 'Otimo', 'Alta'), 
(11, 'Luiza',2 , 'Bom', 'Alta'), 
(12, 'Luiza',2, 'Regular', 'Media'), 
(13, 'Luiza',2 , 'Ruim', 'Media'),

(1, 'Vitor',8 , 'Ruim', 'Alta'), 
(2, 'Vitor',8, 'Regular', 'Media'), 
(3, 'Vitor',8 , 'Ruim', 'Media'), 
(4, 'Vitor',8 , 'Ruim', 'Alta'), 
(5, 'Vitor',8 , 'Regular', 'Alta'), 
(6, 'Vitor',8 , 'Ruim', 'Alta'), 
(7, 'Vitor',8 , 'Bom', 'Media'),
(8, 'Vitor',8, 'Bom', 'Baixa'),
(9, 'Vitor',8 , 'Otimo', 'Media'), 
(10, 'Vitor',8 , 'Otimo', 'Alta'), 
(11, 'Vitor',8 , 'Bom', 'Alta'), 
(12, 'Vitor',8, 'Regular', 'Media'), 
(13, 'Vitor',8 , 'Ruim', 'Media'),

(1, 'Aldinan',8 , 'Regular', 'Baixa'), 
(2, 'Aldinan',8, 'Regular', 'Media'), 
(3, 'Aldinan',8 , 'Ruim', 'Baixa'), 
(4, 'Aldinan',8 , 'Ruim', 'Alta'), 
(5, 'Aldinan',8 , 'Regular', 'Media'), 
(6, 'Aldinan',8 , 'Bom', 'Baixa'), 
(7, 'Aldinan',8 , 'Bom', 'Media'),
(8, 'Aldinan',8, 'Bom', 'Alta'),
(9, 'Aldinan',8 , 'Otimo', 'Media'), 
(10, 'Aldinan',8 , 'Bom', 'Alta'), 
(11, 'Aldinan',8 , 'Bom', 'Media'), 
(12, 'Aldinan',8, 'Regular', 'Media'), 
(13, 'Aldinan',8 , 'Regular', 'Alta');


select * from curso;


insert into registros (itemID, cursoFK, N_satisf, N_import) values 
(1, 4 , 'Bom', 'Media'), 
(2, 4 , 'Regular', 'Alta'), 
(3, 4 , 'Ruim', 'Baixa'), 
(4, 4 , 'Otimo', 'Media'), 
(5, 4 , 'Bom', 'Media'), 
(6, 4 , 'Bom', 'Alta'), 
(7, 4 , 'Otimo', 'Baixa'),
(8, 4 , 'Ruim', 'Media'),
(9, 4 , 'Otimo', 'Media'), 
(10, 4 , 'Bom', 'Alta'), 
(11, 4 , 'Ruim', 'Baixa'), 
(12, 4 , 'Regular', 'Alta'), 
(13, 4 , 'Otimo', 'Alta'),

(1, 10 , 'Otimo', 'Alta'), 
(2, 10 , 'Regular', 'Alta'), 
(3, 10 , 'Bom', 'Media'), 
(4, 10 , 'Ruim', 'Media'), 
(5, 10 , 'Bom', 'Media'), 
(6, 10 , 'Ruim', 'Alta'), 
(7, 10 , 'Ruim', 'Baixa'),
(8, 10 , 'Ruim', 'Media'),
(9, 10 , 'Otimo', 'Media'), 
(10, 10 , 'Bom', 'Alta'), 
(11, 10 , 'Ruim', 'Alta'), 
(12, 10 , 'Regular', 'Alta'), 
(13, 10 , 'Regular', 'Alta'),

(1, 3 , 'Otimo', 'Alta'), 
(2, 3 , 'Regular', 'Alta'), 
(3, 3 , 'Bom', 'Media'), 
(4, 3 , 'Ruim', 'Media'), 
(5, 3 , 'Bom', 'Media'), 
(6, 3 , 'Ruim', 'Alta'), 
(7, 3 , 'Ruim', 'Baixa'),
(8, 3 , 'Ruim', 'Media'),
(9, 3 , 'Otimo', 'Media'), 
(10, 3 , 'Bom', 'Alta'), 
(11, 3 , 'Ruim', 'Alta'), 
(12, 3 , 'Regular', 'Alta'), 
(13, 3 , 'Regular', 'Alta'),

(1, 5 , 'Ruim', 'Alta'), 
(2, 5 , 'Regular', 'Alta'), 
(3, 5 , 'Regular', 'Baixa'), 
(4, 5 , 'Ruim', 'Media'), 
(5, 5 , 'Otimo', 'Alta'), 
(6, 5 , 'Ruim', 'Alta'), 
(7, 5 , 'Ruim', 'Media'),
(8, 5 , 'Bom', 'Media'),
(9, 5 , 'Otimo', 'Media'), 
(10, 5 , 'Bom', 'Alta'), 
(11, 5 , 'Ruim', 'Alta'), 
(12, 5 , 'Otimo', 'Baixa'), 
(13, 5 , 'Ruim', 'Baixa')
;

select * from curso;
select * from turma;
select * from registros;

#A)

select c.nome ,t.nome ,count(regID) from registros r
inner join curso c on r.cursoFK = c.cursoID
inner join turma t on t.turmaID = c.turmaFK
group by t.nome, c.nome;


#B)

select * from registros;
select * from itens;


select i.item ,count(*) as QTD, N_satisf from registros r
inner join itens i on i.itemID = r.itemID
group by i.itemID, N_satisf
having N_satisf like '%Ruim%' order by QTD desc limit 1;

#C)

select i.item ,count(*) as QTD, N_satisf from registros r
inner join itens i on i.itemID = r.itemID
group by i.itemID, N_satisf
having N_satisf like '%Otimo%' order by QTD desc limit 1;

#D)

select i.item ,count(*) as QTD, N_satisf, t.nome from registros r
inner join itens i on i.itemID = r.itemID
inner join curso c on c.cursoID = r.cursoFK
inner join turma t on t.turmaID = c.turmaFK
group by i.itemID, N_satisf, c.turmaFK
having N_satisf like '%Ruim%' order by QTD desc limit 1;

#E)

select i.item ,count(*) as QTD, N_satisf, t.nome from registros r
inner join itens i on i.itemID = r.itemID
inner join curso c on c.cursoID = r.cursoFK
inner join turma t on t.turmaID = c.turmaFK
group by i.itemID, N_satisf, c.turmaFK
having N_satisf like '%Otimo%' order by QTD desc limit 1;


#F)

select i.item ,count(*) as QTD, N_import from registros r
inner join itens i on i.itemID = r.itemID
group by i.itemID, N_import
having N_import like '%Baixa%' order by QTD desc limit 1;

#G)

select i.item ,count(*) as QTD, N_import from registros r
inner join itens i on i.itemID = r.itemID
group by i.itemID, N_import
having N_import like '%Alta%' order by QTD desc limit 1;

#H)

select i.item ,count(*) as QTD, N_import, t.nome from registros r
inner join itens i on i.itemID = r.itemID
inner join curso c on c.cursoID = r.cursoFK
inner join turma t on t.turmaID = c.turmaFK
group by i.itemID, N_import, c.turmaFK
having N_import like '%Baixa%' order by QTD desc limit 1;

#I)

select i.item ,count(*) as QTD, N_import, t.nome from registros r
inner join itens i on i.itemID = r.itemID
inner join curso c on c.cursoID = r.cursoFK
inner join turma t on t.turmaID = c.turmaFK
group by i.itemID, N_import, c.turmaFK
having N_import like '%Alta%' order by QTD desc limit 1;

#J)

select r.aluno, t.nome from registros r
inner join curso c on c.cursoID = r.cursoFK
inner join turma t on t.turmaID = c.turmaFK
where aluno is not null 
order by r.aluno, t.nome asc;
