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

### Navigation Structure
- **ContentView**: Landing page with "Get Started" button
- **MainTabView**: Bottom tab navigation container
- **HomeView**: Welcome page (Home tab)
- **ExploreView**: Content discovery (Explore tab)
- **TrendingView**: Popular content (Trending tab)
- **ProfileView**: User account (Profile tab)

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
