-- =============================================================================
-- Consultas de estudo (JOINs, subqueries, agregação, EXPLAIN)
-- Execute depois de sql/install.sql
-- =============================================================================

USE viagens;

-- ---------------------------------------------------------------------------
-- Filtros
-- ---------------------------------------------------------------------------

SELECT * FROM users WHERE data_nascimento > '1990-01-01';
SELECT * FROM destinos WHERE nome = 'Rio de Janeiro';
SELECT * FROM reservas WHERE status = 'pendente';

-- ---------------------------------------------------------------------------
-- INNER JOIN
-- ---------------------------------------------------------------------------

SELECT *
FROM users AS US
INNER JOIN reservas AS RS ON US.id = RS.id_user
INNER JOIN destinos AS DS ON RS.id_destino = DS.id;

SELECT
    US.id AS user_id,
    US.nome AS usuario,
    US.email,
    DS.nome AS destino,
    RS.data AS data_reserva,
    RS.status
FROM users AS US
INNER JOIN reservas AS RS ON US.id = RS.id_user
INNER JOIN destinos AS DS ON RS.id_destino = DS.id
ORDER BY RS.data;

-- ---------------------------------------------------------------------------
-- LEFT JOIN / RIGHT JOIN / FULL JOIN simulado
-- ---------------------------------------------------------------------------

SELECT *
FROM users AS US
LEFT JOIN reservas AS RS ON US.id = RS.id_user
LEFT JOIN destinos AS DS ON RS.id_destino = DS.id
WHERE US.id = 1;

SELECT *
FROM reservas AS RS
RIGHT JOIN destinos AS DS ON RS.id_destino = DS.id;

SELECT
    RS.id AS reserva_id,
    RS.id_user,
    RS.id_destino,
    RS.data,
    RS.status,
    DS.nome AS destino
FROM reservas AS RS
LEFT JOIN destinos AS DS ON RS.id_destino = DS.id

UNION

SELECT
    RS.id AS reserva_id,
    RS.id_user,
    RS.id_destino,
    RS.data,
    RS.status,
    DS.nome AS destino
FROM reservas AS RS
RIGHT JOIN destinos AS DS ON RS.id_destino = DS.id;

-- ---------------------------------------------------------------------------
-- Subqueries
-- ---------------------------------------------------------------------------

SELECT * FROM destinos WHERE id NOT IN (SELECT id_destino FROM reservas);
SELECT * FROM users WHERE id NOT IN (SELECT id_user FROM reservas);
SELECT * FROM users WHERE id IN (SELECT id_user FROM reservas);
SELECT * FROM destinos WHERE id IN (SELECT id_destino FROM reservas);

SELECT
    nome,
    fn_contar_reservas_usuario(id) AS total_reservas
FROM users;

SELECT
    nome,
    fn_contar_reservas_destino(id) AS total_reservas
FROM destinos;

-- ---------------------------------------------------------------------------
-- Agregação
-- ---------------------------------------------------------------------------

SELECT MAX(fn_calcular_idade(data_nascimento)) AS maior_idade
FROM users;

SELECT COUNT(*) AS qtd_reservas, id_destino
FROM reservas
GROUP BY id_destino
ORDER BY qtd_reservas DESC, id_destino ASC;

-- ---------------------------------------------------------------------------
-- Views e procedures
-- ---------------------------------------------------------------------------

SELECT * FROM vw_reservas_detalhadas;
SELECT * FROM vw_reservas_por_destino;

CALL sp_listar_reservas_usuario(1);
CALL sp_listar_reservas_pendentes();
CALL sp_relatorio_reservas();

-- ---------------------------------------------------------------------------
-- EXPLAIN (índice UNIQUE em email vs índice em nome)
-- ---------------------------------------------------------------------------

EXPLAIN SELECT * FROM users WHERE email = 'sofia.mendes@gmail.com';
EXPLAIN SELECT * FROM users WHERE nome = 'Vinícius Duarte';
