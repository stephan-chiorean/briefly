# Kits

**Copy-paste templates** for creating new iOS projects with this exact structure.

## What Are Kits?

Kits are **self-contained templates** that can be injected into any Cursor context to recreate this project's structure. Each kit contains:
- Complete file contents with token replacement
- Step-by-step application instructions
- Minimal user input requirements
- Compile-ready code

## Available Kits

### K01-basic-app.md
**Complete XcodeGen + Blueprints + Docs backbone**
- **What you specify**: Just your app name
- **What you get**: Full project structure, XcodeGen setup, blueprints, docs
- **Use case**: Starting any new iOS project with this architecture

### K02-ui-tabs.md  
**SwiftUI tab navigation system**
- **What you specify**: 4 tab names + 4 SF Symbol icons
- **What you get**: Customizable tab navigation with your chosen names/icons
- **Use case**: Adding navigation to any iOS app

## How to Use Kits

1. **Copy** the kit content into your new project's Cursor chat
2. **Specify** the required information (app name, tab names, etc.)
3. **Let Cursor** create all the files with token replacement
4. **Run** `make gen && make open` to build and open in Xcode

## Kit Design Principles

- **Self-contained**: Everything needed is in the kit file
- **Minimal input**: Only ask for essential customization
- **Token-based**: Easy replacement of placeholders
- **Compile-ready**: All code works immediately after token replacement
- **XcodeGen-only**: No blue folders, only groups via XcodeGen

## Maintenance

When updating this project's structure:
1. Update the relevant kit(s) in `/kits`
2. Ensure kits remain self-contained and functional
3. Test kits by applying them to a fresh project

## Relationship to Other Docs

- **Kits** ← **Blueprints** (`/blueprints`): Kits are derived from blueprints
- **Kits** → **New Projects**: Kits recreate this project structure elsewhere
- **Kits** → **Docs** (`/docs`): Kits include their own documentation
