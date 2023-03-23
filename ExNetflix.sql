create database netflix;
use netflix;

create table category(
	id bigint not null auto_increment,
	name varchar(60),
	primary key(id)
);

create table film(
	id bigint not null auto_increment,
	title varchar(100) not null,
	imageURL varchar(200) not null,
	exhibitions numeric(10) not null,
    categoryFK bigint not null,
	synopsis varchar(100) not null,
    creationdate date not null,
    foreign key(categoryFK) references category(id),
    primary key(id)
);

create table plan(
	id bigint not null auto_increment,
    plan enum("Basic", "Premium", "Gold") not null,
    value decimal(10,2) not null,
    primary key(id),
    
);


create table users(
	id bigint not null auto_increment,
    firstname varchar(40) not null,
    lastname varchar(40) not null,
    email varchar(100) not null,
    plan enum("Basic", "Premium", "Gold") not null,
    value decimal(10,2) not null,
    primary key(id)
);


create table payments(
	id bigint not null auto_increment,
    userFK bigint not null,
    datepayment date not null,
    foreign key(userFK) references users(id),
    primary key(id)
);




