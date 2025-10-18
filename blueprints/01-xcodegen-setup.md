# XcodeGen Setup Blueprint

## Prerequisites

- Xcode 26.x (or latest)
- XcodeGen installed via Homebrew

## Installation

```bash
brew install xcodegen
```

## Project Generation

```bash
# Generate Xcode project from project.yml
make gen

# Generate and open in Xcode
make open
```

## Project Configuration

### Current Target

- **Name**: Briefly
- **Type**: iOS Application
- **Platform**: iOS 17.0+
- **Bundle ID**: com.example.briefly

### Source Directories

- `Sources/App` - App entry point and lifecycle
- `Sources/Features` - Feature modules and UI components

### Build Settings

- Swift 5.10
- Manual code signing
- User script sandboxing enabled
- Dead code stripping enabled

## Adding New Targets

1. Edit `project.yml`
2. Add new target under `targets:` section
3. Run `make gen` to regenerate project

## Adding Source Directories

1. Create directory under `Sources/`
2. Add to `sources:` list in target configuration
3. Run `make gen` to regenerate project

## Troubleshooting

- **XcodeGen not found**: Run `brew install xcodegen`
- **Project won't open**: Run `make gen` first
- **Stale structure**: Close Xcode, run `make gen`, then `make open`
