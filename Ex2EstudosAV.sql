show tables;
select * from customers;
select * from employees;
#############################################
#A)

select c.customerName, count(employeeNumber), e.lastName as 'Employees'  from customers c 
inner join employees e on c.salesRepEmployeeNumber = e.employeeNumber
group by customerNumber;

#############################################
#B)
select * from customers;
select * from payments;

select c.customerNumber, c.customerName, sum(amount) 'Total de Compras' from customers c 
inner join payments p on c.customerNumber = p.customerNumber
group by c.customerNumber;



#############################################
#C)

select c.customerNumber, c.customerName, avg(amount) 'Média de Compras' from customers c 
inner join payments p on c.customerNumber = p.customerNumber
group by c.customerNumber;


#############################################
#D)

select * from employees;
select * from offices;

select o.officeCode, o.addressLine1 as 'Endereço 1', count(employeeNumber) as 'Total de funcionarios' from offices o
inner join employees e on o.officeCode = e.officeCode
group by officeCode;

#############################################
#E)

select * from employees;
select * from customers;

select e.firstName as 'Funcionários' , count(orderNumber) as 'Total de vendas' from employees e
inner join customers c on e.employeeNumber = c.salesRepEmployeeNumber
inner join orders o on o.customerNumber = c.customerNumber
group by employeeNumber;

#############################################
#F)
select * from products;
select * from orderdetails;

select p.productName, o.quantityOrdered  from orderdetails o 
inner join products p on p.productCode = o.productCode
order by quantityOrdered desc limit 5;

#############################################
#G)















