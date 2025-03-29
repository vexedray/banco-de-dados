create database estoque;
use estoque;

create table tbl_categorias (
id_categoria int not null,
nome_categoria varchar (40) not null,
constraint pk_categorias primary key (id_categoria) 
);

create table tbl_produtos (
id_produto int not null,
id_categoria int not null,
nome_produto varchar (50) not null,
valor_produto decimal (8,2) not null,
constraint pk_produtos primary key (id_produto), 
constraint fk_produtos_categoria foreign key (id_categoria) references tbl_categorias (id_categoria)
);

create table tbl_estados (
id_estado int not null,
nome_estado varchar (50) not null,
constraint pk_estados primary key (id_estado) 
);

create table tbl_clientes (
id_cliente int not null,
nome_cliente varchar (50) not null,
id_estado int not null,
constraint pk_clientes primary key (id_cliente), 
constraint fk_clientes_estado foreign key (id_estado) references tbl_estados (id_estado)
);

create table tbl_pedidos (
id_pedido int not null,
id_cliente int not null,
data_pedido date not null,
constraint pk_pedidos primary key (id_pedido), 
constraint fk_pedidos_cliente foreign key (id_cliente) references tbl_clientes (id_cliente)
);

create table tbl_itens_pedido (
id_itens_pedido int not null,
id_pedido int not null,
id_produto int not null,
qtde_item numeric (3) not null,
valor_item decimal (8,2) not null,
constraint pk_itens_pedido primary key (id_itens_pedido), 
constraint fk_itens_pedido_pedido foreign key (id_pedido) references tbl_pedidos (id_pedido),
constraint fk_itens_pedido_produto foreign key (id_produto) references tbl_produtos (id_produto)
);


insert into tbl_categorias (id_categoria, nome_categoria) values (1, "Frutas");
insert into tbl_categorias (id_categoria, nome_categoria) values (2, "Bebidas");
insert into tbl_categorias (id_categoria, nome_categoria) values (3, "Cereais");
insert into tbl_categorias (id_categoria, nome_categoria) values (4, "Limpeza");

insert into tbl_produtos (id_produto, nome_produto, valor_produto, id_categoria)values  (1, "Arroz", 5.60, 3);
insert into tbl_produtos (id_produto, nome_produto, valor_produto, id_categoria)values (2, "Laranja", 2.30, 1);
insert into tbl_produtos (id_produto, nome_produto, valor_produto, id_categoria)values (3, "Guaraná", 2.40, 2);
insert into tbl_produtos (id_produto, nome_produto, valor_produto, id_categoria)values (4, "Feijão", 3.70, 3);
insert into tbl_produtos (id_produto, nome_produto, valor_produto, id_categoria)values (5, "Morango", 4.20, 1);
insert into tbl_produtos (id_produto, nome_produto, valor_produto, id_categoria) values (6, "Vinho", 30.00, 2);

insert into tbl_estados (id_estado, nome_estado) values (1, "SC");
insert into tbl_estados (id_estado, nome_estado) values (2, "RS");
insert into tbl_estados (id_estado, nome_estado) values (3, "PR");
insert into tbl_estados (id_estado, nome_estado) values (4, "SP");

insert into tbl_clientes (id_cliente, nome_cliente, id_estado) values (1, "Lucas Silva", 4);
insert into tbl_clientes (id_cliente, nome_cliente, id_estado) values (2, "Marcia Luz", 1);
insert into tbl_clientes (id_cliente, nome_cliente, id_estado) values (3, "Jair Ramos", 1);
insert into tbl_clientes (id_cliente, nome_cliente, id_estado) values (4, "Laura Ferreira", 2);
insert into tbl_clientes (id_cliente, nome_cliente, id_estado) values (5, "Silvia Santana", 2);
insert into tbl_clientes (id_cliente, nome_cliente, id_estado) values (6, "Marcos Pires", 3);

