create database warehouseD;
use warehouseD;

create table productlines(
	productLine_id bigint not null auto_increment,
	textDescription varchar(60) not null,
	htmlDescription varchar(60) not null,
	image varchar(60),
	primary key (productLine_id)
);

create table products(
	productCode_id bigint not null auto_increment,
	productName varchar(40) not null,
	productLineFK bigint not null,
	productScale bigint             , 
	productVendor varchar(40) not null,
	productDescription varchar(40) not null,
	quantilyInStock numeric(20) not null,
	buyPrice numeric(10,3) not null,
	MSRP numeric (10,3) not null,
	primary key(productCode_id),
	foreign key(productLineFK) references productlines(productLine_id)
);

alter table products modify productScale varchar(40) not null;



create table offices(
	officeCode_id bigint not null auto_increment,
	city varchar(50) not null,
	phone numeric(11) not null,
	addressLine1 varchar(50) not null,
	addressLine2 varchar(50) not null,
	state varchar(50) not null,
	country varchar(50) not null,
	postalCode numeric(10) not null,
	territory varchar(50) not null,
	primary key(officeCode_id)
);


create table employees(
	employeeNumber_id bigint not null auto_increment,
	lastName varchar(20) not null,
	firstName varchar(20) not null,
	extension varchar(40) not null,
	email varchar(60) not null,
	officeCodeFK bigint not null,
	reportsTo varchar(50) not null,
	jobTitle varchar(50) not null,
	primary key(employeeNumber_id),
	foreign key(officeCodeFK) references offices(officeCode_id)

);

create table customers(
		customerNumber_id bigint not null auto_increment,
		custumerName varchar(40) not null,
		contactLastName varchar(40) not null,
		contactFirstName varchar(40) not null,
		phone numeric(11) not null,
		addressLine1 varchar(60) not null,
		addressLine2 varchar(60) not null,
		city varchar(40) not null,
		state varchar(40) not null,
		postalCode numeric(8) not null,
		country varchar(40) not null,
		salesRepEmployeeNumberFK bigint not null,
		creditLimit numeric(30) not null,
		primary key(customerNumber_id),
        foreign key(salesRepEmployeeNumberFK) references employees(employeeNumber_id)
);


create table orders(
	orderNumber_id bigint not null auto_increment,
	orderDate datetime not null default now(),
	requiredDate datetime not null default now(),
	shippedDate datetime not null default now(),
	status varchar(30) not null,
	comments varchar(60) not null,
    custumerNumberFK bigint not null,
    primary key(orderNumber_id),
    foreign key(custumerNumberFK) references customers(customerNumber_id)
);


create table orderdetails(
	orderNumber_id bigint not null auto_increment,
	productCodeFK bigint not null,
	quantityOrdered numeric(10) not null,
	priceEach numeric(10,2) not null,
	orderLineNumber bigint not null,
	primary key(orderNumber_id),
	foreign key(productCodeFK) references products(productCode_id),
    foreign key(orderLineNumber) references orders(orderNumber_id)
);


create table payments(
	customerNumberFK bigint not null,
	checkNumber_id bigint not null auto_increment,
	paymentDate datetime not null default now(),
	amount numeric(15) not null,
	primary key(checkNumber_id),
	foreign key(customerNumberFk) references customers(customerNumber_id)

);

insert into productLines(textDescription, htmlDescription, image) values ("perfumes", "www.perfumes.com.br", "imagem do perfume");
insert into productLines(textDescription, htmlDescription, image) values ("desodorantes", "www.desodorantes.com.br", "imagem do desodorante");
insert into productLines(textDescription, htmlDescription, image) values ("cremes", "www.cremes.com.br", "imagem do creme");

select * from productLines;

insert into products(productName, productLineFK, productScale, productVendor, productDescription, quantilyInStock, buyPrice, MSRP) values
("Egeo", "1", "Grande", "Empresa A", "Doce", "2000", "150", "200");
insert into products(productName, productLineFK, productScale, productVendor, productDescription, quantilyInStock, buyPrice, MSRP) values
("Zaad", "1", "Média", "Empresa B", "Amadeirado", "2030", "220", "280");
insert into products(productName, productLineFK, productScale, productVendor, productDescription, quantilyInStock, buyPrice, MSRP) values
("Lily", "3", "Pequena", "Empresa C", "Doce", "500", "80", "95");
insert into products(productName, productLineFK, productScale, productVendor, productDescription, quantilyInStock, buyPrice, MSRP) values
("Aerosol", "2", "Média", "Empresa D", "Suave", "300", "30", "35");

select * from products;

insert into orderdetails(productCodeFK, quantityOrdered, priceEach, orderLineNumber) values ("1", "100", "150", "1"),("3", "230", "80", "3"),("2", "150", "220", "2"),("4", "330", "30", "4");

select * from orderdetails;

