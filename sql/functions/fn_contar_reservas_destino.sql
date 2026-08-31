-- =============================================================================
-- Função: fn_contar_reservas_destino
-- Quantidade de reservas de um destino.
-- =============================================================================

USE viagens;

DROP FUNCTION IF EXISTS fn_contar_reservas_destino;

DELIMITER $$

CREATE FUNCTION fn_contar_reservas_destino(p_id_destino INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_total INT;

    SELECT COUNT(*)
      INTO v_total
      FROM reservas
     WHERE id_destino = p_id_destino;

    RETURN v_total;
END

DELIMITER ;
