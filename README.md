# RaceDay-POE

## System Description

RaceDay is an event management system designed to manage road-running and cycling events. The system allows organisers to create and manage events, categories, participants and results, while participants can register, browse events, enrol in categories and view their results.

## User Roles

### Organiser
The Organiser can:
- Create, edit and delete events
- Manage event categories
- View participant enrolments
- Capture participant results
- View event results

### Participant
The Participant can:
- Create an account
- Browse available events
- Enter events by selecting a category
- View their enrolments
- View their results

## Part 1 Planning Documents

The `/docs` folder contains the planning and database documents for Part 1:

- ERD – Entity Relationship Diagram
- API Endpoint Plan
- SQL Database Script

## CI/CD Validation

GitHub Actions is used to validate that the required Part 1 planning documents are present in the repository.

### Successful CI/CD Build

![alt text](<Screenshot 2026-09-04 230514.png>)

## Video Presentation

Part 1 video presentation:

[Watch the Part 1 YouTube Presentation] https://youtu.be/a4rSdTs9LLk?si=wiRU1niv1Y9VKwgl

## Setup Instructions

1. Clone or download the repository from GitHub.
2. Open the `/docs` folder to access the Part 1 planning documents.
3. Open `SQLQuery1.sql` in SQL Server Management Studio (SSMS).
4. Run the SQL script on a fresh SQL Server instance.
5. The script creates the RaceDay database, tables, relationships, constraints and sample data.

## Repository Structure

```text
RaceDay-POE/
├── .github/
│   └── workflows/
│       └── validate.yml
├── docs/
│   ├── ERD.png
│   ├── PROG.pdf
│   └── SQLQuery1.sql
└── README.md# RaceDay-POE
RaceDay System – Programming POE
