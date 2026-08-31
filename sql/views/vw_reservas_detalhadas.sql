-- =============================================================================
-- View: vw_reservas_detalhadas
-- Usuário + reserva + destino em uma única consulta.
-- =============================================================================

USE viagens;

CREATE OR REPLACE VIEW vw_reservas_detalhadas AS
SELECT
    US.id    AS user_id,
    US.nome  AS usuario,
    US.email,
    fn_calcular_idade(US.data_nascimento) AS idade,
    DS.id    AS destino_id,
    DS.nome  AS destino,
    RS.id    AS reserva_id,
    RS.data  AS data_reserva,
    RS.status
FROM users AS US
INNER JOIN reservas AS RS
    ON US.id = RS.id_user
INNER JOIN destinos AS DS
    ON RS.id_destino = DS.id;
