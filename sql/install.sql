-- =============================================================================
-- Instalação do banco viagens
--
-- No cliente MySQL, a partir da raiz do projeto:
--
--   mysql -u root -p --default-character-set=utf8mb4
--   SOURCE sql/install.sql;
--
-- No Workbench: execute os arquivos na ordem abaixo (File > Run SQL Script).
-- Funções e procedures exigem que o delimitador seja respeitado; rode cada
-- arquivo da pasta functions/ e procedures/ individualmente se o SOURCE falhar.
-- =============================================================================

SOURCE sql/00_database.sql;

SOURCE sql/tables/01_users.sql;
SOURCE sql/tables/02_destinos.sql;
SOURCE sql/tables/03_reservas.sql;

SOURCE sql/indexes/01_indexes.sql;

SOURCE sql/functions/fn_calcular_idade.sql;
SOURCE sql/functions/fn_contar_reservas_usuario.sql;
SOURCE sql/functions/fn_contar_reservas_destino.sql;

SOURCE sql/procedures/sp_inserir_usuario.sql;
SOURCE sql/procedures/sp_inserir_destino.sql;
SOURCE sql/procedures/sp_inserir_reserva.sql;
SOURCE sql/procedures/sp_atualizar_status_reserva.sql;
SOURCE sql/procedures/sp_listar_reservas_usuario.sql;
SOURCE sql/procedures/sp_listar_reservas_pendentes.sql;
SOURCE sql/procedures/sp_relatorio_reservas.sql;

SOURCE sql/views/vw_reservas_detalhadas.sql;
SOURCE sql/views/vw_reservas_por_destino.sql;

SOURCE sql/data/01_seed.sql;
