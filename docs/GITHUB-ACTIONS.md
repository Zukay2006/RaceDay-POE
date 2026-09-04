# GitHub Actions

## Purpose

GitHub Actions is used in the RaceDay repository to automatically validate the required Part 1 files whenever changes are pushed to the main branch.

## Validation

The workflow checks that the following files are present:

- `docs/ERD.png`
- `docs/PROG.pdf`
- `docs/SQLQuery1.sql`

## Workflow

The workflow is stored in:

`.github/workflows/validate.yml`

It runs automatically after changes are pushed to the repository.

## Successful Build

The validation workflow was successfully executed and produced a green check, confirming that the required Part 1 files are available in the repository.