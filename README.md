# Briefly iOS App

A corruption-resistant SwiftUI iOS app built with XcodeGen for deterministic project generation.

## What are Blueprints?

**Blueprints** (`/blueprints`) are the **source of truth** for:
- Project structure and build configuration
- Implementation details and workflows
- Commands and maintenance procedures

They're designed for agents and engineers to maintain consistency.

## What are Docs?

**Docs** (`/docs`) are human-readable quick guides derived from blueprints:
- Simple setup instructions
- Implementation guidance
- Plain English explanations

## Quick Start

```bash
# Install XcodeGen (if not installed)
brew install xcodegen

# Generate and open project
make gen
make open
```

## Why This Can't Corrupt

- **No hand-edited .xcodeproj**: Always generated via XcodeGen
- **No folder references**: Only groups (yellow), never blue folders
- **No relative paths**: No "." or *.xcodeproj references
- **Single source of truth**: `project.yml` controls everything

## Commands

- `make gen` - Generate Xcode project
- `make open` - Generate and open in Xcode
- `make build` - Build for iPhone 16 simulator
- `make run` - Show run instructions
