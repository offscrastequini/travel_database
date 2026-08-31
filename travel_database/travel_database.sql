CREATE DATABASE IF NOT EXISTS viagens;

USE viagens;


-- Tabela de usuários

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL COMMENT 'Nome do usuário',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Email do usuário',
    endereço VARCHAR(50) NOT NULL COMMENT 'Endereço do usuário',
    data_nascimento DATE NOT NULL COMMENT 'Data de nascimento do usuário'
);


-- Tabela de destinos

CREATE TABLE destinos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL UNIQUE COMMENT 'Nome do destino',
    descrição VARCHAR(255) NOT NULL COMMENT 'Descrição do destino'
);


-- Tabela de reservas

CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL COMMENT 'ID do usuário',
    id_destino INT NOT NULL COMMENT 'ID do destino',
    data DATE NOT NULL COMMENT 'Data da reserva',
    status ENUM('pendente', 'confirmado', 'cancelado')
        NOT NULL DEFAULT 'pendente'
        COMMENT 'Status da reserva',

    FOREIGN KEY (id_user) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (id_destino) REFERENCES destinos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- Inserindo usuários

INSERT INTO users (nome, email, endereço, data_nascimento)
VALUES
    ('Samuel Crastequini', 'samcrastequini@gmail.com', 'São Paulo', '2007-07-31'),
    ('João da Silva', 'joao@gmail.com', 'São Paulo', '1990-01-01'),
    ('Maria Oliveira', 'maria@gmail.com', 'Rio de Janeiro', '1995-05-20');


-- Inserindo destinos

INSERT INTO destinos (Nome, descrição)
VALUES
    ('Munique', 'Cidade alemã, conhecida por sua arquitetura e cultura.'),
    ('Rio de Janeiro', 'Cidade brasileira, conhecida por sua arquitetura e cultura.'),
    ('São Paulo', 'Cidade brasileira, conhecida por sua arquitetura e cultura.');


-- Inserindo reservas

INSERT INTO reservas (id_user, id_destino, data, status)
VALUES
    (1, 1, '2026-09-01', 'pendente'),
    (2, 2, '2026-10-01', 'pendente'),
    (3, 3, '2026-11-01', 'pendente');


-- Consultando tabelas

SELECT * FROM users;

SELECT * FROM destinos;

SELECT * FROM reservas;


-- Consultando usuários por data de nascimento

SELECT *
FROM users
WHERE data_nascimento > '1990-01-01';


-- Consultando destino específico

SELECT *
FROM destinos
WHERE Nome = 'Rio de Janeiro';


-- Consultando reservas pendentes

SELECT *
FROM reservas
WHERE status = 'pendente';


-- Atualizando endereços

UPDATE users
SET endereço = 'São Paulo'
WHERE id = 1;

UPDATE users
SET endereço = 'Rio de Janeiro'
WHERE id = 3;

UPDATE users
SET endereço = 'Munique'
WHERE id = 2;


-- Atualizando destinos

UPDATE destinos
SET Nome = 'São Paulo'
WHERE id = 3;

UPDATE destinos
SET Nome = 'Rio de Janeiro'
WHERE id = 2;

UPDATE destinos
SET Nome = 'Munique'
WHERE id = 1;


-- Atualizando status das reservas

UPDATE reservas
SET status = 'confirmado'
WHERE id = 1;

UPDATE reservas
SET status = 'confirmado'
WHERE id = 2;

UPDATE reservas
SET status = 'confirmado'
WHERE id = 3;


-- Adicionando informações de endereço

ALTER TABLE users
ADD rua VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Rua do usuário';

ALTER TABLE users
ADD numero INT NOT NULL DEFAULT 0 COMMENT 'Número da casa do usuário';

ALTER TABLE users
ADD bairro VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Bairro do usuário';

ALTER TABLE users
ADD cidade VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Cidade do usuário';

ALTER TABLE users
ADD estado VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Estado do usuário';

ALTER TABLE users
ADD cep VARCHAR(20) NOT NULL DEFAULT '' COMMENT 'CEP do usuário';


-- Atualizando endereços dos usuários

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


-- INNER JOIN

SELECT *
FROM users AS US
INNER JOIN reservas AS RS
    ON US.id = RS.id_user
INNER JOIN destinos AS DS
    ON RS.id_destino = DS.id;


-- INNER JOIN com filtro

SELECT *
FROM users AS US
INNER JOIN reservas AS RS
    ON US.id = RS.id_user
