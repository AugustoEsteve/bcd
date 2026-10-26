CREATE DATABASE biblioteca;
USE biblioteca;

-- Criação das tabelas
CREATE TABLE Leitor (
    id_leitor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    numero_emprestimos INT NOT NULL,
    ocupacao ENUM('estudante', 'professor', 'funcionario') NOT NULL
);

CREATE TABLE Autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(20) NOT NULL,
    biografia VARCHAR(300) NOT NULL,
    vivo BOOLEAN NOT NULL
);

CREATE TABLE Livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sintese VARCHAR(300) NOT NULL,
    editora VARCHAR(100) NOT NULL,
    data_publicacao DATE NOT NULL,
    
    id_autor INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor)
);

CREATE TABLE Emprestimo (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATE NOT NULL,

    id_leitor INT NOT NULL,
    FOREIGN KEY (id_leitor) REFERENCES Leitor(id_leitor),

    id_livro INT NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro)
);

-- Inserção de exemplos
INSERT INTO Leitor (nome, email, numero_emprestimos, ocupacao) VALUES
('Ana Silva', 'ana.silva@example.com', 2, 'estudante'),
('Bruno Costa', 'bruno.costa@example.com', 1, 'professor'),
('Carla Souza', 'carla.souza@example.com', 3, 'funcionario'),
('Diego Oliveira', 'diego.oliveira@example.com', 0, 'estudante');

INSERT INTO Autor (nome, nacionalidade, biografia, vivo) VALUES
('Machado de Assis', 'brasileira', 'Escritor brasileiro, considerado um dos maiores nomes da literatura nacional.', FALSE),
('Clarice Lispector', 'brasileira', 'Escritora brasileira conhecida por sua prosa introspectiva.', FALSE),
('Jorge Amado', 'brasileira', 'Romancista brasileiro cujas obras retratam a cultura da Bahia.', FALSE),
('Conceicao Evaristo', 'brasileira', 'Escritora brasileira reconhecida por sua contribuição a literatura contemporanea.', TRUE);

INSERT INTO Livro (nome, sintese, editora, data_publicacao, id_autor) VALUES
('Dom Casmurro', 'Romance que narra as memorias de Bento Santiago e sua relacao com Capitu.', 'Editora Nacional', '1899-01-01', 1),
('A Hora da Estrela', 'Narrativa sobre Macabea, uma jovem nordestina vivendo no Rio de Janeiro.', 'Rocco', '1977-01-01', 2),
('Capitaes da Areia', 'Historia de um grupo de meninos que vive nas ruas de Salvador.', 'Companhia das Letras', '1937-01-01', 3),
('Olhos d Agua', 'Coletanea de contos sobre memoria, identidade e experiencias afro-brasileiras.', 'Pallas', '2014-01-01', 4);

INSERT INTO Emprestimo (data_emprestimo, id_leitor, id_livro) VALUES
('2026-01-10', 1, 1),
('2026-01-12', 2, 2),
('2026-01-15', 3, 3),
('2026-01-18', 4, 4);

-- Adiciona parâmetro de telefone a tabela Leitor
ALTER TABLE Leitor
ADD telefone VARCHAR(20);

-- Altera o número de emprestimos para o leitor com ID 4 (Diego Oliveira)
UPDATE Leitor
SET numero_emprestimos = 2
WHERE id_leitor = 4;

-- Remove o emprestimo de ID 4
DELETE FROM Emprestimo
WHERE id_emprestimo = 4;

-- Apaga o banco de dados
DROP DATABASE biblioteca