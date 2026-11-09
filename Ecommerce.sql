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
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),

    data_pedido DATE,
    valor_total DECIMAL(10,2)
);


CREATE TABLE itens_pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),

    id_produto INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),

    quantidade INT,
    subtotal DECIMAL(10,2)
);

INSERT INTO clientes (nome, email, cidade, estado, telefone) VALUES
    ('Maria Silva', 'maria@email.com', 'São Paulo', 'SP', '11988887777'),
    ('João Silva', 'joao@email.com', 'Campinas', 'SP', '19999996666'),
    ('Ana Costa', 'ana@email.com', 'Curitiba', 'PR', '41987654321'),
    ('Carlos Pereira', 'carlos@email.com', 'Rio de Janeiro', 'RJ', '21955555888');

INSERT INTO produtos (nome, preco, estoque) VALUES
    ('Notebook Dell', 4500.00, 10),
    ('Mouse Gamer', 120.00, 50),
    ('Teclado Mecânico', 120.00, 50),
    ('Monitor 24"', 900.00, 15),
    ('Cadeira Gamer',1300.00, 5);

INSERT INTO pedidos (id_cliente, data_pedido, valor_total) VALUES
    (1, '2025-10-01', 4620.00),
    (3, '2025-10-05', 1500.00);

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, subtotal) VALUES
    (1, 1, 1, 4500.00),
    (1, 2, 1, 1200.00),
    (2, 5, 1, 1300.00),
    (2, 3, 1, 200.00);

SELECT nome, preco
FROM produtos
WHERE preco BETWEEN 100 AND 1000;

SELECT nome, estado
FROM clientes
WHERE estado IN ('SP', 'PR');

SELECT nome, email
FROM clientes
WHERE nome LIKE 'A%';

SELECT nome, email
FROM clientes
WHERE email IS NULL;

SET sql_safe_updates = 0;
UPDATE produtos
SET preco = preco * 1.10
WHERE nome LIKE '%Gamer%';

DELETE FROM clientes
WHERE cidade = 'Rio de Janeiro';

UPDATE produtos
SET preco = preco + 10
WHERE estoque > 10 AND preco < 500;

UPDATE produtos
SET estoque = estoque - 5
WHERE nome = 'Monitor 24"' OR estoque < 10;

UPDATE produtos
SET preco = preco * 1.05
WHERE preco > 1000 AND NOT (estoque < 10);

UPDATE produtos
SET preco = preco / 2
WHERE nome = 'Teclado Mecânico' AND estoque = 50;

-- DROP DATABASE ecommerce;
