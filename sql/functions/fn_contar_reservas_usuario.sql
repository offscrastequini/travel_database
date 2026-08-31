-- =============================================================================
-- Função: fn_contar_reservas_usuario
-- Quantidade de reservas de um usuário.
-- =============================================================================

USE viagens;

DROP FUNCTION IF EXISTS fn_contar_reservas_usuario;

DELIMITER $$

CREATE FUNCTION fn_contar_reservas_usuario(p_id_user INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_total INT;

    SELECT COUNT(*)
      INTO v_total
      FROM reservas
     WHERE id_user = p_id_user;

    RETURN v_total;
END

DELIMITER ;
