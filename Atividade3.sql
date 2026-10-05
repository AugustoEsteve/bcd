-- Atividade 3: Rede Social
CREATE DATABASE rede_social;
USE rede_social;

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    inscritos VARCHAR(100) NOT NULL UNIQUE,
    bio VARCHAR(300) NOT NULL
);

CREATE TABLE post (
    id_post INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descricao VARCHAR(300) NOT NULL,
    data_de_publicacao DATETIME DEFAULT CURRENT_TIMESTAMP,

    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE hashtag (
    id_hashtag INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    tema VARCHAR(50) NOT NULL,
    descricao VARCHAR(300) NOT NULL
);

CREATE TABLE post_hashtag (
    id_post_hashtag INT PRIMARY KEY AUTO_INCREMENT,

    id_post INT NOT NULL,
    FOREIGN KEY (id_post) REFERENCES post(id_post),
    id_hashtag INT NOT NULL,
    FOREIGN KEY (id_hashtag) REFERENCES hashtag(id_hashtag)
);

-- DROP DATABASE rede_social;

-- Inserção de registros
INSERT INTO usuario (username, inscritos, bio) VALUES
('joaosilva', '1500', 'Apaixonado por tecnologia e inovação.'),
('mariaoliveira', '2300', 'Fotógrafa e viajante. Compartilhando momentos incríveis.'),
('pedroalmeida', '1200', 'Entusiasta de esportes e vida saudável.');

INSERT INTO post (titulo, descricao, id_usuario) VALUES
('Explorando o Mundo da IA', 'Compartilhando insights sobre inteligência artificial e suas aplicações.', 1),
('Dicas de Fotografia', 'Aprenda técnicas para capturar momentos incríveis com sua câmera.', 2),
('Treino Funcional em Casa', 'Rotina de exercícios para manter a forma sem sair de casa.', 3);

INSERT INTO hashtag (nome, tema, descricao) VALUES
('#tecnologia', 'Inovação', 'Discussões e novidades sobre tecnologia e inovação.'),
('#fotografia', 'Arte', 'Dicas, técnicas e inspirações para fotógrafos.'),
('#fitness', 'Saúde', 'Conteúdos relacionados a exercícios físicos e vida saudável.');

INSERT INTO post_hashtag (id_post, id_hashtag) VALUES
(1, 1),
(2, 2),
(3, 3);
