-- =============================================================================
-- Tabela: destinos
-- Destinos disponíveis para reserva
-- =============================================================================

USE viagens;

CREATE TABLE IF NOT EXISTS destinos (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    nome       VARCHAR(255) NOT NULL COMMENT 'Nome do destino',
    descricao  VARCHAR(255) NOT NULL COMMENT 'Descrição do destino',

    CONSTRAINT uq_destinos_nome UNIQUE (nome)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  COMMENT = 'Cadastro de destinos';
