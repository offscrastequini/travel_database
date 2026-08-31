# Travel Database

A relational database developed with **MySQL** for managing users, travel destinations, and reservations.

This project was created as a practical exercise to develop and demonstrate knowledge of **SQL, relational database modeling, data manipulation, constraints, relationships, JOINs, subqueries, indexes, and query optimization**.

## Overview

The system is organized around three main entities:

* **Users (`users`)** — stores user information, birth date, and address data.
* **Destinations (`destinos`)** — stores available travel destinations and their descriptions.
* **Reservations (`reservas`)** — connects users to destinations and manages reservation dates and statuses.

The database uses **primary keys, foreign keys, unique constraints, and cascading actions** to maintain data integrity.

## Database Architecture

```text
┌──────────────────────┐
│        users         │
├──────────────────────┤
│ PK id               │
│ nome                │
│ email               │
│ endereco            │
│ data_nascimento     │
│ rua                 │
│ numero              │
│ bairro              │
│ cidade              │
│ estado              │
│ cep                 │
└──────────┬───────────┘
           │
           │ 1:N
           │
           ▼
┌──────────────────────┐
│      reservas        │
├──────────────────────┤
│ PK id               │
│ FK id_user          │
│ FK id_destino       │
│ data                │
│ status              │
└──────────┬───────────┘
           │
           │ N:1
           │
           ▼
┌──────────────────────┐
│      destinos        │
├──────────────────────┤
│ PK id               │
│ nome                │
│ descricao           │
└──────────────────────┘
```

## Relationships

* A user can have multiple reservations.
* A destination can have multiple reservations.
* Each reservation belongs to one user.
* Each reservation belongs to one destination.
* Foreign keys maintain referential integrity between the tables.
* `ON DELETE CASCADE` and `ON UPDATE CASCADE` are used on reservation relationships.

## Features

* User registration
* Destination registration
* Travel reservation management
* Reservation status management
* User address management
* Data filtering with `WHERE`
* Data modification with `UPDATE`
* Schema modification with `ALTER TABLE`
* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`
* Simulated `FULL JOIN` using `UNION`
* Subqueries with `IN` and `NOT IN`
* Correlated subqueries
* Aggregate functions such as `COUNT()` and `MAX()`
* Data grouping with `GROUP BY`
* Result ordering with `ORDER BY`
* Database indexes
* Query execution analysis with `EXPLAIN`
* Stored functions (`fn_*`)
* Stored procedures (`sp_*`)
* Views (`vw_*`)

## Database Constraints

The project uses several SQL constraints to maintain data consistency:

| Constraint    | Purpose                                           |
| ------------- | ------------------------------------------------- |
| `PRIMARY KEY` | Uniquely identifies each record                   |
| `FOREIGN KEY` | Establishes relationships between tables          |
| `UNIQUE`      | Prevents duplicate values                         |
| `NOT NULL`    | Requires a value to be provided                   |
| `DEFAULT`     | Defines a default value                           |
| `ENUM`        | Restricts reservation status to predefined values |

The reservation status is controlled by the following values:

```text
pendente
confirmado
cancelado
```

## SQL Concepts Practiced

The project covers the following SQL concepts:

```sql
CREATE DATABASE
USE
CREATE TABLE
PRIMARY KEY
FOREIGN KEY
UNIQUE
NOT NULL
DEFAULT
ENUM
INSERT
SELECT
WHERE
UPDATE
ALTER TABLE
CREATE INDEX
EXPLAIN
CREATE FUNCTION
CREATE PROCEDURE
CREATE VIEW
```

It also demonstrates relational database concepts such as:

* Entity modeling
* One-to-many relationships
* Referential integrity
* Data manipulation
* Schema modification
* Aggregation
* Filtering
* Sorting
* Grouping
* Table joins
* Subqueries
* Query optimization
* Indexing

## JOIN Operations

The project includes practical examples of different JOIN operations.

### INNER JOIN

Used to retrieve users together with their reservations and destinations.

```sql
SELECT
    US.id AS user_id,
    US.nome AS user_name,
    US.email,
    DS.nome AS destination,
    RS.data AS reservation_date,
    RS.status
FROM users AS US
INNER JOIN reservas AS RS
    ON US.id = RS.id_user
