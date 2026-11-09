INSERT INTO clientes (nome, email, cidade, estado, telefone) VALUES
    ('Pedro Almeida', 'pedro@email.com', 'São Paulo', 'SP', '11977776666'),
    ('Julia Mendes', 'julia@email.com', 'Santos', 'SP', '13966665555');

UPDATE produtos
SET estoque = estoque + 10
WHERE nome = 'Mouse Gamer';

DELETE FROM clientes
WHERE email = 'joao@email.com';

SELECT nome, email, cidade
FROM clientes
WHERE estado = 'SP'
ORDER BY nome;

SELECT nome, preco
FROM produtos
WHERE preco BETWEEN 100 AND 1000;
