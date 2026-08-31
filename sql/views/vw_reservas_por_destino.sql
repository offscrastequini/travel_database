-- =============================================================================
-- View: vw_reservas_por_destino
-- =============================================================================

USE viagens;

CREATE OR REPLACE VIEW vw_reservas_por_destino AS
SELECT
    DS.id    AS destino_id,
    DS.nome  AS destino,
    COUNT(RS.id) AS qtd_reservas
FROM destinos AS DS
LEFT JOIN reservas AS RS
    ON DS.id = RS.id_destino
GROUP BY DS.id, DS.nome;
