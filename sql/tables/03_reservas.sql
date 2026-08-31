-- =============================================================================
-- Tabela: reservas
-- Liga um usuário a um destino, com data e status
-- =============================================================================

USE viagens;

CREATE TABLE IF NOT EXISTS reservas (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    id_user     INT NOT NULL COMMENT 'FK para users.id',
    id_destino  INT NOT NULL COMMENT 'FK para destinos.id',
    data        DATE NOT NULL COMMENT 'Data da reserva',
    status      ENUM('pendente', 'confirmado', 'cancelado')
                    NOT NULL
                    DEFAULT 'pendente'
                    COMMENT 'Situação da reserva',

    CONSTRAINT fk_reservas_user
        FOREIGN KEY (id_user) REFERENCES users (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_reservas_destino
        FOREIGN KEY (id_destino) REFERENCES destinos (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  COMMENT = 'Reservas de viagem';