insert into tbl_pedidos (id_pedido, id_cliente, data_pedido) values (1, 1, "2024-04-05");
insert into tbl_pedidos (id_pedido, id_cliente, data_pedido) values (2, 1, "2024-05-10");
insert into tbl_pedidos (id_pedido, id_cliente, data_pedido) values (3, 3, "2024-03-06");
insert into tbl_pedidos (id_pedido, id_cliente, data_pedido) values (4, 4, "2024-07-07");
insert into tbl_pedidos (id_pedido, id_cliente, data_pedido) values (5, 3, "2024-05-10");
insert into tbl_pedidos (id_pedido, id_cliente, data_pedido) values (6, 2, "2024-03-06");
insert into tbl_pedidos (id_pedido, id_cliente, data_pedido) values (7, 5, "2024-06-09");
insert into tbl_pedidos (id_pedido, id_cliente, data_pedido) values (8, 6, "2024-05-10");
insert into tbl_pedidos (id_pedido, id_cliente, data_pedido) values (9, 5, "2024-03-06");

insert into tbl_itens_pedido (id_itens_pedido, id_pedido, id_produto, qtde_item, valor_item) values (1, 1, 1, 2, 5.60);
insert into tbl_itens_pedido (id_itens_pedido, id_pedido, id_produto, qtde_item, valor_item) values (2, 1, 3, 1, 2.40);
insert into tbl_itens_pedido (id_itens_pedido, id_pedido, id_produto, qtde_item, valor_item) values (3, 2, 5, 3, 4.20);
insert into tbl_itens_pedido (id_itens_pedido, id_pedido, id_produto, qtde_item, valor_item) values (4, 3, 4, 2, 3.70);
insert into tbl_itens_pedido (id_itens_pedido, id_pedido, id_produto, qtde_item, valor_item) values (5, 4, 6, 3, 30.00);
insert into tbl_itens_pedido (id_itens_pedido, id_pedido, id_produto, qtde_item, valor_item) values (6, 5, 1, 4, 5.60);
insert into tbl_itens_pedido (id_itens_pedido, id_pedido, id_produto, qtde_item, valor_item) values (7, 5, 4, 2, 3.70);
insert into tbl_itens_pedido (id_itens_pedido, id_pedido, id_produto, qtde_item, valor_item) values (8, 6, 2, 4, 2.30);
insert into tbl_itens_pedido (id_itens_pedido, id_pedido, id_produto, qtde_item, valor_item) values (9, 7, 5, 2, 4.20);
insert into tbl_itens_pedido (id_itens_pedido, id_pedido, id_produto, qtde_item, valor_item) values (10, 8, 6, 1, 30.00);
insert into tbl_itens_pedido (id_itens_pedido, id_pedido, id_produto, qtde_item, valor_item) values (11, 9, 1, 2, 5.60);

desc tbl_itens_pedido;
select * 
from tbl_categorias;

select *
from tbl_clientes;

select *
from tbl_estados;

select *
from tbl_itens_pedido;

select *
from tbl_pedidos;

select *
from tbl_produtos;

select p.data_pedido,
	   c.nome_cliente,
       e.nome_estado
from tbl_pedidos p
join tbl_clientes c on p.id_cliente = c.id_cliente
join tbl_estados e on c.id_estado = e.id_estado
where e.nome_estado = "SC"
order by p.data_pedido desc;

select  p.id_pedido,
	    c.nome_cliente,
		date_format (p.data_pedido, "%d/%m/%y") as data, 
		pr.nome_produto,
		i.qtde_item, 
		i.valor_item,
		(i.qtde_item * i.valor_item) as total_item 
from tbl_itens_pedido i
join tbl_pedidos p on i.id_pedido = p.id_pedido
join tbl_clientes c on p.id_cliente = c.id_cliente
join tbl_produtos pr on i.id_produto = pr.id_produto
join tbl_estados e on c.id_estado = e.id_estado
where e.nome_estado = "RS"
order by p.id_pedido;

select avg (valor_item)
from tbl_itens_pedido;

