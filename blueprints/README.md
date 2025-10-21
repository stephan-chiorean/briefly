# Blueprints

**Source of truth** for this iOS project's technical implementation.

## What Are Blueprints?

Blueprints are **technical documentation** that serve as the authoritative reference for:
- Project structure and build configuration
- Implementation details and workflows  
- Commands and maintenance procedures
- XcodeGen setup and usage

## Files in This Directory

- **`00-project-structure.md`** - Project layout, invariants, and structure rules
- **`01-xcodegen-setup.md`** - XcodeGen installation and basic usage
- **`02-build-and-run.md`** - Build instructions and troubleshooting
- **`99-maintenance.md`** - Maintenance procedures and update requirements

## Who Uses Blueprints?

- **AI Agents** - For understanding project structure and making changes
- **Engineers** - For maintaining consistency and following best practices
- **New Contributors** - For understanding the project's technical approach

## Key Principles

- **Source of Truth**: Blueprints are the authoritative reference
- **Always Updated**: Must be updated when changing `project.yml`, `Sources/`, or `Makefile`
- **Technical Focus**: Detailed, implementation-specific information
- **Agent-Friendly**: Designed for both human and AI consumption

## Relationship to Other Docs

- **Blueprints** → **Docs** (`/docs`): Human-readable versions derived from blueprints
- **Blueprints** → **Kits** (`/kits`): Templates that recreate this project structure

## Maintenance Rule

When changing **any** of these files:
- `project.yml`
- `Makefile` 
- Files under `Sources/`

**MUST** update:
1. Relevant blueprint(s) under `/blueprints`
2. Derived human docs under `/docs` to mirror changes in plain English
