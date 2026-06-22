CREATE TABLE clientes (
id_cliente SERIAL PRIMARY KEY,
nome_cliente VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL, 
telefone VARCHAR(20) NOT NULL,
cpf VARCHAR(11) UNIQUE NOT NULL,
data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categorias (
id_categoria SERIAL PRIMARY KEY,
nome_categoria VARCHAR(50) NOT NULL,
descricao_categoria VARCHAR(400) 
);

CREATE TABLE produtos (
id_produto SERIAL PRIMARY KEY,
id_categoria INT REFERENCES categorias (id_categoria),
nome_produto VARCHAR(100) NOT NULL,
preco_produto NUMERIC(12,2) NOT NULL,
estoque_produto INTEGER NOT NULL,
ativo BOOLEAN NOT NULL DEFAULT TRUE,
data_cadastro_produto TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);	

CREATE TABLE pedidos (
id_pedido SERIAL PRIMARY KEY,
id_cliente INT REFERENCES clientes (id_cliente),
data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
status VARCHAR(30) NOT NULL,
valor_total NUMERIC(12,2) NOT NULL,
forma_pagamento VARCHAR(50) NOT NULL 
);

CREATE TABLE itens_pedido (
id_item SERIAL PRIMARY KEY,
id_pedido INT REFERENCES pedidos (id_pedido),
id_produto INT REFERENCES produtos (id_produto),
quantidade INTEGER NOT NULL,
preco_unitario NUMERIC(12,2) NOT NULL,
desconto NUMERIC(12,2) NOT NULL
);

CREATE TABLE pagamentos (
id_pagamento SERIAL PRIMARY KEY,
id_pedido INT REFERENCES pedidos (id_pedido),
valor NUMERIC(12,2) NOT NULL,
data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
status VARCHAR(30) NOT NULL,
referencia_externa VARCHAR(300)
);