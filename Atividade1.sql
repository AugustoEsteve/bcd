-- Atividade 1: Sistema Escola

CREATE DATABASE sistema_escola;
USE sistema_escola;

CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    formacao VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    disciplina VARCHAR(100) NOT NULL,

    id_professor INT NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE aluno_curso (
    id_aluno_curso INT PRIMARY KEY AUTO_INCREMENT,
    ano_semestre CHAR(10) NOT NULL,

    id_aluno INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

-- DROP DATABASE sistema_escola;

-- Inserção de registros
INSERT INTO aluno (nome, matricula, email) VALUES
('Ana Silva', '2024001', 'ana.silva@email.com'),
('Bruno Santos', '2024002', 'bruno.santos@email.com'),
('Carla Oliveira', '2024003', 'carla.oliveira@email.com');

INSERT INTO professor (nome, formacao, email) VALUES
('Carlos Eduardo', 'Sistemas de Informação', 'carlos.eduardo@escola.com'),
('Mariana Lima', 'Matemática', 'mariana.lima@escola.com'),
('Roberto Rocha', 'Engenharia de Software', 'roberto.rocha@escola.com');

INSERT INTO curso (disciplina, id_professor) VALUES
('Banco de Dados', 1),
('Cálculo I', 2),
('Engenharia de Requisitos', 3);

INSERT INTO aluno_curso (ano_semestre, id_aluno, id_curso) VALUES
('2024/1', 1, 1),
('2024/1', 2, 2),
('2024/1', 3, 3);
