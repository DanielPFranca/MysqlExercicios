create database notafiscal2;
use notafiscal2;

create table resellers(
	id bigint not null auto_increment,
    name varchar(40) not null,
    email varchar(50) not null,
    cnpj varchar(14) not null,
    primary key(id)
);


create table invoice(
	id bigint not null auto_increment,
    invoiceKey varchar(50) not null,
    dtIssue date,
    totalInvoice numeric(10) not null,
    primary key(id)
);


create table invoicedetails(
	id bigint not null auto_increment,
    invoiceFK bigint not null,
    productFK bigint not null,
    quantity int not null,
    unitValue decimal(10,2),
    primary key(id),
    foreign key(invoiceFK) references invoice(id),
    foreign key(productFK) references products(id)
);



create table products(
	id bigint not null auto_increment,
	productCode numeric(10) not null,
    category varchar(30) not null,
    description varchar(50) not null,
    status enum("Ativo", "Inativo") not null,
    regisDate date not null,
    primary key(id)
);

alter table products modify regisDate datetime not null default now();
alter table products modify productCode numeric(10) not null;

create table custumerreseller(
	id bigint not null auto_increment,
    customerFK bigint not null,
    resellerFK bigint not null,
    productFK bigint not null,
    foreign key(customerFK) references customers(id),
    foreign key(resellerFK) references resellers(id),
    foreign key(productFK) references products(id),
    primary key(id)
);



create table customers(
	id bigint not null auto_increment,
    name varchar(50) not null,
    email varchar(50) not null,
    cnpj varchar(14) not null,
    primary key(id)
);




insert into resellers(name, email, cnpj) values ("reseller A", "revenda1@gmail.com", "00006371823495"), 
("reseller B", "revenda2@gmail.com","00003892031234"),("reseller C", "revenda3@gmail.com", "00003947856313");
select * from customers;

insert into customers (name, email, cnpj) values ("Cliente A","CLA@gmail.com", "00003726178923"),
("Cliente B", "CLB@gmail.com", "00009873561298"), ("ClienteC", "CLC@gmail.com", "00004728934678");

insert into invoice (invoiceKey, dtIssue, totalInvoice) values ("3728910412", "2020-11-23", "1000"), ("1390458235","2021-02-21","1500"),
("1230493402", "2022-10-16", "250");

insert into products(productCode, category, description, status, regisDate) values ("319230123", "Eletrônicos", "Celular", "Ativo", "2021-05-12"),
("3123021330", "Móveis", "Guarda-Roupa", "Inativo", "2022-01-10"), ("3910249520", "Eletrodomésticos", "Ventilador", "Ativo", "2023-03-30");

insert into custumerreseller(customerFK, resellerFK, productFK) values ("1", "2", "3"), ("2", "1", "3"), ("2", "1", "1"), 
("3", "3", "4"), ("1", "1", "3");

insert into invoicedetails (invoiceFK, productFK, quantity, unitValue) values ("1", "1", "54", "1000.90"), ("2", "3", "120", "1500.90"), ("3", "4", "950", "250.00");

select * from custumerreseller;

#####################################

select p.description, c.productFK from products p
inner join custumerreseller c on p.id = c.productFK 
group by productFK having count(*) > 2; 

#####################################

select * from customers c
inner join custumerreseller cr on c.id = cr.productFK;

#####################################




######################################
#where productFK = (select max(productFK)from custumerreseller);

delete from products
where id = 2;