INNER JOIN destinos AS DS
    ON RS.id_destino = DS.id;
```

### LEFT JOIN

Used to retrieve users while preserving users even when they do not have reservations.

```sql
SELECT *
FROM users AS US
LEFT JOIN reservas AS RS
    ON US.id = RS.id_user
LEFT JOIN destinos AS DS
    ON RS.id_destino = DS.id;
```

### RIGHT JOIN

Used to preserve all destinations while associating available reservations.

```sql
SELECT *
FROM reservas AS RS
RIGHT JOIN destinos AS DS
    ON RS.id_destino = DS.id;
```

### FULL JOIN Simulation

MySQL does not provide a native `FULL OUTER JOIN`, so the project demonstrates a simulation using `UNION` with `LEFT JOIN` and `RIGHT JOIN`.

## Subqueries

The database also contains examples of subqueries using `IN` and `NOT IN`.

Example:

```sql
SELECT *
FROM users
WHERE id IN (
    SELECT id_user
    FROM reservas
);
```

Correlated subqueries are also used to calculate the number of reservations associated with each user:

```sql
SELECT
    nome,
    (
        SELECT COUNT(*)
        FROM reservas
        WHERE id_user = users.id
    ) AS total_reservas
FROM users;
```

## Aggregation

The project uses aggregate functions to analyze the stored data.

Example:

```sql
SELECT
    COUNT(*) AS qtd_reservas,
    id_destino
FROM reservas
GROUP BY id_destino
ORDER BY qtd_reservas DESC, id_destino ASC;
```

The project also calculates the highest age among registered users:

```sql
SELECT
    MAX(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) AS maior_idade
FROM users;
```

## Indexes and Query Optimization

Indexes were created to improve queries involving frequently accessed columns in the `reservas` table:

Foreign keys on `reservas` already create indexes on `id_user` and `id_destino`. Extra indexes cover filters on status, date, and user name:

```sql
CREATE INDEX idx_reservas_status
ON reservas(status);

CREATE INDEX idx_reservas_data
ON reservas(data);

CREATE INDEX idx_users_nome
ON users(nome);
```

An additional index is created for user name searches:

```sql
CREATE INDEX idx_users_nome
ON users(nome);
```

The `EXPLAIN` statement is used to analyze how MySQL executes queries and to compare query execution before and after creating indexes.

Example:

```sql
EXPLAIN
SELECT *
FROM users
WHERE nome = 'Vinícius Duarte';
```

The `email` column is already declared as `UNIQUE`, meaning MySQL creates a unique index for it automatically.

## Routines

Reusable database logic lives in stored functions, procedures, and views.

| Object | Purpose |
| ------ | ------- |
| `fn_calcular_idade` | Age in years from date of birth |
| `fn_contar_reservas_usuario` | Reservation count for a user |
| `fn_contar_reservas_destino` | Reservation count for a destination |
| `sp_inserir_usuario` | Insert a user |
| `sp_inserir_destino` | Insert a destination |
| `sp_inserir_reserva` | Insert a reservation |
| `sp_atualizar_status_reserva` | Change reservation status |
| `sp_listar_reservas_usuario` | List a user's reservations |
| `sp_listar_reservas_pendentes` | List pending reservations |
| `sp_relatorio_reservas` | Totals, unused destinations/users, max age |
| `vw_reservas_detalhadas` | Users, reservations, and destinations |
| `vw_reservas_por_destino` | Reservation count per destination |

Example:

```sql
SELECT nome, fn_calcular_idade(data_nascimento) AS idade
FROM users;

CALL sp_listar_reservas_usuario(1);

SELECT * FROM vw_reservas_detalhadas;
```

## Project Structure

```text
travel-database/
│
├── README.md
├── travel_database.sql          # entry point (SOURCE sql/install.sql)
├── .gitignore
│
└── sql/
    ├── install.sql              # install order
    ├── 00_database.sql
    ├── tables/
    │   ├── 01_users.sql
    │   ├── 02_destinos.sql
    │   └── 03_reservas.sql
    ├── indexes/
    │   └── 01_indexes.sql
    ├── functions/
    │   ├── fn_calcular_idade.sql
    │   ├── fn_contar_reservas_usuario.sql
    │   └── fn_contar_reservas_destino.sql
    ├── procedures/
    │   ├── sp_inserir_usuario.sql
    │   ├── sp_inserir_destino.sql
    │   ├── sp_inserir_reserva.sql
    │   ├── sp_atualizar_status_reserva.sql
    │   ├── sp_listar_reservas_usuario.sql
    │   ├── sp_listar_reservas_pendentes.sql
    │   └── sp_relatorio_reservas.sql
    ├── views/
    │   ├── vw_reservas_detalhadas.sql
    │   └── vw_reservas_por_destino.sql
    ├── data/
    │   └── 01_seed.sql
    └── queries/
        └── consultas_estudo.sql
