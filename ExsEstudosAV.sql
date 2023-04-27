use exercicio_licensas;

select * from lcliente;
########################################
#A)
select count(*) as 'Qtd Clientes'from lcliente;

########################################
#B)
select * from llicenca where month(DtAquisicao) = 09;

#########################################
#C)
select * from llicenca where year(DtAquisicao) = 2007 and month(DtAquisicao) = 05;


#########################################
#D)

select DescricaoTipo, idTIPO_Empresa, mid(DescricaoTipo, 1, 5) as '5 primeiras letras' from ltipo_empresa
order by DescricaoTipo asc;

#########################################
#E)

select DescricaoTipo, idTIPO_Empresa, MID(DescricaoTipo, -5, 5) as '5 últimas letras' from ltipo_empresa
order by DescricaoTipo desc;

#########################################
#F)
select * from ltipo_empresa;
select DescricaoTipo, idTIPO_Empresa, MID(DescricaoTipo, 6, 5) as 'Da 6 à 10 letra' from ltipo_empresa;

#########################################
#G)

select * from lcliente;
select Nome_RazaoSocial, LENGTH(Nome_RazaoSocial) as 'BYTES' from lcliente;

#########################################
#H)

select * from llicenca;

select NumLicenca, count(DtAquisicao) from llicenca;

SELECT NumLicenca, DATEDIFF(NOW(), DtAquisicao) as dias
FROM llicenca;
																			#REVER
SELECT NumLicenca, DATEDIFF(NOW(), DtAquisicao) AS dias
FROM llicenca
GROUP BY NumLicenca;

SELECT TIMESTAMPDIFF(day,'2003-02-01','2003-05-01'); 

select day(DtAquisicao), count(*) from llicenca
group by DtAquisicao;

select * from llicenca;

#########################################
#I)

select upper(NomeSetor) as 'Maiúsculo', lcase(NomeSetor) as 'Minúsculo' from lsetor;
select * from lsetor;

#########################################
#J)

select s.NomeSoftware as 'Nome', v.Versao as 'Versão' from lsoftware s
inner join lversao v on s.idSOFTWARE = v. idSOFTWARE_FK;

select * from lversao;
#########################################
#K)
select * from lcliente;
select * from ltipo_empresa;
select * from lsetor;

select c.Nome_RazaoSocial as 'Nome', e.DescricaoTipo as 'Tipo de Empresa', s.NomeSetor as 'Setor' from lcliente c 
inner join ltipo_empresa e on e.idTIPO_Empresa = c.idTIPO_Empresa_FK
inner join lsetor s on s.idSetor = c.idSETOR_FK
order by e.DescricaoTipo, s.NomeSetor asc;

#########################################
#L)
select * from lcliente;
select * from llicenca;

select c.idCLIENTE, c.Nome_RazaoSocial, l.NumLicenca, l.DtAquisicao, l.ValorAquisicao 
from lcliente c
inner join llicenca l on c.idCLIENTE = l.idCLIENTE_FK;

#########################################
#M)
select * from lcliente;
select * from lsoftware;
select * from llicenca;

select distinct( c.Nome_RazaoSocial) as 'Cliente', s.NomeSoftware as 'Software' from lcliente c
inner join llicenca l on c.idCLIENTE = l.idCLIENTE_FK
inner join lsoftware s on s.idSOFTWARE = l.idSOFTWARE_FK_FK
order by Nome_RazaoSocial asc;

#########################################
#N)
select * from lcliente order by Nome_RazaoSocial asc;
select * from lsetor;

select c.Nome_RazaoSocial, s.NomeSetor, c.UF from lcliente c
inner join lsetor s on c.idSETOR_FK = s.idSETOR
where c.UF in ('SP', 'RS', 'PR', 'MG');

#########################################
#O)

select * from lsoftware;
select * from lcliente;
select * from lversao;
select * from llicenca;

select s.NomeSoftware, v.Versao, c.Nome_RazaoSocial, l.DtAquisicao, t.DescricaoTipo, st.NomeSetor from llicenca l 
inner join lcliente c on c.idCLIENTE = l.idCLIENTE_FK
inner join lsoftware s on s.idSOFTWARE = l.idSOFTWARE_FK_FK
inner join lversao v on v.idSOFTWARE_FK = s.idSOFTWARE
inner join ltipo_empresa t on t.idTIPO_Empresa = c.idTIPO_Empresa_FK
inner join lsetor st on st.idSETOR = c.idSETOR_FK
order by s.NomeSoftware, v.Versao,  l.DtAquisicao, c.Nome_RazaoSocial asc;

