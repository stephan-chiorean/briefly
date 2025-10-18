# Build and Run Blueprint

## Building

```bash
# Build for iPhone 16 simulator
make build
```

## Running

```bash
# Open project in Xcode
make open
```

Then in Xcode:
1. Select iPhone 16 simulator
2. Press Cmd+R to run

## App Structure

### Entry Point
- **File**: `Sources/App/BrieflyApp.swift`
- **Type**: `@main` App struct
- **Purpose**: SwiftUI app lifecycle

### Main View
- **File**: `Sources/Features/ContentView.swift`
- **Type**: SwiftUI View
- **Purpose**: Main UI content

## Troubleshooting

### Xcode Issues
- **Crashes on open**: Close Xcode, run `make gen`, then `make open`
- **Stale structure**: Regenerate project with `make gen`
- **Build errors**: Check `project.yml` configuration

### Build Issues
- **Simulator not found**: Update destination in `Makefile`
- **Code signing errors**: Update team ID in `project.yml`
- **Swift version errors**: Check `SWIFT_VERSION` in `project.yml`

## Development Workflow

1. Edit Swift files in `Sources/`
2. If adding new files/directories, update `project.yml`
3. Run `make gen` to regenerate project
4. Open in Xcode with `make open`
5. Build and run as normal