```

## Technologies

* **MySQL** — relational database management system
* **SQL** — database query and manipulation language
* **Git** — version control
* **GitHub** — source code hosting

## Getting Started

### Prerequisites

Before running the project, make sure you have:

* MySQL Server installed
* MySQL Workbench or another MySQL client
* Git installed (optional, for cloning the repository)

### Installation

Clone the repository:

```bash
git clone https://github.com/your-username/travel-database.git
```

Navigate to the project directory:

```bash
cd travel-database
```

From the project root, in the MySQL client:

```sql
SOURCE sql/install.sql;
```

In MySQL Workbench, run the files under `sql/` in this order: database → tables → indexes → functions → procedures → views → seed.

The installer will:

1. Create the `viagens` database (`utf8mb4`).
2. Create the `users`, `destinos`, and `reservas` tables.
3. Define primary keys, foreign keys, and constraints.
4. Create secondary indexes.
5. Create stored functions and procedures.
6. Create views.
7. Insert sample users, destinations, and reservations.

Study queries (JOINs, subqueries, `EXPLAIN`) are in `sql/queries/consultas_estudo.sql` and are not part of the installer.

## Example Queries

### Retrieve Pending Reservations

```sql
SELECT *
FROM reservas
WHERE status = 'pendente';
```

### Retrieve Users Born After a Specific Date

```sql
SELECT *
FROM users
WHERE data_nascimento > '1990-01-01';
```

### Retrieve Reservations with User and Destination

```sql
SELECT
    US.nome AS usuario,
    US.email,
    DS.nome AS destino,
    RS.data AS data_reserva,
    RS.status
FROM users AS US
INNER JOIN reservas AS RS
    ON US.id = RS.id_user
INNER JOIN destinos AS DS
    ON RS.id_destino = DS.id
ORDER BY RS.data;
```

### Retrieve a Specific User's Reservations

```sql
SELECT
    US.id AS user_id,
    US.nome AS user_name,
    US.email,
    DS.nome AS destination,
    RS.data AS reservation_date,
    RS.status
FROM users AS US
INNER JOIN reservas AS RS
    ON US.id = RS.id_user
INNER JOIN destinos AS DS
    ON RS.id_destino = DS.id
WHERE US.id = 1;
```

## Sample Data

The database contains sample records representing:

* Users from different Brazilian cities
* Travel destinations such as São Paulo, Rio de Janeiro, and Munique
* Reservations connecting users to destinations
* Different reservation statuses
* Additional user address information

The seed script also includes **30 additional users** to provide a larger dataset for testing queries, indexes, and execution plans.

## Future Improvements

Possible improvements for future versions include:

* Developing a complete CRUD API
* Connecting the database to a **Golang backend**
* Creating a REST API
* Adding authentication and authorization
* Containerizing the database with **Docker**
* Implementing database migrations
* Adding more advanced SQL queries
* Improving database normalization
* Creating automated tests
* Implementing pagination and filtering
* Creating a web interface for reservation management
* Adding CI/CD with GitHub Actions
* Integrating the project into a DevOps workflow

## Learning Objectives

The main objective of this project is to build a solid foundation in **relational databases and SQL** while applying concepts commonly used in real-world software development.

Through this project, the following skills are practiced:

* Relational database design
* SQL syntax and data manipulation
* Primary and foreign keys
* Referential integrity
* Constraints
* JOIN operations
* Subqueries
* Aggregate functions
* Indexing
* Query optimization
* Git version control

The project also serves as a foundation for future integration with **Golang, REST APIs, Docker, CI/CD, and DevOps workflows**.

## Author

**Samuel Crastequini**

Computer Engineering Student
****
