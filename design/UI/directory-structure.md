# UI Directory Structure

**Detailed breakdown** of the current UI file organization and reasoning.

## Current Structure

```
Sources/Features/
├── MainTabView.swift      # Root navigation container
├── HomeView.swift         # Tab 1: Home screen
├── ExploreView.swift      # Tab 2: Explore screen  
├── TrendingView.swift     # Tab 3: Trending screen
└── ProfileView.swift      # Tab 4: Profile screen
```

## File-by-File Breakdown

### MainTabView.swift
**Purpose**: Root navigation container
- **Contains**: `TabView` with 4 tabs
- **Dependencies**: All individual view files
- **Pattern**: Container view that orchestrates navigation
- **Customization**: Uses tokens for tab names and icons

### Individual View Files
**Pattern**: Each tab has its own view file
- **Naming**: `{TabName}View.swift`
- **Structure**: Consistent across all views
- **Dependencies**: None (self-contained)

## Design Rationale

### Why This Structure?

#### 1. **Simplicity First**
- Flat structure is easy to understand
- No premature optimization
- Clear one-to-one mapping: 1 tab = 1 file

#### 2. **Token-Based Customization**
- All views use tokens for names/icons
- Easy to generate different app variations
- Maintains consistency across generated projects

#### 3. **SwiftUI Best Practices**
- Each view is self-contained
- NavigationStack per view for independent navigation
- Standard iOS tab-based navigation pattern

### When to Evolve This Structure

#### Triggers for Reorganization
- **Feature complexity**: When individual features grow beyond single files
- **Shared components**: When common UI elements emerge
- **Business logic**: When views need view models or complex state
- **Team size**: When multiple developers need clear boundaries

#### Potential Future Structure
```
Sources/Features/
├── Navigation/
│   ├── MainTabView.swift
│   └── TabCoordinator.swift
├── Home/
│   ├── HomeView.swift
│   ├── HomeViewModel.swift
│   └── HomeCoordinator.swift
├── Explore/
│   ├── ExploreView.swift
│   ├── ExploreViewModel.swift
│   └── ExploreCoordinator.swift
├── Trending/
│   ├── TrendingView.swift
│   ├── TrendingViewModel.swift
│   └── TrendingCoordinator.swift
├── Profile/
│   ├── ProfileView.swift
│   ├── ProfileViewModel.swift
│   └── ProfileCoordinator.swift
└── Shared/
    ├── Components/
    │   ├── CustomButton.swift
    │   └── CustomCard.swift
    ├── ViewModels/
    │   └── BaseViewModel.swift
    └── Extensions/
        └── View+Extensions.swift
```

## Current Benefits

1. **Easy to understand**: Clear, flat structure
2. **Easy to customize**: Token-based system
3. **Easy to generate**: Kits can recreate this structure
4. **Easy to maintain**: Simple, predictable organization
5. **Easy to extend**: Add new tabs by following the pattern

## Current Limitations

1. **No shared components**: Each view is independent
2. **No business logic separation**: Views contain all logic
3. **No feature boundaries**: All features in one directory
4. **No testing structure**: No clear place for view tests

## Migration Strategy

When the time comes to reorganize:

1. **Identify shared components** first
2. **Extract view models** for complex views
3. **Create feature folders** for major features
4. **Update kits** to reflect new structure
5. **Update blueprints** with new organization rules
