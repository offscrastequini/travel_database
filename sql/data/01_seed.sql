-- =============================================================================
-- Dados iniciais
-- =============================================================================

USE viagens;

INSERT INTO destinos (nome, descricao)
VALUES
    ('Munique', 'Cidade alemã, conhecida por sua arquitetura e cultura.'),
    ('Rio de Janeiro', 'Cidade brasileira, conhecida por sua arquitetura e cultura.'),
    ('São Paulo', 'Cidade brasileira, conhecida por sua arquitetura e cultura.');

INSERT INTO users (
    nome, email, endereco, data_nascimento,
    rua, numero, bairro, cidade, estado, cep
) VALUES
    ('Samuel Crastequini', 'samcrastequini@gmail.com', 'São Paulo', '2007-07-31',
     'Rua das Flores', 123, 'Jardim das Flores', 'São Paulo', 'SP', '12345-678'),
    ('João da Silva', 'joao@gmail.com', 'Munique', '1990-01-01',
     'Rua das Flores', 123, 'Jardim das Flores', 'São Paulo', 'SP', '12345-678'),
    ('Maria Oliveira', 'maria@gmail.com', 'Rio de Janeiro', '1995-05-20',
     'Rua das Flores', 123, 'Jardim das Flores', 'Rio de Janeiro', 'RJ', '12345-678'),
    ('Carlos Mendes', 'carlos.mendes@gmail.com', 'São Paulo', '1988-03-15',
     '', 0, '', 'São Paulo', 'SP', ''),
    ('Ana Souza', 'ana.souza@gmail.com', 'Rio de Janeiro', '1992-07-21',
     '', 0, '', 'Rio de Janeiro', 'RJ', ''),
    ('Lucas Ferreira', 'lucas.ferreira@gmail.com', 'Belo Horizonte', '1998-11-09',
     '', 0, '', 'Belo Horizonte', 'MG', ''),
    ('Beatriz Lima', 'beatriz.lima@gmail.com', 'Curitiba', '1995-02-17',
     '', 0, '', 'Curitiba', 'PR', ''),
    ('Rafael Oliveira', 'rafael.oliveira@gmail.com', 'Salvador', '1991-06-28',
     '', 0, '', 'Salvador', 'BA', ''),
    ('Juliana Costa', 'juliana.costa@gmail.com', 'Recife', '1997-09-12',
     '', 0, '', 'Recife', 'PE', ''),
    ('Gabriel Santos', 'gabriel.santos@gmail.com', 'Porto Alegre', '2000-01-25',
     '', 0, '', 'Porto Alegre', 'RS', ''),
    ('Larissa Almeida', 'larissa.almeida@gmail.com', 'Fortaleza', '1999-04-03',
     '', 0, '', 'Fortaleza', 'CE', ''),
    ('Mateus Rodrigues', 'mateus.rodrigues@gmail.com', 'Campinas', '1993-08-19',
     '', 0, '', 'Campinas', 'SP', ''),
    ('Camila Martins', 'camila.martins@gmail.com', 'São José dos Campos', '1996-12-07',
     '', 0, '', 'São José dos Campos', 'SP', ''),
    ('Bruno Carvalho', 'bruno.carvalho@gmail.com', 'Santos', '1989-05-14',
     '', 0, '', 'Santos', 'SP', ''),
    ('Mariana Gomes', 'mariana.gomes@gmail.com', 'Niterói', '1994-10-30',
     '', 0, '', 'Niterói', 'RJ', ''),
    ('Pedro Ribeiro', 'pedro.ribeiro@gmail.com', 'Brasília', '1990-03-22',
     '', 0, '', 'Brasília', 'DF', ''),
    ('Isabela Fernandes', 'isabela.fernandes@gmail.com', 'Goiânia', '2001-07-11',
     '', 0, '', 'Goiânia', 'GO', ''),
    ('Thiago Barbosa', 'thiago.barbosa@gmail.com', 'Manaus', '1987-11-26',
     '', 0, '', 'Manaus', 'AM', ''),
    ('Amanda Lopes', 'amanda.lopes@gmail.com', 'Belém', '1998-02-08',
     '', 0, '', 'Belém', 'PA', ''),
    ('Felipe Nascimento', 'felipe.nascimento@gmail.com', 'Vitória', '1992-06-16',
     '', 0, '', 'Vitória', 'ES', ''),
    ('Letícia Teixeira', 'leticia.teixeira@gmail.com', 'Florianópolis', '1999-09-05',
     '', 0, '', 'Florianópolis', 'SC', ''),
    ('Rodrigo Moreira', 'rodrigo.moreira@gmail.com', 'Maringá', '1986-04-27',
     '', 0, '', 'Maringá', 'PR', ''),
    ('Bianca Cardoso', 'bianca.cardoso@gmail.com', 'Londrina', '1997-01-18',
     '', 0, '', 'Londrina', 'PR', ''),
    ('André Vieira', 'andre.vieira@gmail.com', 'Ribeirão Preto', '1993-05-09',
     '', 0, '', 'Ribeirão Preto', 'SP', ''),
    ('Natália Correia', 'natalia.correia@gmail.com', 'Uberlândia', '1995-08-23',
     '', 0, '', 'Uberlândia', 'MG', ''),
    ('Eduardo Monteiro', 'eduardo.monteiro@gmail.com', 'Sorocaba', '1985-12-14',
     '', 0, '', 'Sorocaba', 'SP', ''),
    ('Carolina Batista', 'carolina.batista@gmail.com', 'São Bernardo do Campo', '2000-06-02',
     '', 0, '', 'São Bernardo do Campo', 'SP', ''),
    ('Vinícius Duarte', 'vinicius.duarte@gmail.com', 'Santo André', '1996-10-17',
     '', 0, '', 'Santo André', 'SP', ''),
    ('Fernanda Castro', 'fernanda.castro@gmail.com', 'Osasco', '1991-03-29',
     '', 0, '', 'Osasco', 'SP', ''),
    ('Gustavo Pinto', 'gustavo.pinto@gmail.com', 'Jundiaí', '1994-07-06',
     '', 0, '', 'Jundiaí', 'SP', ''),
    ('Renata Freitas', 'renata.freitas@gmail.com', 'Piracicaba', '1998-11-21',
     '', 0, '', 'Piracicaba', 'SP', ''),
    ('Leonardo Ramos', 'leonardo.ramos@gmail.com', 'Taubaté', '1989-02-13',
     '', 0, '', 'Taubaté', 'SP', ''),
    ('Sofia Mendes', 'sofia.mendes@gmail.com', 'Jacareí', '2002-09-28',
     '', 0, '', 'Jacareí', 'SP', '');

INSERT INTO reservas (id_user, id_destino, data, status)
VALUES
    (1, 1, '2026-09-01', 'confirmado'),
    (2, 2, '2026-10-01', 'confirmado'),
    (3, 3, '2026-11-01', 'confirmado');