select avg (qtde_item) as media_quantidade,
	   avg (valor_item) as media_itens_nota
from tbl_itens_pedido;

select avg (qtde_item) as media_quantidade,
	   min(valor_item) as menor_itens_nota,
	   max(valor_item) as maior_itens_nota
from tbl_itens_pedido;

 
 
 
 /* 1 - Mostrar a quantidade de vezes que um produto foi comprado.*/
select p.id_produto,
    p.nome_produto,
    COUNT(i.id_itens_pedido) AS quantidade_comprada
FROM tbl_produtos p
JOIN tbl_itens_pedido i ON p.id_produto = i.id_produto
GROUP BY p.id_produto, p.nome_produto;

 
 /* 2. Quantidade de pedidos por cliente.*/
select c.id_cliente,
    c.nome_cliente,
    COUNT(p.id_pedido) AS quantidade_pedidos
FROM tbl_clientes c
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;


/* 3. Valor total gasto por cliente.*/
SELECT pr.nome_produto,
       SUM(valor_item) AS total_valor_itens
FROM tbl_itens_pedido as p
JOIN tbl_produtos as pr ON p.id_produto = pr.id_produto
GROUP BY pr.nome_produto;

/* 4. Valor total gasto por cliente, agrupado por pedido.*/
select e.nome_estado,
count(c.id_cliente) as numero_clientes
from tbl_clientes c
join tbl_estados e on c.id_estado = e.id_estado
group by e.nome_estado;


 /* 5. Total vendido por estado.*/
select c.id_cliente,
	c.nome_cliente,
	SUM(i.qtde_item * i.valor_item) AS valor_total_gasto
FROM tbl_clientes c
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY c.id_cliente, c.nome_cliente;

 /*6. Total vendido por estado, agrupado por cliente.*/
select e.id_estado,
    e.nome_estado,
    SUM(i.qtde_item * i.valor_item) AS total_vendido
FROM tbl_estados e
JOIN tbl_clientes c ON e.id_estado = c.id_estado
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY e.id_estado, e.nome_estado;

 
 /*7. Total vendido por data.*/
select p.data_pedido,
    SUM(i.qtde_item * i.valor_item) AS total_vendido
FROM tbl_pedidos p
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY p.data_pedido;


/*8. Agrupar por quantidade de pedidos*/
select p.nome_produto,
	  sum(i.qtde_item)
from tbl_itens_pedido as i
join tbl_produtos as p on i.id_pedido = p.id_pedido
group by p.nome_produto
having qtde_item>5
order by qtde_item desc;

/* 9. Quantidade de produtos diferentes comprados em cada pedido.*/
SELECT p.id_pedido,
       COUNT(DISTINCT i.id_produto) AS produtos_diferentes
FROM tbl_pedidos p
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY p.id_pedido;

/* 10. Número total de clientes por estado.*/
use estoque;
select e.nome_estado,
		count(c.id_cliente)
from tbl_estados e
join tbl_clientes c on e.id_estado = c.id_estado
group by e.nome_estado;


/* 11. Valor médio dos pedidos por cliente.*/
SELECT c.nome_cliente,
       AVG(i.qtde_item * i.valor_item) AS valor_medio_pedido
FROM tbl_clientes c
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY c.nome_cliente;

/* 12. Quantidade de pedidos feitos em cada mês.*/
SELECT EXTRACT(MONTH FROM p.data_pedido) AS mes,
       COUNT(p.id_pedido) AS total_pedidos
FROM tbl_pedidos p
GROUP BY EXTRACT(MONTH FROM p.data_pedido);

/* 13. Valor total vendido por mês.*/
SELECT EXTRACT(MONTH FROM p.data_pedido) AS mes,
       SUM(i.qtde_item * i.valor_item) AS total_vendido
FROM tbl_pedidos p
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY EXTRACT(MONTH FROM p.data_pedido);

/* 14. Cliente com maior valor total em compras.*/
SELECT c.id_cliente,
       c.nome_cliente,
       SUM(i.qtde_item * i.valor_item) AS total_gasto
