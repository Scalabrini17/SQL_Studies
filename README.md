# Anotações PostgreSQL

## Tipos de Dados em PostgreSQL

- Numéricos
    
    
    | Nome | Tamanho do Armazenamento | Range |
    | --- | --- | --- |
    | smallint | 2 bytes | -32768 a +32767 |
    | integer | 4 bytes | -2147483648 a + 2147483647 |
    | bigint | 8 bytes  | -9223372036854775808 a +9223372036854775807 |
    | decimal | variable | sem linite |
    | numeric | variable | sem limite  |
    | real | 4 bytes | 6 dígitos decimais precisos |
    | double precision  | 8 bytes | 6 dígitos decimais precisos |
    | serial  | 4 bytes | de 1 a 2147483647 |
    | bigserial | 8 bytes | de 1 a 9223372036854775807 |
- Caractere
    
    
    | char | comprimento fixo ocupa espaços em branco |
    | --- | --- |
    | varchar | comprimento variável e não ocupa espaços em branco |
    | text | comprimento variável e ilimitado |
- Monetário
    
    
    | Money |                Valor da moeda     -21474836.48 a + 21474836.47 |
    | --- | --- |
- Data e Hora
    
    
    | Nome | Tamanho do Armazenamento | Descrição | Precisão |
    | --- | --- | --- | --- |
    | timestamp [without time zone] | 8 bytes | Data e hora sem fuso horário | Precisão de 1 microssegundo |
    | timestamp [with time zone] | 8 bytes | Data e hora com fuso horário | Precisão de 1 microssegundo |
    | interval | 12 bytes | Armazena faixas de  tempo | Precisão de 1 microssegundo |
    | date | 4 bytes | Armazena apenas datas  |  Precisão de 1 dia |
    | time [without time zone] | 8 bytes | Armazena apenas horários do dia | Precisão de 1 microssegundo |
    | time [with time zone] | 12 bytes | Armazena apenas horários do dia com fuso horário | Precisão de 1 microssegundo |
- booleano
    
    
    | True | False |
    | --- | --- |
    | t | f |
    | true | false |
    | y | n |
    | yes | no |
    | 1 | 0 |

## Inserindo dados na tabela

Quando temos um campo que o valor dentro dele tem que ser único e não pode ser de valor igual em nenhum outro registro, para não dar duplicidade de valores registrados, usa-se o: UNIQUE

Antes: 

```sql
CREATE TABLE userTeste(
userID SERIAL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
email VARCHAR(70) NOT NULL,
data_nascimento DATE NOT NULL,
data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*Pode colocar dois emails iguais*/

INSERT INTO userTeste(nome, email, data_nascimento)
VALUES('Ana Luisa', 'ana@gmail.com', '26/02/2005');

INSERT INTO userTeste(nome, email, data_nascimento)
VALUES('Itallo Scalabrini Martins', 'ana@gmail.com', '19/01/2007');
```

Depois:

```sql
CREATE TABLE userTeste(
userID SERIAL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
email VARCHAR(70) UNIQUE NOT NULL,
data_nascimento DATE NOT NULL,
data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*Não é possível colocar dois emails iguais*/

INSERT INTO userTeste(nome, email, data_nascimento)
VALUES('Ana Luisa', 'ana@gmail.com', '26/02/2005');

INSERT INTO userTeste(nome, email, data_nascimento)
VALUES('Itallo Scalabrini Martins', 'itallo@gmail.com', '19/01/2007');
```

### **WHERE**

```sql
SELECT * FROM userTeste WHERE nome LIKE 'A%' OR nome LIKE 'a%';

/*WHERE: significa onde*/
/*LIKE: é usado para buscar padrões de texto podendo usar o % que busca por primeira letra e o _ que busca um caracter expecifico*/
/*OR: significa ou. Usei o or nesse caso para poder buscar também letras minusculas*/
```

### **IGUAL =**

```sql
SELECT * FROM userTeste WHERE nome = 'Itallo Scalabrini Maartins';

/*Pesquisa o nome exato como está na tabela*/
```

### **ORDER BY**

```sql
SELECT * FROM userTeste ORDER BY nome ASC;
SELECT * FROM userTeste ORDER BY nome DESC;

/*O ORDER BY serve para ordenar a lista quanto de forma crescente quanto decrescente*/
/*O ASC é para ordenar com a ordem crescente do menor para o maior nesse caso de A a Z*/	
/*O DESC é para ordenar com a ordem decrescente do maior para o menor nesse caso de Z a C*/	
```

### **LIMIT**

```sql
SELECT * FROM userTeste LIMIT 1;

/*O LIMIT serve para limitar a quantidade de registros que aparecerá na sua pesquisa*/
```

### **UPDATE**

```sql
UPDATE (tabela) SET (campo da tambela) = '(Novo valor)' WHERE (coluna PRIMARY KEY) = '';
Ex.:
UPDATE userTeste SET email = 'analuisa@gmail.com' WHERE userID = 1; 

/*Para atualizar um registro usamos o UPDATE*/
```

### **DELETE**

```sql
DELETE FROM (tabela) WHERE (coluna PRIMARY KEY) = '';
Ex.:
DELETE FROM userTeste WHERE userID = 2;

/*Para deletarmos um registro da tabela no banco de dados usamos o DELETE*/
```

## TRATAMENTO DE COLUNAS

### **ADD COLUMN**

```sql
/*Para colocar uma nova coluna em uma tabela já existente*/
/*IMPORTANTE: Como a tabela jé está criada precisa de colocar um valor DEFAULT se ela tiver o NOT NULL*/

ALTER TABLE (tabela)
ADD COLUMN (Nome da nova coluna) (tipo de dado que a tabela vai receber) DEFAULT (Valor DEFAULT);

Ex.:
ALTER TABLE userTeste 
ADD COLUMN idade SMALLINT NOT NULL DEFAULT 0;
```

### **DROP COLUMN**

```sql
/*Para deletar uma coluna de uma tabela já existente*/

ALTER TABLE (tabela)
DROP COLUMN (Nome da coluna);

Ex.:
ALTER TABLE userTeste 
DROP COLUMN idade;
```

## Relacionamento entre tabelas

Para relacionar tabelas vamos partir do principio e criar uma nova tabela 

```sql
/*Crie uma nova tabela*/
Ex.:
	CREATE TABLE pedidos(
	codigo_pedido SERIAL PRIMARY KEY,
	usuarioID INT REFERENCES userTeste (userID), /*Relacionando a tabela pedidos com a tabela userTeste*/
	data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
```

Como pode ser observado para que pudesse relacionar uma tabela a outra foi adicionado um campo a essa tabela com o REFERENCES que significa referenciar, logo após o REFERENCES se coloca a tabela com que se vai relacionar, e o campo (normalmente por padrão se utiliza o campo de ID que leva o PRIMARY KEY, assim como no exemplo).