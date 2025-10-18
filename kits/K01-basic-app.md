# K01 – Basic App (XcodeGen + Blueprints + Docs)

## What You Need to Specify
- **App Name**: Just tell me the name of your app (e.g., "MyApp", "Briefly", "TodoApp")

## Purpose
Clean deterministic base app; source-of-truth via XcodeGen; living docs.

## Assumptions
- macOS + Xcode installed
- `brew install xcodegen` if needed

## Apply Steps
1. Tell me your app name
2. I'll create all files from the "Files to create" section below
3. Run: `brew install xcodegen` (if needed), then `make gen && make open`

## Token Replacement
- `__APP_NAME__` = Your app name (e.g., "MyApp")
- `__APP_NAME_LOWER__` = Your app name in lowercase (e.g., "myapp")

## Files to create (exact contents)

### Makefile
```makefile
.PHONY: gen open clean

gen:
	xcodegen generate

open: gen
	open __APP_NAME__.xcodeproj

clean:
	rm -rf __APP_NAME__.xcodeproj
	rm -rf DerivedData
```

### project.yml
```yaml
name: __APP_NAME__
options:
  bundleIdPrefix: com.yourcompany.__APP_NAME_LOWER__
  deploymentTarget:
    iOS: "17.0"
  developmentLanguage: en
  xcodeVersion: "15.0"
targets:
  __APP_NAME__:
    type: application
    platform: iOS
    deploymentTarget: "17.0"
    sources:
      - Sources/App
      - Sources/Features
    settings:
      PRODUCT_BUNDLE_IDENTIFIER: com.yourcompany.__APP_NAME_LOWER__
      SWIFT_VERSION: 5.10
      CODE_SIGN_STYLE: Manual
      DEVELOPMENT_TEAM: ""
      ENABLE_USER_SCRIPT_SANDBOXING: YES
      DEAD_CODE_STRIPPING: YES
      TARGETED_DEVICE_FAMILY: "1,2"
      IPHONEOS_DEPLOYMENT_TARGET: "17.0"
    info:
      path: Info.plist
```

### Sources/App/__APP_NAME__App.swift
```swift
import SwiftUI

@main
struct __APP_NAME__App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Sources/Features/ContentView.swift
```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome to __APP_NAME__")
                .font(.title)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

### blueprints/00-project-structure.md
```markdown
# Project Structure

## Layout
```
__APP_NAME__/
├── Sources/
│   ├── App/
│   │   └── __APP_NAME__App.swift
│   └── Features/
│       └── ContentView.swift
├── blueprints/
│   ├── 00-project-structure.md
│   ├── 01-xcodegen-setup.md
│   ├── 02-build-and-run.md
│   └── 99-maintenance.md
├── docs/
│   ├── SETUP.md
│   └── IMPLEMENTATION.md
├── project.yml
├── Makefile
└── Info.plist
```

## Invariants
- **NO** blue folders (Xcode folder references)
- **ONLY** groups (yellow) via XcodeGen
- **NO** paths pointing to "." or traversing into *.xcodeproj
- **ONLY** `project.yml` controls the project file
```

### blueprints/01-xcodegen-setup.md
```markdown
# XcodeGen Setup

## Install XcodeGen
```bash
brew install xcodegen
```

## Generate Project
```bash
make gen
```

## Open in Xcode
```bash
make open
```

## Adding Folders
1. Add folder to `project.yml` under `sources:`
2. Run `make gen`
3. Run `make open`
```

### blueprints/02-build-and-run.md
```markdown
# Build and Run

## Build
- Xcode: Cmd+B
- Terminal: `xcodebuild -project __APP_NAME__.xcodeproj -scheme __APP_NAME__ build`

## Run
- Xcode: Cmd+R
- Terminal: `xcodebuild -project __APP_NAME__.xcodeproj -scheme __APP_NAME__ -destination 'platform=iOS Simulator,name=iPhone 15' build`

## Troubleshooting
- **Stale project**: Run `make gen` to regenerate
- **Build errors**: Clean build folder (Cmd+Shift+K) then rebuild
- **Missing files**: Check `project.yml` sources list
```

### blueprints/99-maintenance.md
```markdown
# Maintenance

## After Changes
When changing **any** of these files:
- `project.yml`
- `Makefile`
- Files under `Sources/`

**MUST** update:
1. Relevant blueprint(s) under `/blueprints`
2. Derived human docs under `/docs` to mirror changes in plain English

## Regenerate Project
```bash
make gen
```

## Keep Docs in Sync
- Blueprints = source of truth
- Docs = human-readable version
- Update both when making changes
```

### docs/SETUP.md
```markdown
# Setup

## Quick Start
1. Install XcodeGen: `brew install xcodegen`
2. Generate project: `make gen`
3. Open in Xcode: `make open`

## Project Structure
- `Sources/App/` - App entry point
- `Sources/Features/` - SwiftUI views
- `project.yml` - XcodeGen configuration
- `blueprints/` - Technical documentation
- `docs/` - Human documentation

## Build & Run
- Build: Cmd+B in Xcode
- Run: Cmd+R in Xcode
```

### docs/IMPLEMENTATION.md
```markdown
# Implementation

## Entry Point
- `Sources/App/__APP_NAME__App.swift` - Main app file

## Adding Features
- Create new SwiftUI views in `Sources/Features/`
- Add to `project.yml` sources if needed
- Run `make gen` after changes

## Invariants
- XcodeGen-only project management
- No blue folders, only groups
- No hand-editing .xcodeproj
- Source of truth: `project.yml`
```

## Cursor Nudge
After creating files, **always** run `make gen` before opening Xcode.
