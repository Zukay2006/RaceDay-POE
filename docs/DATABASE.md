# RaceDay Database

## Purpose

The RaceDay database stores information needed to manage road events, organisers, participants, event routes, categories, enrolments and results.

## Main Tables

- **Organiser** – stores organiser account information.
- **Participant** – stores participant account information.
- **Event** – stores event details and links each event to an organiser.
- **Route** – stores the routes belonging to an event.
- **Category** – stores the categories available for an event.
- **Enrolment** – records participants entering event categories.
- **Result** – stores the results linked to an enrolment.

## Relationships

- One Organiser can manage many Events.
- One Event can have many Routes.
- One Event can have many Categories.
- One Category can have many Enrolments.
- One Participant can have many Enrolments.
- Each Enrolment has one Result.

## Database Constraints

The SQL script uses primary keys and foreign keys to maintain relationships between tables. It also uses required fields, unique constraints and default values where appropriate.

## Sample Data

The SQL script includes realistic sample data for organisers, participants, events, routes, categories, enrolments and results.