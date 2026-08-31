-- =============================================================================
-- Procedure: sp_atualizar_status_reserva
-- Altera o status de uma reserva existente.
-- =============================================================================

USE viagens;

DROP PROCEDURE IF EXISTS sp_atualizar_status_reserva;

DELIMITER $$

CREATE PROCEDURE sp_atualizar_status_reserva(
    IN p_id     INT,
    IN p_status ENUM('pendente', 'confirmado', 'cancelado')
)
BEGIN
    UPDATE reservas
       SET status = p_status
     WHERE id = p_id;

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Reserva não encontrada.';
    END IF;
END

DELIMITER ;