FROM tbl_clientes c
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY c.id_cliente, c.nome_cliente
ORDER BY total_gasto DESC
LIMIT 1;

/* 15. Produto mais vendido em quantidade.*/
SELECT p.nome_produto,
       SUM(i.qtde_item) AS total_quantidade
FROM tbl_produtos p
JOIN tbl_itens_pedido i ON p.id_produto = i.id_produto
GROUP BY p.nome_produto
ORDER BY total_quantidade DESC
LIMIT 1;

/* 16. Clientes que compraram mais de 10 itens em um único pedido.*/
SELECT c.id_cliente,
       c.nome_cliente,
       p.id_pedido,
       SUM(i.qtde_item) AS quantidade_total
FROM tbl_clientes c
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY c.id_cliente, c.nome_cliente, p.id_pedido
HAVING quantidade_total > 10;

/* 17. Total de itens vendidos por produto.*/
SELECT p.nome_produto,
       SUM(i.qtde_item) AS total_itens
FROM tbl_produtos p
JOIN tbl_itens_pedido i ON p.id_produto = i.id_produto
GROUP BY p.nome_produto;

/* 18. Média de quantidade de itens por pedido.*/
SELECT AVG(i.qtde_item) AS media_itens_por_pedido
FROM tbl_itens_pedido i;

/* 19. Total de vendas para cada categoria de produto.*/
SELECT c.nome_categoria,
       SUM(i.qtde_item * i.valor_item) AS total_vendas
FROM tbl_categorias c
JOIN tbl_produtos p ON c.id_categoria = p.id_categoria
JOIN tbl_itens_pedido i ON p.id_produto = i.id_produto
GROUP BY c.nome_categoria;

/* 20. Clientes que realizaram pedidos em mais de um estado.*/
SELECT c.id_cliente,
       c.nome_cliente,
       COUNT(DISTINCT e.nome_estado) AS estados_diferentes
FROM tbl_clientes c
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
JOIN tbl_estados e ON c.id_estado = e.id_estado
GROUP BY c.id_cliente, c.nome_cliente
HAVING estados_diferentes > 1;

/* 21. Produtos que não foram comprados.*/
SELECT p.id_produto,
       p.nome_produto
FROM tbl_produtos p
LEFT JOIN tbl_itens_pedido i ON p.id_produto = i.id_produto
WHERE i.id_itens_pedido IS NULL;

/* 22. Clientes que fizeram pedidos em mais de um mês.*/
SELECT c.id_cliente,
       c.nome_cliente,
       COUNT(DISTINCT EXTRACT(MONTH FROM p.data_pedido)) AS meses_diferentes
FROM tbl_clientes c
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome_cliente
HAVING meses_diferentes > 1;

/* 23. Média do valor total dos pedidos por estado.*/
SELECT e.nome_estado,
       AVG(i.qtde_item * i.valor_item) AS media_valor_pedido
FROM tbl_estados e
JOIN tbl_clientes c ON e.id_estado = c.id_estado
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY e.nome_estado;

/* 24. Produtos com valor total de vendas acima de 1000.*/
SELECT p.nome_produto,
       SUM(i.qtde_item * i.valor_item) AS total_vendido
FROM tbl_produtos p
JOIN tbl_itens_pedido i ON p.id_produto = i.id_produto
GROUP BY p.nome_produto
HAVING total_vendido > 1000;

/* 25. Número de clientes por faixa etária (18-25, 26-35, etc.).*/
SELECT CASE
           WHEN idade BETWEEN 18 AND 25 THEN '18-25'
           WHEN idade BETWEEN 26 AND 35 THEN '26-35'
           WHEN idade BETWEEN 36 AND 45 THEN '36-45'
           ELSE '46+'
       END AS faixa_etaria,
       COUNT(id_cliente) AS total_clientes
FROM tbl_clientes
GROUP BY faixa_etaria;

