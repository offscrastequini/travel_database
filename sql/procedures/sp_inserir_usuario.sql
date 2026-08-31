-- =============================================================================
-- Procedure: sp_inserir_usuario
-- Cadastra um usuário e devolve o id gerado.
-- =============================================================================

USE viagens;

DROP PROCEDURE IF EXISTS sp_inserir_usuario;

DELIMITER $$

CREATE PROCEDURE sp_inserir_usuario(
    IN  p_nome            VARCHAR(255),
    IN  p_email           VARCHAR(100),
    IN  p_endereco        VARCHAR(50),
    IN  p_data_nascimento DATE,
    IN  p_rua             VARCHAR(255),
    IN  p_numero          INT,
    IN  p_bairro          VARCHAR(255),
    IN  p_cidade          VARCHAR(255),
    IN  p_estado          VARCHAR(2),
    IN  p_cep             VARCHAR(20),
    OUT p_id              INT
)
BEGIN
    INSERT INTO users (
        nome, email, endereco, data_nascimento,
        rua, numero, bairro, cidade, estado, cep
    ) VALUES (
        p_nome, p_email, p_endereco, p_data_nascimento,
        IFNULL(p_rua, ''), IFNULL(p_numero, 0), IFNULL(p_bairro, ''),
        IFNULL(p_cidade, ''), IFNULL(p_estado, ''), IFNULL(p_cep, '')
    );

    SET p_id = LAST_INSERT_ID();
END

DELIMITER ;
