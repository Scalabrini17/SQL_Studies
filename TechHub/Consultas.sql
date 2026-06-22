-------------------------------------------------------------------------------------------
/*Consultas Iniciais*/
--1
SELECT * FROM clientes; 

--2
SELECT * FROM clientes WHERE ativo = TRUE;

--3
SELECT * FROM produtos WHERE preco_produto > 300;

--4
SELECT * FROM produtos ORDER BY nome_produto ASC;

--5
SELECT * FROM pedidos WHERE data_pedido BETWEEN '2026-02-20 09:15:00' AND  '2026-02-24 17:55:00';

--6
SELECT COUNT(*)FROM clientes;

--7
SELECT SUM(valor_total) FROM pedidos;

--9
UPDATE produtos SET estoque_produto = 0 WHERE id_produto = 7;
SELECT * FROM produtos WHERE estoque_produto = 0;

--10
SELECT COUNT(status) FROM pedidos WHERE status = 'PAGO' ;

--11
SELECT nome_categoria FROM categorias;
/*ou*/
SELECT * FROM categorias;

-------------------------------------------------------------------------------------------
/*Consultas Avançadas*/
--1
SELECT * FROM pedidos INNER JOIN clientes ON pedidos.id_cliente = clientes.id_cliente;