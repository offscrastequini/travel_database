-- =============================================================================
-- Procedure: sp_listar_reservas_pendentes
-- =============================================================================

USE viagens;

DROP PROCEDURE IF EXISTS sp_listar_reservas_pendentes;

DELIMITER $$

CREATE PROCEDURE sp_listar_reservas_pendentes()
BEGIN
    SELECT
        RS.id,
        US.nome  AS usuario,
        US.email,
        DS.nome  AS destino,
        RS.data,
        RS.status
    FROM reservas AS RS
    INNER JOIN users AS US
        ON RS.id_user = US.id
    INNER JOIN destinos AS DS
        ON RS.id_destino = DS.id
    WHERE RS.status = 'pendente'
    ORDER BY RS.data;
END

DELIMITER ;
