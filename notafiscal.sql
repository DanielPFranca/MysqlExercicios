create database notafiscal;
use notafiscal;

create table resellers(
	id bigint not null auto_increment,
    name varchar(40) not null, 
    phone numeric(11) not null,
    email varchar(50) not null,
    primary key(id)
);

create table products(
	id bigint not null auto_increment,
	productCode numeric(10) not null,
    category varchar(30) not null,
    description varchar(50) not null,
    
);

create table customers(
	id bigint not null auto_increment,
    name varchar(50) not null,
    phone numeric(11) not null,
    resellerFK bigint not null,
    email varchar(50) not null,
    primary key(id),
    foreign key(resellerFK) references reseller(id)
);


