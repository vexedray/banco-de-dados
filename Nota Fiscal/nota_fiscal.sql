create database notas;
use notas;

create table tbl_clientes (
id_cliente int not null,
nome_cliente varchar(50) not null,
email_cliente varchar(50) not null,
telefone_cliente numeric (15) not null,
constraint pk_clientes primary key (id_cliente)
);


create table tbl_produtos (
id_produto int not null,
descr_produto varchar (80) not null,
nome_produto varchar(60) not null,
valor_produto decimal (10,2) not null,
constraint pk_produtos primary key (id_produto)
);


create table tbl_vendedores (
id_vendedor int not null,
nome_vendedor varchar(50) not null,
data_admissao DATE not null,
constraint pk_vendedores primary key (id_vendedor)
);


create table tbl_nota_fiscal (
numero_nota numeric (10) not null,
id_vendedor int not null,
id_cliente int not null,
data_emissao date not null,
valor_nota decimal (10,2) not null,
constraint pk_nota_fiscal primary key (numero_nota),
constraint fk_nota_vendedor foreign key (id_vendedor) references tbl_vendedores (id_vendedor),
constraint fk_nota_cliente foreign key (id_cliente) references tbl_clientes (id_cliente)
);


create table tbl_itens_nota (
id_itens_nota int not null,
numero_nota numeric (10) not null,
id_produto int not null,
qtde_itens_nota int not null,
valor_itens_nota decimal (8,2) not null,
constraint pk_itens_nota primary key (id_itens_nota),
constraint fk_itens_numero_nota foreign key (numero_nota) references tbl_nota_fiscal (numero_nota),
constraint fk_itens_produto foreign key (id_produto) references tbl_produtos (id_produto)
);


insert into tbl_clientes (id_cliente, nome_cliente, email_cliente, telefone_cliente) values (1, "Moacir Silveira", "ms@gmail.com", 4899994556);
insert into tbl_clientes (id_cliente, nome_cliente, email_cliente, telefone_cliente) values (2, "Laura Machado", "lm@gmail.com", 1188880909);
insert into tbl_clientes (id_cliente, nome_cliente, email_cliente, telefone_cliente) values (3, "Claudia Silva", "cs@gmail.com", 4788830808);

insert into tbl_vendedores (id_vendedor, nome_vendedor, data_admissao) values (1, "Paulo Vieira", "2021-08-14");
insert into tbl_vendedores (id_vendedor, nome_vendedor, data_admissao) values (2, "Marcia Souza", "2019-03-06");

insert into tbl_produtos (id_produto, descr_produto, nome_produto, valor_produto) values (1, "Mesa Redonda 6 lugares", "Mesa Redonda", 100.00);
insert into tbl_produtos (id_produto, descr_produto, nome_produto, valor_produto) values (2, "Cadeira de Madeira", "Cadeira", 25.00);
insert into tbl_produtos (id_produto, descr_produto, nome_produto, valor_produto) values (3, "Balcão 3 gavetas", "Balcão", 50.00);
insert into tbl_produtos (id_produto, descr_produto, nome_produto, valor_produto) values (4, "Armário duas portas", "Armário", 50.00);


insert into tbl_nota_fiscal (numero_nota, id_vendedor, id_cliente, data_emissao, valor_nota) values (1050, 1, 2, "2024-03-15", 100.00);
insert into tbl_nota_fiscal (numero_nota, id_vendedor, id_cliente, data_emissao, valor_nota) values (1055, 1, 3, "2024-06-08", 50.00);
insert into tbl_nota_fiscal (numero_nota, id_vendedor, id_cliente, data_emissao, valor_nota) values (1056, 2, 1, "2024-04-10", 200.00);
insert into tbl_nota_fiscal (numero_nota, id_vendedor, id_cliente, data_emissao, valor_nota) values (1057, 2, 2, "2024-08-10", 150.00);
insert into tbl_nota_fiscal (numero_nota, id_vendedor, id_cliente, data_emissao, valor_nota) values (1058, 2, 3, "2024-09-06", 100.00);

insert into tbl_itens_nota (id_itens_nota, numero_nota, id_produto, qtde_itens_nota, valor_itens_nota) values (1, 1050, 3, 2, 50.00);
insert into tbl_itens_nota (id_itens_nota, numero_nota, id_produto, qtde_itens_nota, valor_itens_nota) values (2, 1055, 4, 1, 50.00);
insert into tbl_itens_nota (id_itens_nota, numero_nota, id_produto, qtde_itens_nota, valor_itens_nota) values (3, 1056, 1, 1, 100.00);
insert into tbl_itens_nota (id_itens_nota, numero_nota, id_produto, qtde_itens_nota, valor_itens_nota) values (4, 1056, 2, 4, 25.00);
insert into tbl_itens_nota (id_itens_nota, numero_nota, id_produto, qtde_itens_nota, valor_itens_nota) values (5, 1057, 3, 1, 50.00);
insert into tbl_itens_nota (id_itens_nota, numero_nota, id_produto, qtde_itens_nota, valor_itens_nota) values (6, 1057, 4, 1, 50.00);
insert into tbl_itens_nota (id_itens_nota, numero_nota, id_produto, qtde_itens_nota, valor_itens_nota) values (7, 1057, 2, 2, 25.00);
insert into tbl_itens_nota (id_itens_nota, numero_nota, id_produto, qtde_itens_nota, valor_itens_nota) values (8, 1058, 1, 1,  100.00);


select nome_produto,
	  valor_produto
from tbl_produtos;


select *
from tbl_clientes order by nome_cliente;


select nome_produto
from tbl_produtos
where valor_produto < 100;


select numero_nota,
      data_emissao,
      valor_nota
from tbl_nota_fiscal
where id_vendedor = 2;

select count(*)
from tbl_nota_fiscal; 

select count(*) 
from tbl_nota_fiscal
where valor_nota < 150; 
