-- =============================================================================
-- Função: fn_calcular_idade
-- Retorna a idade em anos a partir da data de nascimento.
-- =============================================================================

USE viagens;

DROP FUNCTION IF EXISTS fn_calcular_idade;

DELIMITER $$

CREATE FUNCTION fn_calcular_idade(p_data_nascimento DATE)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, p_data_nascimento, CURDATE());
END

DELIMITER ;
