select NOW();
select CURDATE();
select CURTIME();
select YEAR(NOW());
select MONTH(NOW());
select DAY(NOW());
SELECT DATE_ADD(NOW(), INTERVAL 7 DAY);
SELECT DATEDIFF(NOW(), '2010-02-05');

SELECT ABS(-10);
SELECT ROUND(3.14159, 2);
SELECT CEIL(3.2);
SELECT FLOOR(3.8);
SELECT POW(2, 3);
SELECT RAND();

SELECT UPPER('Augusto Esteves');
SELECT LOWER('AUGUSTO ESTEVES');
SELECT LENGTH('sql');
SELECT CONCAT('Augusto', ' ', 'Esteves');
SELECT SUBSTRING('Augusto Esteves', 1, 8);
SELECT REPLACE('Augusto Esteves', 'Esteves', 'Silva');
SELECT TRIM('   Augusto Esteves   ');

USE ecommerce;

SELECT COUNT(*) AS total_clientes FROM clientes;
SELECT SUM(preco) FROM produtos;
SELECT AVG(preco) FROM produtos;
SELECT MIN(preco) FROM produtos;
SELECT MAX(preco) FROM produtos;

ALTER TABLE produtos ADD COLUMN categoria varchar(50);

SELECT categoria, count(8) AS total_produtos
FROM produtos
GROUP BY categoria;

SELECT categoria, avg(preco) AS media_preco
FROM produtos
GROUP BY categoria;

SELECT categoria, min(preco) as menor_preco, max(preco) as max_preco
FROM produtos
GROUP BY categoria;
