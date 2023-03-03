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

create table departamentos(
departamentos_id bigint not null auto_increment,
nomeDepart varchar(30) not null,
gerenteFK bigint not null,
primary key(departamentos_id),
foreign key(gerenteFK) references funcionarios(funcionarios_id)
);

create table depart_func(
depart_func_id bigint not null auto_increment,
departamentoFK bigint not null,
funcionarioFK bigint not null,
dtInicio date not null,
dtFim date,
primary key(depart_func_id),
foreign key(departamentoFK) references departamentos(departamentos_id),
foreign key(funcionarioFK) references funcionarios(funcionarios_id)
);

insert into cargos (nomeCargo) 
values ("Auxiliar de Limpeza"),("Auxiliar de Adm"), ("Operador de máquina"), ("Desenvolvedor") ;
select * from cargos;

insert into funcionarios (nome,dtNasc,CPF,genero,dtContrat) 
values ("HEITTOR", "1998-05-12", 15336874112, "M", date(now())), ("FELIPE", "2000-05-12", 12547896144, "M", date(now())), ("PATRICIA", "1994-04-23", 36887410233, "F", date(now())); 
SELECT * FROM FUNCIONARIOS;

DELETE FROM FUNCIONARIOS WHERE funcionarios_id IN (4,5,6);