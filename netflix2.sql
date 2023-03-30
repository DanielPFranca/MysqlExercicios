create database netflix2;
use netflix2;

create table category(
	id bigint not null auto_increment,
	categoryname varchar(60),
	primary key(id)
);


create table film(
	id bigint not null auto_increment,
	title varchar(100) not null,
	imageURL varchar(200) not null,
	exhibitions numeric(10) not null,
    namecateFK bigint not null,
	synopsis varchar(100) not null,
    creationdate date not null,
    foreign key(namecateFK) references category(id),
    primary key(id)
);

create table plan(
	id bigint not null auto_increment,
    plan enum("Basic", "Premium", "Gold") not null,
    price decimal(10,2) not null,
    primary key(id)
);

alter table plan modify price numeric(10,2) not null;


create table users(
	id bigint not null auto_increment,
    username varchar(40) not null,
    email varchar(100) not null,
    planFK bigint not null,
    primary key(id),
    foreign key(planFK) references plan(id)
);


create table payments(
	id bigint not null auto_increment,
    userFK bigint not null,
    datepayment date not null,
    amountFK bigint not null,
    foreign key(userFK) references users(id),
    foreign key(amountFK) references plan(id),
    primary key(id)
);


insert into category(categoryname) values ("Ação"), ("Aventura"), ("Ficção Científica"), ("Terror");

insert into plan(plan, price) values ("Basic", "23.90"), ("Premium", "32.90"), ("Gold", "40.90");

insert into users(username, email, planFK) values ("Heittor", "heittor@gmail", 2), ("Jão", "jãocraftgames@gmail.com", 1), ("Valentina", "vava2007@gmail.com", 3);

insert into film(title, imageURL, exhibitions, namecateFK, synopsis, creationdate) values ("007", "www.007image.com", 5360, 1, "Muito brabo", "2021-02-25"), 
("A fuga das galinhas", "www.pintadinhaimage.com", 1302, 2, "O ataque ao galinheiro", "2013-05-13"), 
("O jogador N1", "www.n1image.com", 4782, 3, "Loucura na realidade virtual", "2018-10-25"), ("Chucky", "www.imageterror.com", 3024, 4, "A morte do carinha", "2010-05-09");

insert into payments(userFK, datepayment, amountFK) values (3, "2023-02-14", 3), (2, "2022-12-18", 1), (1, "2021-06-14", 2);

select p.amountFK, pn.plan, pn.price from payments p
inner join plan pn on pn.id = p.amountFK;

select title, exhibitions from film 
where exhibitions = (select max(exhibitions) from film) or exhibitions = (select min(exhibitions) from film);


select title ,max(exhibitions), min(exhibitions)from film 
group by title;

select * from film order by 4;
