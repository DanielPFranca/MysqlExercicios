

select c.*, ct.celular from clientes c
inner join contatos ct on c.id = ct.clienteID;

select c.nome as Cliente, p.nome as Produto from clientes c
inner join vendas v on c.id = v.clienteID
inner join vedas_itens vd on v.id = vd.vendaID
inner join produtos p on p.id = vd.produtoID;







