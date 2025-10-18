# K02 – UI Base Navigation (SwiftUI Tabs)

## What You Need to Specify
- **Tab Names**: Tell me what you want your 4 tabs to be called (e.g., "Home, Explore, Trending, Profile" or "Feed, Search, Notifications, Settings")
- **Tab Icons**: Tell me which SF Symbol icons you want for each tab (e.g., "house.fill, magnifyingglass, chart.line.uptrend.xyaxis, person.fill")

## Purpose
Add deterministic tab UI using your specified names and SF Symbol icons.

## Assumptions
- K01 already applied (project uses XcodeGen; same tokens)

## Apply Steps
1. Tell me your 4 tab names and their SF Symbol icons
2. I'll create/overwrite files from "Files to create" below
3. Run: `make gen && make open`

## Token Replacement
- `__APP_NAME__` = Your app name (from K01)
- `__TAB1_NAME__` = First tab name (e.g., "Home")
- `__TAB1_ICON__` = First tab icon (e.g., "house.fill")
- `__TAB2_NAME__` = Second tab name (e.g., "Explore")
- `__TAB2_ICON__` = Second tab icon (e.g., "magnifyingglass")
- `__TAB3_NAME__` = Third tab name (e.g., "Trending")
- `__TAB3_ICON__` = Third tab icon (e.g., "chart.line.uptrend.xyaxis")
- `__TAB4_NAME__` = Fourth tab name (e.g., "Profile")
- `__TAB4_ICON__` = Fourth tab icon (e.g., "person.fill")

## Files to create (exact contents)

### Sources/Features/MainTabView.swift
```swift
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            __TAB1_NAME__View()
                .tabItem {
                    Image(systemName: "__TAB1_ICON__")
                    Text("__TAB1_NAME__")
                }
            
            __TAB2_NAME__View()
                .tabItem {
                    Image(systemName: "__TAB2_ICON__")
                    Text("__TAB2_NAME__")
                }
            
            __TAB3_NAME__View()
                .tabItem {
                    Image(systemName: "__TAB3_ICON__")
                    Text("__TAB3_NAME__")
                }
            
            __TAB4_NAME__View()
                .tabItem {
                    Image(systemName: "__TAB4_ICON__")
                    Text("__TAB4_NAME__")
                }
        }
    }
}

#Preview {
    MainTabView()
}
```

### Sources/Features/__TAB1_NAME__View.swift
```swift
import SwiftUI

struct __TAB1_NAME__View: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "__TAB1_ICON__")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("__TAB1_NAME__")
                    .font(.title)
                Text("Welcome to __APP_NAME__")
                    .foregroundColor(.secondary)
            }
            .padding()
            .navigationTitle("__TAB1_NAME__")
        }
    }
}

#Preview {
    __TAB1_NAME__View()
}
```

### Sources/Features/__TAB2_NAME__View.swift
```swift
import SwiftUI

struct __TAB2_NAME__View: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "__TAB2_ICON__")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("__TAB2_NAME__")
                    .font(.title)
                Text("Discover new content")
                    .foregroundColor(.secondary)
            }
            .padding()
            .navigationTitle("__TAB2_NAME__")
        }
    }
}

#Preview {
    __TAB2_NAME__View()
}
```

### Sources/Features/__TAB3_NAME__View.swift
```swift
import SwiftUI

struct __TAB3_NAME__View: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "__TAB3_ICON__")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("__TAB3_NAME__")
                    .font(.title)
                Text("What's popular now")
                    .foregroundColor(.secondary)
            }
            .padding()
            .navigationTitle("__TAB3_NAME__")
        }
    }
}

#Preview {
    __TAB3_NAME__View()
}
```

### Sources/Features/__TAB4_NAME__View.swift
```swift
import SwiftUI

struct __TAB4_NAME__View: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "__TAB4_ICON__")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("__TAB4_NAME__")
                    .font(.title)
                Text("Your account settings")
                    .foregroundColor(.secondary)
            }
            .padding()
            .navigationTitle("__TAB4_NAME__")
        }
    }
}

#Preview {
    __TAB4_NAME__View()
}
```

## Patch Note

### Replace ContentView usage with MainTabView in __APP_NAME__App.swift
```swift
import SwiftUI

@main
struct __APP_NAME__App: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
```

## Project Configuration
No changes needed to `project.yml` - it already includes `Sources/App` and `Sources/Features` which covers all the new files.
