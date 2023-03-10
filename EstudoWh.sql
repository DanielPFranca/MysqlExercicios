select * from customers c
inner join employees e on c.salesRepEmployeeNumber = e.employeeNumber
inner join offices o 
on e.officeCode = o.officeCode
inner join payments p
on p.customerNumber = p.customerNumber
inner join orders od 
on od.customerNumber = c.customerNumber
inner join orderdetails d
on d.orderNumber = od.orderNumber
inner join products pr 
on pr.productCode = d.productCode
inner join productlines pl
on pl.productLine = pr.productLine;

## COMO RENOMEAR ITENS ESPECÍFICOS##

select customerName as Nome, phone as telefone,
e.firstName as funcionario
from customers c
inner join employees e
on e.employeeNumber = c.salesRepEmployeeNumber;


-- SELECIONAR EM UMA CONDIÇÃO ESPECÍFICA -- 
select * from customers where country = "USA" and (city = "San Francisco" or city = "Las Vegas");

select * from customers where country = "France" and city in ("San Francisco", "Las Vegas", "New Haven");

select * from customers where country = "France" and creditLimit > 10000;


-- SELECIONAR EM CONDIÇÃO E ORDERNAR OS RESULTADOS -- 
select * from customers where country = "France" and creditLimit > 10000 order by customerName desc;

select * from customers where country = "France" and creditLimit > 10000 order by creditLimit asc;

-- COMANDOS PARA SELECIONAR PARCIALMETE TEXTOS -- 
select * from customers where customerName like "A%";

select * from customers where customerName like "%O";

select * from customers where customerName like "%mini%";



select count(*) as totalClientes from customers;

select count(*) as totalClientes from customers
where creditLimit > 25000;

select country as Paises, count(*) as QuantidadePaises from customers group by country order by country asc;


-- DESAFIO DO EXERCICIO WAREHOUSE --
select c.customerName, p.productName from orders o 
inner join orderdetails od on od.orderNumber = o.orderNumber
inner join products p on p.productCode = od.productCode
inner join customers c on c.customerNumber = o.customerNumber
where p.productName like "%Ferrari%";

select c.customerName, count(*) as total
from orders o
inner join customers c on c.customerNumber = o.customerNumber
group by c.customerNumber having total > 2;


select * from orders;
select * from products;
select * from customers;