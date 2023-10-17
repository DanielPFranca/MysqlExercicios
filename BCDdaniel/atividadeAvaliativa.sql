select c.*, ct.celular from clientes c
inner join contatos ct on c.id = ct.clienteID;

select c.nome as Cliente, p.nome as Produto from clientes c
inner join vendas v on c.id = v.clienteID
inner join vedas_itens vd on v.id = vd.vendaID
inner join produtos p on p.id = vd.produtoID;

select *from vendas;

select c.nome, p.nome from clientes c
inner join vendas v on c.id = v.clienteID
inner join vedas_itens vi on vi.vendaID = v.id
inner join produtos p on p.id = vi.produtoID;




select c.nome, v.Total  from vendas v
inner join clientes c on c.id = v.clienteID
order by v.Total asc;



select m.nome, v.Total from vendas v
inner join medicos m on v.medicoID = m.id
order by v.Total desc;

select *from vendas;



select sum(Total) , count(id) as Vendas, date(Data) from vendas
group by Data;


select sum(Total) as 'Faturamento das Vendas' from vendas;














