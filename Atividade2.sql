-- Atividade 2: Empresa de Tecnologia
CREATE DATABASE empresa_tecnologia;
USE empresa_tecnologia;

CREATE TABLE departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    area VARCHAR(100) NOT NULL,
    descricao VARCHAR(300) NOT NULL
);

CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    funcao VARCHAR(50) NOT NULL,

    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

CREATE TABLE projeto (
    id_projeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    finalidade VARCHAR(300) NOT NULL,
    descricao VARCHAR(300) NOT NULL,
    data_inicio DATE NOT NULL
);

CREATE TABLE funcionario_projeto (
    id_funcionario_projeto INT PRIMARY KEY AUTO_INCREMENT,

    id_funcionario INT NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario),
    id_projeto INT NOT NULL,
    FOREIGN KEY (id_projeto) REFERENCES projeto(id_projeto)
);

-- DROP DATABASE empresa_tecnologia;

-- Inserção de registros
INSERT INTO departamento (nome, area, descricao) VALUES
('Desenvolvimento', 'Tecnologia', 'Responsável pela criação e manutenção dos softwares da empresa'),
('Infraestrutura', 'TI', 'Garante o funcionamento e segurança dos servidores e redes'),
('Produtos', 'Inovação', 'Define estratégias, requisitos e design dos novos produtos');

INSERT INTO funcionario (nome, email, funcao, id_departamento) VALUES
('Lucas Mendes', 'lucas.mendes@empresa.com', 'Desenvolvedor Backend', 1),
('Fernanda Costa', 'fernanda.costa@empresa.com', 'Analista de Redes', 2),
('Gabriel Souza', 'gabriel.souza@empresa.com', 'Product Owner', 3);

INSERT INTO projeto (nome, finalidade, descricao, data_inicio) VALUES
('App Mobile', 'Facilitar atendimento aos clientes', 'Desenvolvimento de aplicativo iOS e Android', '2024-01-15'),
('Migração Cloud', 'Reduzir custos de servidores físicos', 'Migração de infraestrutura local para AWS', '2024-02-01'),
('Novo CRM', 'Gerenciar vendas e contatos', 'Implementação de sistema interno de gestão de clientes', '2024-03-10');

INSERT INTO funcionario_projeto (id_funcionario, id_projeto) VALUES
(1, 1),
(2, 2),
(3, 3);