INNER JOIN destinos AS DS
    ON RS.id_destino = DS.id
WHERE US.id = 1;


-- LEFT JOIN

SELECT *
FROM users AS US
LEFT JOIN reservas AS RS
    ON US.id = RS.id_user
LEFT JOIN destinos AS DS
    ON RS.id_destino = DS.id
WHERE US.id = 1;

SELECT *
FROM users AS US
LEFT JOIN reservas AS RS
    ON US.id = RS.id_user
LEFT JOIN destinos AS DS
    ON RS.id_destino = DS.id
WHERE US.id = 2;

SELECT *
FROM users AS US
LEFT JOIN reservas AS RS
    ON US.id = RS.id_user
LEFT JOIN destinos AS DS
    ON RS.id_destino = DS.id
WHERE US.id = 3;


-- RIGHT JOIN

SELECT *
FROM reservas AS RS
RIGHT JOIN destinos AS DS
    ON RS.id_destino = DS.id;


-- FULL JOIN simulado com UNION

SELECT
    RS.id AS reserva_id,
    RS.id_user,
    RS.id_destino,
    RS.data,
    RS.status,
    DS.Nome AS destino
FROM reservas AS RS
LEFT JOIN destinos AS DS
    ON RS.id_destino = DS.id

UNION

SELECT
    RS.id AS reserva_id,
    RS.id_user,
    RS.id_destino,
    RS.data,
    RS.status,
    DS.Nome AS destino
FROM reservas AS RS
RIGHT JOIN destinos AS DS
    ON RS.id_destino = DS.id;


-- Consulta relacionando usuários, reservas e destinos

SELECT
    US.id AS user_id,
    US.nome AS user_name,
    US.email,
    DS.id AS destination_id,
    DS.Nome AS destination,
    RS.data AS reservation_date,
    RS.status
FROM users AS US
INNER JOIN reservas AS RS
    ON US.id = RS.id_user
INNER JOIN destinos AS DS
    ON RS.id_destino = DS.id;


-- Reservas de um usuário específico

SELECT
    US.id AS user_id,
    US.nome AS user_name,
    US.email,
    DS.Nome AS destination,
    RS.data AS reservation_date,
    RS.status
FROM users AS US
INNER JOIN reservas AS RS
    ON US.id = RS.id_user
INNER JOIN destinos AS DS
    ON RS.id_destino = DS.id
WHERE US.id = 1;


-- Índices

CREATE INDEX idx_reservas_user
ON reservas(id_user);

CREATE INDEX idx_reservas_destino
ON reservas(id_destino);

CREATE INDEX idx_reservas_status
ON reservas(status);


-- Consulta final

SELECT
    US.nome AS usuario,
    US.email,
    DS.Nome AS destino,
    RS.data AS data_reserva,
    RS.status
FROM users AS US
INNER JOIN reservas AS RS
    ON US.id = RS.id_user
INNER JOIN destinos AS DS
    ON RS.id_destino = DS.id
ORDER BY RS.data;


-- Subqueries com IN / NOT IN

SELECT *
FROM destinos
WHERE id NOT IN (
    SELECT id_destino
    FROM reservas
);

SELECT *
FROM users
WHERE id NOT IN (
    SELECT id_user
    FROM reservas
);

SELECT *
FROM users
WHERE id IN (
    SELECT id_user
    FROM reservas
);

SELECT *
FROM destinos
WHERE id IN (
    SELECT id_destino
    FROM reservas
);

SELECT *
FROM reservas
WHERE id_user IN (
    SELECT id
    FROM users
);

SELECT *
FROM reservas
WHERE id_destino IN (
    SELECT id
    FROM destinos
);


-- Subqueries correlacionadas contando reservas

SELECT
    nome,
    (
        SELECT COUNT(*)
        FROM reservas
        WHERE id_user = users.id
    ) AS total_reservas
FROM users;


SELECT
    Nome,
    (
        SELECT COUNT(*)
        FROM reservas
        WHERE id_destino = destinos.id
    ) AS total_reservas
FROM destinos;


-- Contando total de reservas

SELECT COUNT(*) AS total_reservas
FROM users AS US
INNER JOIN reservas AS RS
    ON US.id = RS.id_user;


-- Maior idade entre os usuários

SELECT
    MAX(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) AS maior_idade
FROM users;


-- Quantidade de reservas por destino

SELECT *
FROM reservas;


