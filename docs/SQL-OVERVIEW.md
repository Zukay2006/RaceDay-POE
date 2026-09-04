# RaceDay SQL Overview

## Database

The RaceDay SQL script creates a SQL Server database named `RaceDay`.

## Tables

The database contains seven main tables:

1. Organiser
2. Participant
3. Event
4. Route
5. Category
6. Enrolment
7. Result

## Keys and Relationships

Primary keys uniquely identify records in each table. Foreign keys connect related tables and enforce the relationships shown in the ERD.

## Data Integrity

The database uses constraints such as:

- Primary keys
- Foreign keys
- NOT NULL constraints
- UNIQUE constraints
- DEFAULT values

These constraints help keep the stored data accurate and consistent.

## Seed Data

The SQL script includes sample data across all seven tables. This allows the database structure and relationships to be tested after creation.

## Execution

The script is designed to create the database from a fresh SQL Server instance and can be executed using SQL Server Management Studio (SSMS).