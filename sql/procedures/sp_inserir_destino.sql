-- =============================================================================
-- Procedure: sp_inserir_destino
-- Cadastra um destino e devolve o id gerado.
-- =============================================================================

USE viagens;

DROP PROCEDURE IF EXISTS sp_inserir_destino;

DELIMITER $$

CREATE PROCEDURE sp_inserir_destino(
    IN  p_nome      VARCHAR(255),
    IN  p_descricao VARCHAR(255),
    OUT p_id        INT
)
BEGIN
    INSERT INTO destinos (nome, descricao)
    VALUES (p_nome, p_descricao);

    SET p_id = LAST_INSERT_ID();
END

DELIMITER ;
