-- =============================================================================
-- Tabela: users
-- Usuários do sistema de viagens
-- =============================================================================

USE viagens;

CREATE TABLE IF NOT EXISTS users (
    id               INT AUTO_INCREMENT PRIMARY KEY,
    nome             VARCHAR(255) NOT NULL COMMENT 'Nome do usuário',
    email            VARCHAR(100) NOT NULL COMMENT 'E-mail do usuário',
    endereco         VARCHAR(50)  NOT NULL COMMENT 'Cidade / referência de endereço',
    data_nascimento  DATE         NOT NULL COMMENT 'Data de nascimento',
    rua              VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Rua',
    numero           INT          NOT NULL DEFAULT 0  COMMENT 'Número',
    bairro           VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Bairro',
    cidade           VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Cidade',
    estado           VARCHAR(2)   NOT NULL DEFAULT '' COMMENT 'UF',
    cep              VARCHAR(20)  NOT NULL DEFAULT '' COMMENT 'CEP',

    CONSTRAINT uq_users_email UNIQUE (email)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  COMMENT = 'Cadastro de usuários';
