create database notafiscal;
use notafiscal;

create table resellers(
	id bigint not null auto_increment,
    name varchar(40) not null,
    email varchar(50) not null,
    cnpj varchar(14) not null
    primary key(id)
);


create table invoice(
	id bigint not null auto_increment,
    invoiceKey varchar(50) not null,
    dtIssue date default now(),
    totalInvoice numeric(10) not null,
    cnpjFKC bigint not null,
    cnpjFKR bigint not null,
    productFK bigint not null,
    amount int not null,
    foreign key(cnpjFKC) references customers(id),
    foreign key(cnpjFKR) references resellers(id),
    primary key(id)
);

create table invoicedetails(
	

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

create table custumerreseller(
	id bigint not null auto_increment,
    customerFK bigint not null,
    resellerFK bigint not null,
    foreign key(customerFK) references customers(id),
    foreign key(resellerFK) references resellers(id),
    primary key(id)
);

create table customers(
	id bigint not null auto_increment,
    name varchar(50) not null,
    resellerFK bigint not null,
    email varchar(50) not null,
    cnpj varchar(14) not null,
    primary key(id),
    foreign key(resellerFK) references reseller(id)
);

