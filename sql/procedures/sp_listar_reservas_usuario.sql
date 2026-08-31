-- =============================================================================
-- Procedure: sp_listar_reservas_usuario
-- Lista as reservas de um usuário com destino e idade.
-- =============================================================================

USE viagens;

DROP PROCEDURE IF EXISTS sp_listar_reservas_usuario;

DELIMITER $$

CREATE PROCEDURE sp_listar_reservas_usuario(IN p_id_user INT)
BEGIN
    SELECT
        US.id                         AS user_id,
        US.nome                       AS usuario,
        US.email,
        fn_calcular_idade(US.data_nascimento) AS idade,
        DS.id                         AS destino_id,
        DS.nome                       AS destino,
        RS.data                       AS data_reserva,
        RS.status
    FROM users AS US
    INNER JOIN reservas AS RS
        ON US.id = RS.id_user
    INNER JOIN destinos AS DS
        ON RS.id_destino = DS.id
    WHERE US.id = p_id_user
    ORDER BY RS.data;
END

DELIMITER ;
