-- =============================================================================
-- Índices secundários
-- As FKs de reservas já geram índices em id_user e id_destino.
-- O e-mail de users já possui índice UNIQUE.
-- =============================================================================

USE viagens;

CREATE INDEX idx_users_nome
    ON users (nome);

CREATE INDEX idx_reservas_status
    ON reservas (status);

CREATE INDEX idx_reservas_data
    ON reservas (data);
