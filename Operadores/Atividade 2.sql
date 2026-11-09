CREATE DATABASE enem;

USE enem;

CREATE TABLE estudantes (
    nome VARCHAR(100) PRIMARY KEY,
    acertos_linguagens INT NOT NULL,
    acertos_ciencias_humanas INT NOT NULL,
    acertos_ciencias_natureza INT NOT NULL,
    acertos_matematica INT NOT NULL
);

INSERT INTO estudantes (nome, acertos_linguagens, acertos_ciencias_humanas, 
acertos_ciencias_natureza, acertos_matematica) VALUES
    ('Mariana Souza', 38, 40, 32, 35),
    ('Lucas Oliveira', 34, 36, 39, 42),
    ('Beatriz Santos', 42, 38, 35, 37),
    ('Rafael Costa', 30, 33, 28, 31),
    ('Camila Almeida', 37, 41, 36, 40);

UPDATE estudantes
SET acertos_matematica = 43
WHERE nome = 'Lucas Oliveira';

DELETE FROM estudantes
WHERE nome = 'Rafael Costa';

SELECT nome, acertos_matematica
FROM estudantes
WHERE acertos_matematica >= 40
ORDER BY acertos_matematica DESC;