/* 26. Produto com o maior valor médio de venda.*/
SELECT p.nome_produto,
       AVG(i.qtde_item * i.valor_item) AS valor_medio
FROM tbl_produtos p
JOIN tbl_itens_pedido i ON p.id_produto = i.id_produto
GROUP BY p.nome_produto
ORDER BY valor_medio DESC
LIMIT 1;

/* 27. Total de pedidos e valor total de vendas por ano.*/
SELECT EXTRACT(YEAR FROM p.data_pedido) AS ano,
       COUNT(p.id_pedido) AS total_pedidos,
       SUM(i.qtde_item * i.valor_item) AS total_vendas
FROM tbl_pedidos p
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY EXTRACT(YEAR FROM p.data_pedido);

/* 28. Média de itens por pedido para cada cliente.*/
SELECT c.id_cliente,
       c.nome_cliente,
       AVG(i.qtde_item) AS media_itens_por_pedido
FROM tbl_clientes c
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY c.id_cliente, c.nome_cliente;

/* 29. Número total de produtos diferentes vendidos.*/
SELECT COUNT(DISTINCT i.id_produto) AS total_produtos_vendidos
FROM tbl_itens_pedido i;

/* 30. Valor total de pedidos para cada forma de pagamento.*/
SELECT f.nome_forma_pagamento,
       SUM(i.qtde_item * i.valor_item) AS total_vendas
FROM tbl_formas_pagamento f
JOIN tbl_pedidos p ON f.id_forma_pagamento = p.id_forma_pagamento
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY f.nome_forma_pagamento;

/* 31. Quantidade total de produtos vendidos por cliente. */
SELECT c.id_cliente,
       c.nome_cliente,
       SUM(i.qtde_item) AS total_produtos_vendidos
FROM tbl_clientes c
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY c.id_cliente, c.nome_cliente;

/* 32. Média de preço dos produtos por categoria. */
SELECT cat.nome_categoria,
       AVG(p.preco) AS media_preco
FROM tbl_categorias cat
JOIN tbl_produtos p ON cat.id_categoria = p.id_categoria
GROUP BY cat.nome_categoria;

/* 33. Produtos com preço abaixo da média geral. */
SELECT p.id_produto,
       p.nome_produto,
       p.preco
FROM tbl_produtos p
WHERE p.preco < (SELECT AVG(preco) FROM tbl_produtos);

/* 34. Quantidade de produtos distintos vendidos por cliente. */
SELECT c.id_cliente,
       c.nome_cliente,
       COUNT(DISTINCT i.id_produto) AS produtos_distintos
FROM tbl_clientes c
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY c.id_cliente, c.nome_cliente;

/* 35. Clientes que não realizaram nenhum pedido. */
SELECT c.id_cliente,
       c.nome_cliente
FROM tbl_clientes c
LEFT JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;

/* 36. Total de vendas (em valor) por categoria de produto. */
SELECT cat.nome_categoria,
       SUM(i.qtde_item * i.valor_item) AS total_vendas
FROM tbl_categorias cat
JOIN tbl_produtos p ON cat.id_categoria = p.id_categoria
JOIN tbl_itens_pedido i ON p.id_produto = i.id_produto
GROUP BY cat.nome_categoria;

/* 37. Média de valor gasto por pedido. */
SELECT AVG(total_valor) AS media_valor_pedido
FROM (SELECT SUM(i.qtde_item * i.valor_item) AS total_valor
      FROM tbl_pedidos p
      JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
      GROUP BY p.id_pedido) AS valores_por_pedido;

/* 38. Clientes que fizeram pedidos acima de um valor específico (ex: R$ 500). */
SELECT c.id_cliente,
       c.nome_cliente,
       SUM(i.qtde_item * i.valor_item) AS valor_total
FROM tbl_clientes c
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY c.id_cliente, c.nome_cliente
HAVING valor_total > 500;

/* 39. Mês com maior número de vendas em quantidade. */
SELECT EXTRACT(MONTH FROM p.data_pedido) AS mes,
       SUM(i.qtde_item) AS total_quantidade
