CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE clientes (   
id_cliente INT AUTO_INCREMENT PRIMARY KEY,   
nome VARCHAR(100) NOT NULL,   
email VARCHAR(100) UNIQUE,   
cidade VARCHAR(50),   
estado CHAR(2),   
telefone VARCHAR(20)
);

CREATE TABLE produtos (   
id_produto INT AUTO_INCREMENT PRIMARY KEY,   
nome VARCHAR(100) NOT NULL,   
preco DECIMAL(10,2) NOT NULL,   
estoque INT DEFAULT 0
);

CREATE TABLE pedidos (   
id_pedido INT AUTO_INCREMENT PRIMARY KEY,   
id_cliente INT,   
data_pedido DATE,   
valor_total DECIMAL(10,2),   
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_pedido (   
id_item INT AUTO_INCREMENT PRIMARY KEY,   
id_pedido INT,   
id_produto INT,   
quantidade INT,   
subtotal DECIMAL(10,2),   
FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),   
FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO clientes(nome, email, cidade, estado, telefone) VALUES
	('Maria Silva', 'maria@email.com', 'São Paulo', 'SP', '11988887777'),
    ('João Souza', 'joao@email.com', 'Campinas', 'SP', '119999996666'),
    ('Ana Costa', 'ana@email.com', 'Curitiba', 'PR', '41987654321'),
    ('Carlos Poeira', 'carlos@email', 'Rio de Janeiro', 'RJ', '21955558888');

INSERT INTO produtos(nome, preco, estoque) VALUES
	('Notebook Dell', 4500.00, 10),
    ('Mouse Gamer', 120.00, 50),
    ('Teclado Mecânico', 280.00, 30),
    ('Monitor 24"', 900.00, 15),
    ('Cadeira Gamer', 1300.00, 5);
    
INSERT INTO pedidos(id_cliente, data_pedido, valor_total) VALUES
	(1, '2025-10-01', 4620.0),
    (3, '2025-10-05', 1500.00);
    
INSERT INTO itens_pedido(id_pedido, id_produto, quantidade, subtotal) VALUES
	(1, 1, 1, 4500.00),
    (1, 2, 1, 120.00),
    (2, 5, 1, 1300.00),
    (2, 3, 1, 200.00);

SET SQL_SAFE_UPDATES = 0;
UPDATE produtos
SET preco = preco * 1.10
WHERE nome LIKE '%Gamer%';

DELETE FROM clientes
WHERE cidade = 'Curitiba';

DROP DATABASE ecommerce;