#########################################
#P)
select count(*) as 'Total de licenças vendidas' from llicenca;


#########################################
#Q)
select sum(ValorAquisicao) as 'Valor total', 
avg(ValorAquisicao) as 'Valor médio', 
max(ValorAquisicao) as 'Valor Máximo', 
min(ValorAquisicao) as 'Valor Mínimo'  from llicenca;

select * from llicenca;

#########################################
#R)
select * from lcliente;
select * from lsetor;

select count(idCliente) as 'Clientes farmacêuticos' from lcliente c
inner join lsetor s on s.idSETOR = c.idSETOR_FK
where Nomesetor = 'Farmacautica';

#########################################
#S)
select * from lcliente;
select * from llicenca;


select count(NumLicenca) as 'QTD', c.Nome_RazaoSocial  from lcliente c
inner join llicenca l on l.idCLIENTE_FK = c.idCLIENTE
group by c.Nome_RazaoSocial
order by c.Nome_RazaoSocial asc;

#########################################
#T)
select * from lcliente;
select * from llicenca;

select c.Nome_RazaoSocial as 'Clinete', sum(ValorAquisicao) as 'Total', avg(ValorAquisicao) as 'Média', 
count(NumLicenca) as 'QTD'  from lcliente c
inner join llicenca l on l.idCLIENTE_FK = c.idCLIENTE
group by c.Nome_RazaoSocial
order by c.Nome_RazaoSocial asc;

#########################################
#U)

select * from llicenca;
select * from lsetor;
select * from lcliente;

select s.NomeSetor, count(NumLicenca) as 'QTD' from lcliente c
inner join llicenca l on l.idCLIENTE_FK = c.idCLIENTE            
inner join lsetor s on s.idSETOR = c.idSETOR_FK
group by NomeSetor order by NomeSetor asc;

#########################################
#V)

select * from llicenca;
select * from ltipo_empresa;
select * from lcliente;

select t.DescricaoTipo, count(NumLicenca) from lcliente c
inner join llicenca l on l.idCLIENTE_FK = c.idCLIENTE                  ###  !!!   ###
inner join ltipo_empresa t on t.idTIPO_Empresa = c.idTIPO_Empresa_FK
group by DescricaoTipo;

#########################################
#W)

select * from llicenca;
select * from lsoftware;
select * from lversao;

select l.NumLicenca, s.NomeSoftware, v.Versao from llicenca l 
inner join lsoftware s on s.idSOFTWARE = l.idSOFTWARE_FK_FK                    ###  !!!   ###
inner join lversao v on v.Versao = l.Versao_FK;

select count(NumLicenca), sub.NomeSoftware from (select l.NumLicenca, s.NomeSoftware, v.Versao from llicenca l 
inner join lsoftware s on s.idSOFTWARE = l.idSOFTWARE_FK_FK
inner join lversao v on v.Versao = l.Versao_FK) sub group by NomeSoftware;
																						 ###  !!!   ###

select count(NumLicenca), s.NomeSoftware from lsoftware s 
inner join lversao v on s.idSOFTWARE = v.idSOFTWARE_FK
inner join llicenca l on l.idSOFTWARE_FK_FK = s.idSOFTWARE
group by NomeSoftware;


select *from llicenca;
#########################################
#X)
select * from lcliente;
select *from llicenca;
select * from lsoftware;

select s.NomeSoftware, count(NumLicenca) from lcliente c
inner join llicenca l on c.idCLIENTE = l.idCLIENTE_FK
inner join lsoftware s on s.idSOFTWARE - l.idSOFTWARE_FK_FK							###  !!!   ###
group by NomeSoftware;

select count(NumLicenca) from (select s.NomeSoftware, count(NumLicenca) from lcliente c
inner join llicenca l on c.idCLIENTE = l.idCLIENTE_FK
inner join lsoftware s on s.idSOFTWARE - l.idSOFTWARE_FK_FK
group by NomeSoftware) sub 
inner join lversa;

select s.NomeSoftware, count(NumLicenca) from lcliente c
inner join llicenca l on c.idCLIENTE = l.idCLIENTE_FK
inner join lsoftware s on s.idSOFTWARE - l.idSOFTWARE_FK_FK
group by NomeSoftware;


#########################################
#Y)

select * from lcliente;
select * from llicenca;

select count(NumLicenca) as 'Qtd', c.Nome_RazaoSocial from llicenca l 
inner join lcliente c on l.idCLIENTE_FK = c.idCLIENTE
group by idCLIENTE having Qtd > 10;








