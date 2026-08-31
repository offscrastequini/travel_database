-- =============================================================================
-- Procedure: sp_relatorio_reservas
-- Totais por destino, usuários/destinos sem reserva e maior idade.
-- =============================================================================

USE viagens;

DROP PROCEDURE IF EXISTS sp_relatorio_reservas;

DELIMITER $$

CREATE PROCEDURE sp_relatorio_reservas()
BEGIN
    SELECT
        DS.id,
        DS.nome,
        fn_contar_reservas_destino(DS.id) AS qtd_reservas
    FROM destinos AS DS
    ORDER BY qtd_reservas DESC, DS.id ASC;

    SELECT *
    FROM destinos
    WHERE id NOT IN (SELECT id_destino FROM reservas);

    SELECT *
    FROM users
    WHERE id NOT IN (SELECT id_user FROM reservas);

    SELECT
        MAX(fn_calcular_idade(data_nascimento)) AS maior_idade
    FROM users;
END

DELIMITER ;
