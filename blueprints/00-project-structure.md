# Project Structure Blueprint

## Repository Layout

```
.
├── .cursorrules              # Agent instructions
├── Makefile                  # Build commands
├── README.md                 # Human overview
├── project.yml               # XcodeGen configuration
├── Sources/                  # Swift source code
│   ├── App/                  # App entry point
│   │   └── BrieflyApp.swift  # @main App struct
│   └── Features/             # Feature modules
│       └── ContentView.swift # Main UI view
├── blueprints/               # Source of truth (this directory)
│   ├── 00-project-structure.md
│   ├── 01-xcodegen-setup.md
│   ├── 02-build-and-run.md
│   └── 99-maintenance.md
└── docs/                     # Human-readable guides
    ├── SETUP.md
    └── IMPLEMENTATION.md
```

## Directory Roles

- **`/blueprints`**: Canonical source of truth for all project configuration, structure, and implementation details
- **`/docs`**: Human-readable guides derived from blueprints, written in plain English
- **`/Sources`**: Swift source code organized by feature modules
- **Root files**: Build configuration and project metadata

## Core Invariant

> **NEVER HAND-EDIT .xcodeproj**

The `.xcodeproj` file is **always** generated from `project.yml` via XcodeGen.

## Project Structure Invariants

> **YELLOW BOX - CRITICAL RULES**
> 
> - ❌ **NO** folder references (blue folders in Xcode)
> - ❌ **NO** paths pointing to "."
> - ❌ **NO** references into *.xcodeproj
> - ✅ **ONLY** `project.yml` controls the project file
> - ✅ **ONLY** groups (yellow) via XcodeGen
> - ✅ **ONLY** explicit directory paths in sources

## File Responsibilities

- **`project.yml`**: Single source of truth for Xcode project configuration
- **`Makefile`**: Build automation and common commands
- **`.cursorrules`**: Agent behavior and update requirements
- **`README.md`**: Project overview and quick start
