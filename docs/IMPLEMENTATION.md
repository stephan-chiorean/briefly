# Implementation Guide

## App Structure

### Entry Point
- **File**: `Sources/App/BrieflyApp.swift`
- **Purpose**: SwiftUI app lifecycle and main window

### Main View
- **File**: `Sources/Features/ContentView.swift`
- **Purpose**: Main UI content and user interface

## Adding New Features

### New Screens
1. Create new Swift file in `Sources/Features/`
2. Follow SwiftUI View protocol
3. No project configuration needed (auto-discovered)

### New Directories
1. Create directory under `Sources/`
2. Add to `sources:` list in `project.yml`
3. Run `make gen` to regenerate project

### New Dependencies
1. Add to `project.yml` under target configuration
2. Run `make gen` to regenerate project
3. Update documentation

## Keeping Docs in Sync

When making changes:
1. Update relevant blueprint in `/blueprints`
2. Update corresponding doc in `/docs`
3. Keep commands and instructions accurate

## Project Invariants

**Never do these:**
- Hand-edit `.xcodeproj` file
- Use folder references (blue folders)
- Add paths pointing to "." or into project files
- Skip regenerating project after changes

**Always do these:**
- Use `make gen` after `project.yml` changes
- Use groups (yellow) only
- Keep `project.yml` as single source of truth
- Update both blueprints and docs

## Development Workflow

1. Edit Swift files in `Sources/`
2. If adding directories, update `project.yml`
3. Run `make gen` to regenerate project
4. Open with `make open`
5. Build and run as normal
