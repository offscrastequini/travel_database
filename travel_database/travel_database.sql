CREATE DATABASE IF NOT EXISTS viagens;

USE viagens;


CREATE TABLE users (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL COMMENT 'Nome do user',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Email do user',
    endereço VARCHAR(50) NOT NULL COMMENT 'Endereço do user',
    data_nascimento DATE NOT NULL COMMENT 'Data de nascimento do user'
);


CREATE TABLE destinos (
    id INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL UNIQUE COMMENT 'Nome do destino',
    descrição VARCHAR(255) NOT NULL COMMENT 'Descrição do destino'
);


CREATE TABLE reservas (
    id INT PRIMARY KEY,
    id_user INT COMMENT 'ID do user',
    id_destino INT COMMENT 'ID do destino',
    data DATE COMMENT 'Data da reserva',
    status VARCHAR(255) DEFAULT 'pendente' COMMENT 'Status da reserva',

    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (id_destino) REFERENCES destinos(id)
);


INSERT INTO users (id, nome, email, endereço, data_nascimento)
VALUES (1, 'Samuel Crastequini', 'samcrastequini@gmail.com', 'São Paulo', '2007-07-31');

INSERT INTO users (id, nome, email, endereço, data_nascimento)
VALUES (2, 'João da Silva', 'joao@gmail.com', 'São Paulo', '1990-01-01');

INSERT INTO users (id, nome, email, endereço, data_nascimento)
VALUES (3, 'Maria Oliveira', 'maria@gmail.com', 'Rio de Janeiro', '1995-05-20');


INSERT INTO destinos (id, Nome, descrição)
VALUES (1, 'Munique', 'Cidade alemã, conhecida por sua arquitetura e cultura.');

INSERT INTO destinos (id, Nome, descrição)
VALUES (2, 'Rio de Janeiro', 'Cidade brasileira, conhecida por sua arquitetura e cultura.');

INSERT INTO destinos (id, Nome, descrição)
VALUES (3, 'São Paulo', 'Cidade brasileira, conhecida por sua arquitetura e cultura.');


INSERT INTO reservas (id, id_user, id_destino, data, status)
VALUES (1, 1, 1, '2026-09-01', 'pendente');

INSERT INTO reservas (id, id_user, id_destino, data, status)
VALUES (2, 2, 2, '2026-10-01', 'pendente');

INSERT INTO reservas (id, id_user, id_destino, data, status)
VALUES (3, 3, 3, '2026-11-01', 'pendente');


SELECT * FROM users;

SELECT * FROM destinos;

SELECT * FROM reservas;


SELECT * 
FROM users 
WHERE data_nascimento > '1990-01-01';

SELECT * 
FROM destinos 
WHERE Nome = 'Rio de Janeiro';

SELECT * 
FROM reservas 
WHERE status = 'pendente';


UPDATE users
SET endereço = 'São Paulo'
WHERE data_nascimento > '2008-07-31';

UPDATE users
SET endereço = 'Rio de Janeiro'
WHERE data_nascimento > '1995-05-20';

UPDATE users
SET endereço = 'Munique'
WHERE data_nascimento > '1990-01-01';


UPDATE destinos
SET Nome = 'São Paulo'
WHERE id = 3;

UPDATE destinos
SET Nome = 'Rio de Janeiro'
WHERE id = 2;

UPDATE destinos
SET Nome = 'Munique'
WHERE id = 1;


UPDATE reservas
SET status = 'confirmado'
WHERE id = 1;

UPDATE reservas
SET status = 'confirmado'
WHERE id = 2;

UPDATE reservas
SET status = 'confirmado'
WHERE id = 3;


ALTER TABLE users
ADD rua VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Rua do user';

ALTER TABLE users
ADD numero INT NOT NULL DEFAULT 0 COMMENT 'Número da casa do user';

ALTER TABLE users
ADD bairro VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Bairro do user';

ALTER TABLE users
ADD cidade VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Cidade do user';

ALTER TABLE users
ADD estado VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Estado do user';

ALTER TABLE users
ADD cep VARCHAR(20) NOT NULL DEFAULT '' COMMENT 'CEP do user';


UPDATE users
SET rua = 'Rua das Flores',
    numero = 123,
    bairro = 'Jardim das Flores',
    cidade = 'São Paulo',
    estado = 'SP',
    cep = '12345-678'
WHERE id = 1;

UPDATE users
SET rua = 'Rua das Flores',
    numero = 123,
    bairro = 'Jardim das Flores',
    cidade = 'São Paulo',
    estado = 'SP',
    cep = '12345-678'
WHERE id = 2;

UPDATE users
SET rua = 'Rua das Flores',
    numero = 123,
    bairro = 'Jardim das Flores',
    cidade = 'Rio de Janeiro',
    estado = 'RJ',
    cep = '12345-678'
WHERE id = 3;


SELECT * FROM users;