SELECT
    COUNT(*) AS qtd_reservas,
    id_destino
FROM reservas
GROUP BY id_destino
ORDER BY qtd_reservas DESC, id_destino ASC;


-- Inserindo novos usuários

INSERT INTO users (nome, email, endereço, data_nascimento)
VALUES
    ('Carlos Mendes', 'carlos.mendes@gmail.com', 'São Paulo', '1988-03-15'),
    ('Ana Souza', 'ana.souza@gmail.com', 'Rio de Janeiro', '1992-07-21'),
    ('Lucas Ferreira', 'lucas.ferreira@gmail.com', 'Belo Horizonte', '1998-11-09'),
    ('Beatriz Lima', 'beatriz.lima@gmail.com', 'Curitiba', '1995-02-17'),
    ('Rafael Oliveira', 'rafael.oliveira@gmail.com', 'Salvador', '1991-06-28'),
    ('Juliana Costa', 'juliana.costa@gmail.com', 'Recife', '1997-09-12'),
    ('Gabriel Santos', 'gabriel.santos@gmail.com', 'Porto Alegre', '2000-01-25'),
    ('Larissa Almeida', 'larissa.almeida@gmail.com', 'Fortaleza', '1999-04-03'),
    ('Mateus Rodrigues', 'mateus.rodrigues@gmail.com', 'Campinas', '1993-08-19'),
    ('Camila Martins', 'camila.martins@gmail.com', 'São José dos Campos', '1996-12-07'),
    ('Bruno Carvalho', 'bruno.carvalho@gmail.com', 'Santos', '1989-05-14'),
    ('Mariana Gomes', 'mariana.gomes@gmail.com', 'Niterói', '1994-10-30'),
    ('Pedro Ribeiro', 'pedro.ribeiro@gmail.com', 'Brasília', '1990-03-22'),
    ('Isabela Fernandes', 'isabela.fernandes@gmail.com', 'Goiânia', '2001-07-11'),
    ('Thiago Barbosa', 'thiago.barbosa@gmail.com', 'Manaus', '1987-11-26'),
    ('Amanda Lopes', 'amanda.lopes@gmail.com', 'Belém', '1998-02-08'),
    ('Felipe Nascimento', 'felipe.nascimento@gmail.com', 'Vitória', '1992-06-16'),
    ('Letícia Teixeira', 'leticia.teixeira@gmail.com', 'Florianópolis', '1999-09-05'),
    ('Rodrigo Moreira', 'rodrigo.moreira@gmail.com', 'Maringá', '1986-04-27'),
    ('Bianca Cardoso', 'bianca.cardoso@gmail.com', 'Londrina', '1997-01-18'),
    ('André Vieira', 'andre.vieira@gmail.com', 'Ribeirão Preto', '1993-05-09'),
    ('Natália Correia', 'natalia.correia@gmail.com', 'Uberlândia', '1995-08-23'),
    ('Eduardo Monteiro', 'eduardo.monteiro@gmail.com', 'Sorocaba', '1985-12-14'),
    ('Carolina Batista', 'carolina.batista@gmail.com', 'São Bernardo do Campo', '2000-06-02'),
    ('Vinícius Duarte', 'vinicius.duarte@gmail.com', 'Santo André', '1996-10-17'),
    ('Fernanda Castro', 'fernanda.castro@gmail.com', 'Osasco', '1991-03-29'),
    ('Gustavo Pinto', 'gustavo.pinto@gmail.com', 'Jundiaí', '1994-07-06'),
    ('Renata Freitas', 'renata.freitas@gmail.com', 'Piracicaba', '1998-11-21'),
    ('Leonardo Ramos', 'leonardo.ramos@gmail.com', 'Taubaté', '1989-02-13'),
    ('Sofia Mendes', 'sofia.mendes@gmail.com', 'Jacareí', '2002-09-28');


-- EXPLAIN buscando usuário pelo email

EXPLAIN
SELECT *
FROM users
WHERE email = 'sofia.mendes@gmail.com';


-- EXPLAIN buscando usuário pelo nome antes do índice

EXPLAIN
SELECT *
FROM users
WHERE nome = 'Vinícius Duarte';


-- Criando índice para o nome

CREATE INDEX idx_nome
ON users(nome);


-- EXPLAIN buscando usuário pelo nome depois do índice

EXPLAIN
SELECT *
FROM users
WHERE nome = 'Vinícius Duarte';