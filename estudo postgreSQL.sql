CREATE TABLE userTeste(
userID SERIAL PRIMARY KEY, 
nome VARCHAR(50) NOT NULL,
email VARCHAR(70) NOT NULL,
data_nascimento DATE NOT NULL,
data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM userTeste;

INSERT INTO userTeste(nome, email, data_nascimento)
VALUES('Ana Luisa', 'ana@gmail.com', '26/02/2005');

INSERT INTO userTeste(nome, email, data_nascimento)
VALUES('Itallo Scalabrini Martins', 'ana@gmail.com', '19/01/2007');

DROP TABLE userTeste;

----------------------------------------------------------------------------------------------------------------
/*Aqui tivemos um erro de segurança, porque o email se repete e não pode se repetir, então usa-se UNIQUE. Assim como mostra a baixo*/
CREATE TABLE userTeste(
userID SERIAL PRIMARY KEY, 
nome VARCHAR(50) NOT NULL,
email VARCHAR(70) UNIQUE NOT NULL,
data_nascimento DATE NOT NULL,
data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO userTeste(nome, email, data_nascimento)
VALUES('Ana Luisa', 'ana@gmail.com', '26/02/2005');

INSERT INTO userTeste(nome, email, data_nascimento)
VALUES('Itallo Scalabrini Martins', 'itallo@gmail.com', '19/01/2007');

SELECT * FROM userTeste;

----------------------------------------------------------------------------------------------------------------
/* Filtros nas pesquisas */
SELECT * FROM userTeste WHERE nome LIKE 'A%' OR nome LIKE 'a%';

SELECT * FROM userTeste WHERE nome = 'Itallo Scalabrini Maartins'; 

SELECT * FROM userTeste ORDER BY nome ASC;

SELECT * FROM userTeste ORDER BY nome DESC;

SELECT * FROM userTeste LIMIT 1;

----------------------------------------------------------------------------------------------------------------
/*UPDATE*/

UPDATE userTeste SET email = 'analuisa@gmail.com' WHERE userID = 1; 

----------------------------------------------------------------------------------------------------------------
/*DELETE*/
DELETE FROM userTeste WHERE userID = 2;

----------------------------------------------------------------------------------------------------------------
/*ADD COLUMN*/
ALTER TABLE userTeste 
ADD COLUMN idade SMALLINT NOT NULL DEFAULT 0

----------------------------------------------------------------------------------------------------------------
/*DROP COLUMN*/
ALTER TABLE userTeste 
DROP COLUMN idade;

----------------------------------------------------------------------------------------------------------------
/*RELACIONAMENTO DE TABELAS*/
CREATE TABLE pedidos(
codigo_pedido SERIAL PRIMARY KEY,
usuarioID INT REFERENCES userTeste (userID), /*RELACIONANDO A TAMELA PEDIDOS A TABELA DE USUARIOS*/
data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*EXEMPLO DE UM PEDIDO*/
INSERT INTO pedidos (usuarioID)
VALUES(1),(3);

SELECT * FROM pedidos;