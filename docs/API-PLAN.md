# RaceDay API Endpoint Plan

## Purpose

The API is planned to allow the RaceDay system to manage users, events, categories, enrolments and results.

## Authentication

The API includes registration and login endpoints. Authentication is used to control access to features based on the user's role.

## Organiser Endpoints

Organisers can:

- Create, update and delete events.
- Create, update and delete event categories.
- View event enrolments.
- Capture participant results.
- View event results.

## Participant Endpoints

Participants can:

- Register and log in.
- View and update their profile.
- Browse available events.
- Enrol in an event category.
- View their own enrolments.
- View their results.

## Public Event Endpoints

Users can browse available events and view individual event details without needing organiser permissions.

## Error Handling

The API plan includes appropriate HTTP response codes for successful requests and common failures, including:

- `200` – Successful request
- `201` – Resource created
- `204` – Resource deleted successfully
- `400` – Invalid request
- `401` – Authentication required or failed
- `403` – User does not have permission
- `404` – Resource not found
- `409` – Conflict, such as an existing registration

## Role-Based Access

Endpoints requiring organiser or participant access specify the required role. This prevents users from accessing functions that do not belong to their role.