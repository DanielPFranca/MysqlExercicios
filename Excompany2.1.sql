create database ExCompany;
use ExCompany;

create table funcionarios(
funcionarios_id bigint not null auto_increment,
nome varchar(30) not null,
dtNasc date not null,
CPF varchar(11) not null,
genero char(5),
dtContrat date not null,
primary key(funcionarios_id)
);

create table cargos(
cargos_id bigint not null auto_increment,
nomeCargo varchar(30) not null,
primary key(cargos_id)
);

create table salarios(
salario_id bigint not null auto_increment,
funcionarioFK bigint not null,
cargoFK bigint not null,
salarioBruto numeric(10,2) not null,
dtInicio date not null,
dtFim date,
primary key(salario_id),
foreign key(funcionarioFK) references funcionarios(funcionarios_id),
foreign key(cargoFK) references cargos(cargos_id)
);

#alterei a tabela departamentos e a departFunc. Inseri dados na tabela salarios. 
#Adicionar os dados nas tableas restantes e executar os inner join
#Criar a tabela departamentoGerente 


create table departamentos(
departamento_id bigint not null auto_increment,
nomeDepart varchar(50),
primary key(departamento_id)
);

create table departFunc(
departFunc_id bigint not null auto_increment,
departamentoFK bigint not null,
funcionarioFK bigint not null,
dtInicio date not null,
dtFim date,
primary key(departFunc_id),
foreign key(departamentoFK) references departamentos(departamento_id),
foreign key(funcionarioFK) references funcionarios(funcionarios_id)
);

create table departGerentes(
departGerentes_id bigint not null auto_increment,
departamentoFK bigint not null,
funcionarioFK bigint not null,
dtInicio date not null,
dtFim date,
primary key(departGerentes_id),
foreign key(departamentoFK) references departamentos (departamento_id),
foreign key(funcionarioFK) references funcionarios (funcionarios_id)
);



insert into cargos (nomeCargo) 
values ("Auxiliar de Limpeza"),("Auxiliar de Adm"), ("Operador de máquina"), ("Desenvolvedor") ;
select * from cargos;

insert into funcionarios (nome,dtNasc,CPF,genero,dtContrat) 
values ("HEITTOR", "1998-05-12", 15336874112, "M", date(now())), ("FELIPE", "2000-05-12", 12547896144, "M", date(now())), ("PATRICIA", "1994-04-23", 36887410233, "F", date(now())); 
SELECT * FROM FUNCIONARIOS;

insert into salarios (funcionarioFK, cargoFK, salarioBruto, dtInicio, dtFim)
values ("1", "4", "5400", "2022-05-20", "2023-10-15");
insert into salarios (funcionarioFK, cargoFK, salarioBruto, dtInicio, dtFim)
values ("3", "2", "4500", "2021-07-24", "2022-11-25"), ("2", "3", "6000", "2020-02-12", "2023-01-17");
select * from salarios;

insert into departamentos (nomeDepart)
values ("TI"), ("ADM");
select * from departamentos;
insert into departfunc (departamentoFK, funcionarioFK, dtInicio, dtFim)
values ("1", "1", "2022-05-20", "2023-10-15"), ("2", "3", "2021-07-24", "2022-11-25"), ("2", "2", "2020-02-12", "2023-01-17");

select * from departfunc;

insert into departgerentes (departamentoFK, funcionarioFK, dtInicio, dtFim)
values ("1", "1", "2022-05-20", "2023-10-15"), ("2", "3", "2021-07-24", null);

select * from departgerentes;

SELECT f.nome, s.salarioBruto
FROM funcionarios f
JOIN salarios s ON f.funcionarios_id = s.funcionarioFK
WHERE s.salarioBruto > 5000;