insert into offices(city, phone, addressLine1, addressLine2, state, country, postalCode, territory) values
("Campinas", "1947389012", "R. São Jorge", "R. São Bento", "São Paulo", "Brasil", "13043432", "Brasileiro");
insert into offices(city, phone, addressLine1, addressLine2, state, country, postalCode, territory) values
("Osasco", "1174928465", "R. Silva", "R. Pereira", "São Paulo", "Brasil", "150367893", "Brasileiro");
insert into offices(city, phone, addressLine1, addressLine2, state, country, postalCode, territory) values
("Americana", "1968431238", "R. Camargo", "R. Tiradentes", "São Paulo", "Brasil", "13065892", "Brasileiro");
insert into offices(city, phone, addressLine1, addressLine2, state, country, postalCode, territory) values
("Jundiai", "1978077538", "R. Rodrigues", "R. Marcelina", "São Paulo", "Brasil", "13068936", "Brasileiro");

select * from offices;

insert into employees(lastName, firstName, extension, email, officeCodeFK, reportsTo, jobTitle) values
("Silva", "Gabriel", "Recepção", "gabrielsilva@gmail.com", "2", "Central", "Atendente");
insert into employees(lastName, firstName, extension, email, officeCodeFK, reportsTo, jobTitle) values
("Souza", "Felipe", "Estoque", "felipesouza123@gmail.com", "3", "Central", "Repositor");
insert into employees(lastName, firstName, extension, email, officeCodeFK, reportsTo, jobTitle) values
("Pinheiro", "Daniel", "Escritório", "pinheirodaniel12@gmail.com", "1", "Central", "Gerente");
insert into employees(lastName, firstName, extension, email, officeCodeFK, reportsTo, jobTitle) values
("Varela", "Lucas", "Comercio exterior", "lucasvarela2@gmail.com", "4", "Central", "Motorista");

select * from employees;

insert into customers(custumerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, postalCode, state, country, salesRepEmployeeNumberFK, creditLimit)
values ("João", "Souza", "João", "1934728930", "R. São Pedro", "R. Francisco", "Campinas", "13348745", "São Paulo", "Brasil", "3", "3000");
insert into customers(custumerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, postalCode, state, country, salesRepEmployeeNumberFK, creditLimit)
values ("Paulo", "Oliveira", "Paulo", "1936748923", "R. Aleves, ", "R. Pessoa", "Maceió", "1302347", "Pernambuco", "Brasil", "4", "4500");
insert into customers(custumerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, postalCode, state, country, salesRepEmployeeNumberFK, creditLimit)
values ("Jonas", "Santos", "Jonas", "1947853798", "R. São Vincente", "R. Anchieta", "Campinas", "1304378", "São Paulo", "Brasill", "2", "3500");
insert into customers(custumerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, postalCode, state, country, salesRepEmployeeNumberFK, creditLimit)
values ("Pedro", "Henrique", "Pedro", "1934478920", "R. São Mantin", "R. Francis", "Salvador", "1494368", "Minas Gerais", "Brasil", "1", "2500");
insert into customers(custumerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, postalCode, state, country, salesRepEmployeeNumberFK, creditLimit)
values ("Pedro", "Henrique", "Pedro", "1934478920", "R. São Mantin", "R. Francis", "Salvador", "1494368", "Minas Gerais", "Brasil", "1", "2500");
select *from customers;

insert into orders(orderDate, requiredDate, shippedDate, status, comments, custumerNumberFK) values
("2023-02-14", "2023-03-10", "2023-02-25", "Enviado", "5 horas até o local", "3");
insert into orders(orderDate, requiredDate, shippedDate, status, comments, custumerNumberFK) values
("2022-10-14", "2022-11-10", "2022-11-15", "Enviado", "4 horas até o local", "1");
insert into orders(orderDate, requiredDate, shippedDate, status, comments, custumerNumberFK) values
("2022-06-05", "2022-07-13", "2022-07-15", "Em preparo", "Uma semana para chegar", "2");
insert into orders(orderDate, requiredDate, shippedDate, status, comments, custumerNumberFK) values
("2022-10-16", "2022-11-11", "2022-11-29", "Entregue", "Seu pedido foi entregue", "4");

select * from orders;

insert into payments(customerNumberFK, paymentDate, amount) values
("3", "2023-03-10", "80");
insert into payments(customerNumberFK, paymentDate, amount) values
("2", "2022-06-05", "150");
insert into payments(customerNumberFK, paymentDate, amount) values
("4", "2022-11-11", "230");
insert into payments(customerNumberFK, paymentDate, amount) values
("1", "2022-11-10", "330");

SELECT p.amount, p.paymentDate, c.custumerName, c.creditLimit
FROM payments p
INNER JOIN customers c ON p.checkNumber_id = c.customerNumber_id;

select c.custumerName, e.firstName, e.email
from customers c 
inner join employees e on c.customerNumber_id = e.employeeNumber_id;


