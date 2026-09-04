# ERD Design Decisions

## Purpose

The Entity Relationship Diagram (ERD) was designed to show how the RaceDay system stores and connects information.

## Main Design Decisions

The system separates organisers and participants because they have different roles and responsibilities.

An organiser is linked to events because an organiser can manage multiple events.

Each event can have multiple routes and multiple categories. This allows an event to offer different routes and participation categories.

Participants enter events through an enrolment record. The enrolment connects a participant to a selected category.

Results are linked to enrolments so that a participant's result can be associated with the specific category they entered.

## Primary Keys

Each entity has a unique primary key used to identify its records.

## Foreign Keys

Foreign keys are used to connect related entities and maintain referential integrity.

## Relationship Summary

- Organiser → Event: One-to-Many
- Event → Route: One-to-Many
- Event → Category: One-to-Many
- Participant → Enrolment: One-to-Many
- Category → Enrolment: One-to-Many
- Enrolment → Result: One-to-One

The ERD relationships match the structure implemented in the SQL database script.