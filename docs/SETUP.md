# Setup Guide

## Prerequisites

- Xcode 26.x (or latest)
- Homebrew (for XcodeGen)

## Install XcodeGen

```bash
brew install xcodegen
```

## Generate Project

```bash
# Generate Xcode project
make gen

# Generate and open in Xcode
make open
```

## Why This Project Can't Corrupt

This project is designed to be corruption-resistant:

- **No hand-edited project files**: The `.xcodeproj` is always generated from `project.yml`
- **No folder references**: Only uses groups (yellow), never blue folders
- **No relative paths**: No "." or project file references
- **Single source of truth**: `project.yml` controls everything

## First Run

1. Run `make gen` to create the Xcode project
2. Run `make open` to open in Xcode
3. Select iPhone 16 simulator
4. Press Cmd+R to run the app

## Troubleshooting

- **XcodeGen not found**: Install with `brew install xcodegen`
- **Project won't open**: Run `make gen` first
- **Stale structure**: Close Xcode, run `make gen`, then `make open`
