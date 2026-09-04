# RaceDay Part 1 Setup

## Requirements

- SQL Server
- SQL Server Management Studio (SSMS)
- GitHub account

## Database Setup

1. Open SQL Server Management Studio.
2. Open `SQLQuery1.sql` from the `docs` folder.
3. Connect to a SQL Server instance.
4. Run the complete SQL script.
5. The script creates the `RaceDay` database and all required tables, relationships, constraints and sample data.

## Part 1 Documents

The `docs` folder contains:

- `ERD.png` – Entity Relationship Diagram
- `PROG.pdf` – Planning and API Endpoint Plan
- `SQLQuery1.sql` – SQL database script
- `CI-CD-SUCCESS.png` – Successful GitHub Actions build screenshot

## GitHub Actions

The repository uses GitHub Actions to validate that the required Part 1 documents are present in the `docs` folder.