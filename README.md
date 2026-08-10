# Travel Database

A relational database developed with **MySQL** for managing users, travel destinations, and reservations.

This project was created as a practical exercise to develop and demonstrate knowledge of **SQL, relational database modeling, data manipulation, constraints, and Git version control**.

## Overview

The system is designed around three main entities:

* **Users** — stores user and address information.
* **Destinations** — stores available travel destinations.
* **Reservations** — connects users to destinations and manages reservation information.

The database uses primary and foreign keys to maintain data integrity and establish relationships between entities.

## Database Architecture

```text
┌──────────────┐
│    users     │
├──────────────┤
│ PK id        │
│ name         │
│ email        │
│ address      │
│ birth_date   │
└──────┬───────┘
       │
       │ 1:N
       │
       ▼
┌──────────────────┐
│   reservations   │
├──────────────────┤
│ PK id            │
│ FK user_id       │
│ FK destination_id│
│ date             │
│ status           │
└────────┬─────────┘
         │
         │ N:1
         │
         ▼
┌──────────────────┐
│   destinations   │
├──────────────────┤
│ PK id            │
│ name             │
│ description      │
└──────────────────┘
```

### Relationships

* A user can have multiple reservations.
* A destination can have multiple reservations.
* Each reservation belongs to one user.
* Each reservation belongs to one destination.

## Features

* User registration
* Destination registration
* Travel reservation management
* Reservation status management
* User address management
* Data filtering and querying
* Referential integrity between tables
* Unique email and destination constraints

## Database Constraints

The project uses several SQL constraints to maintain data consistency:

| Constraint    | Purpose                                  |
| ------------- | ---------------------------------------- |
| `PRIMARY KEY` | Uniquely identifies each record          |
| `FOREIGN KEY` | Establishes relationships between tables |
| `UNIQUE`      | Prevents duplicate values                |
| `NOT NULL`    | Requires a value to be provided          |
| `DEFAULT`     | Defines a default value                  |

## SQL Concepts Practiced

This project covers the following SQL concepts:

```sql
CREATE DATABASE
CREATE TABLE
PRIMARY KEY
FOREIGN KEY
UNIQUE
NOT NULL
DEFAULT
INSERT
SELECT
WHERE
UPDATE
ALTER TABLE
```

It also demonstrates fundamental relational database concepts such as:

* Entity modeling
* Table relationships
* Referential integrity
* Data manipulation
* Schema modification
* Basic database normalization concepts

## Project Structure

```text
travel-database/
│
├── README.md
├── travel_database.sql
│
├── docs/
│   └── relational-model.png
│
└── .gitignore
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

Navigate to the project:

```bash
cd travel-database
```

Open the SQL file:

```text
travel_database.sql
```

Execute the script in MySQL Workbench or your preferred MySQL client.

The script will:

1. Create the `travel` database.
2. Create the required tables.
3. Define primary and foreign keys.
4. Insert sample data.
5. Execute example queries.
6. Update existing records.
7. Add additional user address fields.

## Example Query

Retrieve all pending reservations:

```sql
SELECT *
FROM reservations
WHERE status = 'pending';
```

Retrieve users born after a specific date:

```sql
SELECT *
FROM users
WHERE birth_date > '1990-01-01';
```

## Future Improvements

Possible improvements for future versions include:

* Implementing a complete CRUD API
* Connecting the database to a Go backend
* Adding authentication and authorization
* Using Docker for database deployment
* Adding database migrations
* Implementing advanced SQL queries and JOINs
* Adding indexes for query optimization
* Adding automated tests
* Creating a web interface for reservation management

## Learning Objectives

The main objective of this project is to build a solid foundation in relational databases and SQL while applying concepts used in real-world software development.

The project will also serve as a foundation for future integration with backend technologies such as **Golang, REST APIs, Docker, and DevOps workflows**.

## Author

**Samuel Crastequini**

Computer Engineering Student


