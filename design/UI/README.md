# UI Design

**User interface design decisions and structure** for this iOS app.

## Directory Structure

### Current UI Organization
```
Sources/Features/
├── MainTabView.swift      # Root navigation container
├── HomeView.swift         # Tab 1: Home screen
├── ExploreView.swift      # Tab 2: Explore screen  
├── TrendingView.swift     # Tab 3: Trending screen
└── ProfileView.swift      # Tab 4: Profile screen
```

### Design Decisions

#### 1. **Tab-Based Navigation**
- **Why**: Standard iOS pattern, familiar to users
- **Implementation**: SwiftUI `TabView` with SF Symbols
- **Customization**: Token-based system allows easy tab name/icon changes

#### 2. **Flat File Structure**
- **Why**: Simple, no deep nesting for basic app structure
- **Trade-off**: May need reorganization as app grows
- **Future**: Can be refactored into feature-based folders when needed

#### 3. **NavigationStack per View**
- **Why**: Each tab can have its own navigation context
- **Benefit**: Independent navigation state per tab
- **Pattern**: Standard SwiftUI approach for tab-based apps

#### 4. **Persona-Based Feed Design**
- **Pattern**: Card-based feed with horizontal carousels
  - 3 sections: Featured Personas, Community Personas, My Personas
  - Persona cards with prominent names, taglines, and topic chips
  - Star ratings and "Tap for details" hints
  - Tall rectangular cards (180x280) with modern styling and snap scrolling
  - Cards include: Persona name, tagline, topic/tone chips, star rating, footer hint
- **Benefit**: Engaging, discoverable persona selection with rich visual information

#### 5. **Persona Detail Navigation**
- **Pattern**: Tap-to-detail navigation for persona cards
  - NavigationLink wrapping each PersonaCardView
  - PersonaDetailView with comprehensive persona information
  - Sections: About, What you'll get (bullets), Topics & Tone (chips), Configuration, Sample Headlines
  - Gradient header matching the card design
- **Benefit**: Rich information display without cluttering the feed

#### 6. **Snap Scrolling Behavior**
- **Pattern**: Horizontal carousels with snap-to-card behavior
  - Uses `.scrollTargetBehavior(.viewAligned)` for smooth snapping
  - Cards snap to center position when scrolling
  - 20pt spacing between cards for optimal visual flow
- **Benefit**: Intuitive navigation and professional feel

#### 7. **Consistent View Structure**
- **Pattern**: All views follow same structure:
  - `NavigationStack` wrapper
  - `VStack` with icon, title, subtitle
  - Consistent padding and styling
- **Benefit**: Predictable, maintainable code

### Future UI Considerations

#### When to Reorganize
- **Feature-based folders**: When individual features become complex
- **Component library**: When shared UI components emerge
- **View models**: When business logic grows beyond simple views

#### Potential Structure Evolution
```
Sources/Features/
├── Navigation/
│   └── MainTabView.swift
├── Home/
│   ├── HomeView.swift
│   └── HomeViewModel.swift
├── Explore/
│   ├── ExploreView.swift
│   └── ExploreViewModel.swift
└── Shared/
    ├── Components/
    └── ViewModels/
```

## Design Principles

1. **Consistency**: All views follow same structural pattern
2. **Simplicity**: Flat structure until complexity demands organization
3. **Customization**: Token-based system for easy adaptation
4. **Standards**: Follow iOS Human Interface Guidelines
5. **Maintainability**: Clear, predictable code organization
