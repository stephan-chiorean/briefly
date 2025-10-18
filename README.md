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

## What are Kits?

**Kits** (`/kits`) are copy-paste templates for creating new projects:
- **K01-basic-app.md**: Complete XcodeGen + Blueprints + Docs backbone (just specify app name)
- **K02-ui-tabs.md**: SwiftUI tab navigation (specify 4 tab names + SF Symbol icons)
- Self-contained with exact file contents and token replacement
- Designed to be injected into any Cursor context to recreate this project structure

## Quick Start

```bash
# Install XcodeGen (if not installed)
brew install xcodegen

# Generate and open project
make gen
make open
```

## Using Kits

To create a new project with this structure:

1. **Copy K01-basic-app.md** into your new project's Cursor chat
2. Tell Cursor your app name
3. **Copy K02-ui-tabs.md** into the same Cursor chat  
4. Tell Cursor your 4 tab names and SF Symbol icons
5. Run `make gen && make open`

The kits contain all necessary files with token replacement for easy customization.

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