FROM tbl_pedidos p
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY mes
ORDER BY total_quantidade DESC
LIMIT 1;

/* 40. Valor total de produtos em estoque (preço x quantidade em estoque). */
SELECT SUM(p.preco * p.qtde_estoque) AS valor_total_estoque
FROM tbl_produtos p;

/* 41. Clientes que compraram todos os produtos de uma categoria específica. */
SELECT c.id_cliente,
       c.nome_cliente
FROM tbl_clientes c
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
JOIN tbl_produtos pr ON i.id_produto = pr.id_produto
WHERE pr.id_categoria = (SELECT id_categoria FROM tbl_categorias WHERE nome_categoria = 'CategoriaX')
GROUP BY c.id_cliente, c.nome_cliente
HAVING COUNT(DISTINCT pr.id_produto) = (SELECT COUNT(*) FROM tbl_produtos WHERE id_categoria = (SELECT id_categoria FROM tbl_categorias WHERE nome_categoria = 'CategoriaX'));

/* 42. Cliente com maior número de pedidos feitos. */
SELECT c.id_cliente,
       c.nome_cliente,
       COUNT(p.id_pedido) AS total_pedidos
FROM tbl_clientes c
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome_cliente
ORDER BY total_pedidos DESC
LIMIT 1;

/* 43. Total de vendas acumulado por dia. */
SELECT p.data_pedido,
       SUM(i.qtde_item * i.valor_item) OVER (ORDER BY p.data_pedido) AS vendas_acumuladas
FROM tbl_pedidos p
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido;

/* 44. Produtos com vendas abaixo de 5 unidades. */
SELECT p.nome_produto,
       SUM(i.qtde_item) AS total_vendido
FROM tbl_produtos p
JOIN tbl_itens_pedido i ON p.id_produto = i.id_produto
GROUP BY p.nome_produto
HAVING total_vendido < 5;

/* 45. Mês com maior faturamento. */
SELECT EXTRACT(MONTH FROM p.data_pedido) AS mes,
       SUM(i.qtde_item * i.valor_item) AS faturamento
FROM tbl_pedidos p
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY mes
ORDER BY faturamento DESC
LIMIT 1;

/* 46. Produto com a menor quantidade em estoque. */
SELECT p.nome_produto,
       p.qtde_estoque
FROM tbl_produtos p
ORDER BY p.qtde_estoque ASC
LIMIT 1;

/* 47. Cliente que gastou mais em um único pedido. */
SELECT c.id_cliente,
       c.nome_cliente,
       p.id_pedido,
       SUM(i.qtde_item * i.valor_item) AS total_gasto
FROM tbl_clientes c
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY c.id_cliente, c.nome_cliente, p.id_pedido
ORDER BY total_gasto DESC
LIMIT 1;

/* 48. Quantidade de produtos diferentes vendidos em cada estado. */
SELECT e.nome_estado,
       COUNT(DISTINCT i.id_produto) AS produtos_diferentes
FROM tbl_estados e
JOIN tbl_clientes c ON e.id_estado = c.id_estado
JOIN tbl_pedidos p ON c.id_cliente = p.id_cliente
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY e.nome_estado;

/* 49. Total de vendas para cada método de entrega. */
SELECT m.nome_metodo_entrega,
       SUM(i.qtde_item * i.valor_item) AS total_vendas
FROM tbl_metodos_entrega m
JOIN tbl_pedidos p ON m.id_metodo_entrega = p.id_metodo_entrega
JOIN tbl_itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY m.nome_metodo_entrega;

/* 50. Estado com maior número de clientes. */
SELECT e.nome_estado,
       COUNT(c.id_cliente) AS total_clientes
FROM tbl_estados e
JOIN tbl_clientes c ON e.id_estado = c.id_estado
GROUP BY e.nome_estado
ORDER BY total_clientes DESC
LIMIT 1;



