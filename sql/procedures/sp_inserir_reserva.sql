-- =============================================================================
-- Procedure: sp_inserir_reserva
-- Cria uma reserva (status padrão: pendente).
-- =============================================================================

USE viagens;

DROP PROCEDURE IF EXISTS sp_inserir_reserva;

DELIMITER $$

CREATE PROCEDURE sp_inserir_reserva(
    IN  p_id_user    INT,
    IN  p_id_destino INT,
    IN  p_data       DATE,
    OUT p_id         INT
)
BEGIN
    INSERT INTO reservas (id_user, id_destino, data, status)
    VALUES (p_id_user, p_id_destino, p_data, 'pendente');

    SET p_id = LAST_INSERT_ID();
END

DELIMITER ;
