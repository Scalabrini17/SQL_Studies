TRUNCATE TABLE pagamentos, itens_pedido, pedidos, produtos, categorias, clientes RESTART IDENTITY CASCADE;

INSERT INTO clientes (id_cliente, nome_cliente, email, telefone, cpf, data_cadastro, ativo) VALUES
(1, 'Ana Souza', 'ana.souza@example.com', '(62) 9 8123-4501', '12345678901', '2026-01-05 09:12:00', TRUE),
(2, 'Bruno Lima', 'bruno.lima@example.com', '(62) 9 9234-5612', '23456789012', '2026-01-08 14:30:00', TRUE),
(3, 'Carla Mendes', 'carla.mendes@example.com', '(11) 9 9345-6723', '34567890123', '2026-01-12 11:05:00', TRUE),
(4, 'Diego Rocha', 'diego.rocha@example.com', '(21) 9 9456-7834', '45678901234', '2026-01-18 16:44:00', FALSE),
(5, 'Elaine Costa', 'elaine.costa@example.com', '(31) 9 9567-8945', '56789012345', '2026-02-01 08:20:00', TRUE),
(6, 'Fábio Pereira', 'fabio.pereira@example.com', '(41) 9 9678-9056', '67890123456', '2026-02-10 13:18:00', TRUE);

INSERT INTO categorias (id_categoria, nome_categoria, descricao_categoria) VALUES
(1, 'Notebooks', 'Computadores portáteis para estudo, trabalho e uso geral.'),
(2, 'Periféricos', 'Mouse, teclado, headset e acessórios de uso diário.'),
(3, 'Monitores', 'Monitores para produtividade, jogos e design.'),
(4, 'Rede', 'Equipamentos de conexão, roteadores e adaptadores.'),
(5, 'Armazenamento', 'SSD, HD externo e acessórios de backup.');

INSERT INTO produtos (id_produto, id_categoria, nome_produto, preco_produto, estoque_produto, ativo, data_cadastro_produto) VALUES
(1, 1, 'Notebook Dell Inspiron 15', 3899.90, 12, TRUE, '2026-02-02 10:00:00'),
(2, 1, 'Notebook Lenovo IdeaPad 3', 3299.00, 8, TRUE, '2026-02-03 10:20:00'),
(3, 2, 'Mouse Logitech G203', 149.90, 35, TRUE, '2026-02-04 11:00:00'),
(4, 2, 'Teclado Mecânico Redragon', 259.90, 20, TRUE, '2026-02-05 11:40:00'),
(5, 2, 'Headset HyperX Cloud Stinger', 299.90, 15, TRUE, '2026-02-06 09:10:00'),
(6, 3, 'Monitor LG 24 polegadas', 899.90, 10, TRUE, '2026-02-07 15:00:00'),
(7, 3, 'Monitor Samsung 27 polegadas', 1299.90, 7, TRUE, '2026-02-08 15:25:00'),
(8, 4, 'Adaptador Wi-Fi USB', 79.90, 50, TRUE, '2026-02-09 12:00:00'),
(9, 5, 'SSD Kingston NV2 500GB', 279.90, 22, TRUE, '2026-02-10 13:00:00'),
(10, 5, 'HD Externo 1TB Seagate', 349.90, 18, TRUE, '2026-02-11 13:30:00'),
(11, 4, 'Roteador TP-Link Archer C6', 329.90, 14, TRUE, '2026-02-12 14:00:00'),
(12, 2, 'Webcam Full HD', 189.90, 25, TRUE, '2026-02-13 14:30:00');

INSERT INTO pedidos (id_pedido, id_cliente, data_pedido, status, valor_total, forma_pagamento) VALUES
(1, 1, '2026-02-20 09:15:00', 'PAGO', 3999.70, 'PIX'),
(2, 2, '2026-02-20 10:05:00', 'PAGO', 1129.80, 'Cartão de Crédito'),
(3, 3, '2026-02-21 11:40:00', 'EM_PREPARO', 3308.80, 'Boleto'),
(4, 1, '2026-02-22 15:10:00', 'ENVIADO', 529.80, 'PIX'),
(5, 5, '2026-02-23 08:25:00', 'PAGO', 709.70, 'Cartão de Débito'),
(6, 6, '2026-02-24 17:55:00', 'CANCELADO', 1299.90, 'PIX'),
(7, 4, '2026-02-25 12:00:00', 'PENDENTE', 409.80, 'Boleto'),
(8, 2, '2026-02-26 18:30:00', 'PAGO', 4259.60, 'PIX');

INSERT INTO itens_pedido (id_item, id_pedido, id_produto, quantidade, preco_unitario, desconto) VALUES
(1, 1, 1, 1, 3899.90, 200.00),
(2, 1, 3, 2, 149.90, 0.00),
(3, 2, 6, 1, 899.90, 50.00),
(4, 2, 9, 1, 279.90, 0.00),
(5, 3, 2, 1, 3299.00, 150.00),
(6, 3, 8, 2, 79.90, 0.00),
(7, 4, 4, 1, 259.90, 0.00),
(8, 4, 5, 1, 299.90, 30.00),
(9, 5, 10, 1, 349.90, 0.00),
(10, 5, 12, 2, 189.90, 20.00),
(11, 6, 7, 1, 1299.90, 0.00),
(12, 7, 11, 1, 329.90, 0.00),
(13, 7, 8, 1, 79.90, 0.00),
(14, 8, 1, 1, 3899.90, 300.00),
(15, 8, 9, 2, 279.90, 50.00),
(16, 8, 3, 1, 149.90, 0.00);

INSERT INTO pagamentos (id_pagamento, id_pedido, valor, data_pagamento, status, referencia_externa) VALUES
(1, 1, 3999.70, '2026-02-20 09:20:00', 'APROVADO', 'PIX-20260220-0001'),
(2, 2, 1129.80, '2026-02-20 10:10:00', 'APROVADO', 'CARTAO-20260220-0002'),
(3, 5, 709.70, '2026-02-23 08:30:00', 'APROVADO', 'DEBITO-20260223-0005'),
(4, 8, 4259.60, '2026-02-26 18:35:00', 'APROVADO', 'PIX-20260226-0008');