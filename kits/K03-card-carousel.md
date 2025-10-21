# K03 - Card Carousel Kit

**Generic horizontal card carousel component with section headers and descriptions.**

## Overview

This kit provides a reusable carousel component that displays cards in horizontal scrollable sections. Each section has a title, description, and a horizontal carousel of cards with proper spacing and snap scrolling behavior.

## Requirements

### User Context Needed

1. **Card Data Model**: Define your card data structure
2. **Card View Component**: Create a custom card view for your data
3. **Section Configuration**: Specify how to separate card rows and what details to show

### Example Usage

```swift
// 1. Define your card data model
struct MyCard {
    let id: String
    let title: String
    let subtitle: String
    let image: String
}

// 2. Create your card view
struct MyCardView: View {
    let card: MyCard
    
    var body: some View {
        VStack {
            // Your card content here
            Text(card.title)
            Text(card.subtitle)
        }
        .frame(width: 200, height: 300)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

// 3. Use the carousel section
CardCarouselSection(
    title: "Featured Items",
    description: "Our top recommendations",
    cards: myCards
) { card in
    MyCardView(card: card)
}
```

## Implementation

### Core Component

```swift
struct CardCarouselSection<CardData, CardView: View>: View {
    let title: String
    let description: String
    let cards: [CardData]
    let cardView: (CardData) -> CardView
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Section header
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal, 20)
            
            // Section description
            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.horizontal, 20)
            
            // Horizontal carousel
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(cards.indices, id: \.self) { index in
                        cardView(cards[index])
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
            }
            .scrollTargetBehavior(.viewAligned)
        }
        .padding(.bottom, 16)
    }
}
```

### Multiple Sections with Dividers

```swift
VStack(alignment: .leading, spacing: 0) {
    // Section 1
    CardCarouselSection(
        title: "Section 1",
        description: "Description for section 1",
        cards: section1Cards
    ) { card in
        MyCardView(card: card)
    }
    
    // Divide line
    Rectangle()
        .fill(Color.gray.opacity(0.3))
        .frame(height: 1)
        .padding(.horizontal, 20)
        .padding(.vertical, 24)
    
    // Section 2
    CardCarouselSection(
        title: "Section 2", 
        description: "Description for section 2",
        cards: section2Cards
    ) { card in
        MyCardView(card: card)
    }
}
```

## Customization Options

### Spacing
- **Card Spacing**: `HStack(spacing: 16)` - Space between cards
- **Section Spacing**: `VStack(alignment: .leading, spacing: 8)` - Space between title, description, and carousel
- **Padding**: `.padding(.horizontal, 20)` and `.padding(.vertical, 16)` - Internal carousel padding

### Styling
- **Title Font**: `.font(.title2)` and `.fontWeight(.semibold)`
- **Description Font**: `.font(.subheadline)` and `.foregroundColor(.secondary)`
- **Divide Line**: `Color.gray.opacity(0.3)` with 1pt height

### Behavior
- **Snap Scrolling**: `.scrollTargetBehavior(.viewAligned)` for smooth card snapping
- **No Indicators**: `showsIndicators: false` for clean appearance

## Card Requirements

### Recommended Card Dimensions
- **Width**: 200-300 points
- **Height**: 300-450 points
- **Aspect Ratio**: 2:3 or 3:4 works well

### Card Content Structure
- **Title**: Primary information at the top
- **Subtitle/Description**: Secondary information below
- **Visual Element**: Image, icon, or background
- **Action Indicator**: Optional button or tap area

## Best Practices

1. **Consistent Card Sizes**: Keep all cards in a carousel the same size
2. **Meaningful Descriptions**: Use descriptive text that explains the section's purpose
3. **Proper Spacing**: Maintain consistent spacing between cards and sections
4. **Accessibility**: Ensure cards are accessible and have proper contrast
5. **Performance**: Use `ForEach` with stable IDs for better performance

## Example Variations

### Product Carousel
```swift
CardCarouselSection(
    title: "Featured Products",
    description: "Our best-selling items",
    cards: products
) { product in
    ProductCardView(product: product)
}
```

### News Carousel
```swift
CardCarouselSection(
    title: "Breaking News",
    description: "Latest updates and headlines",
    cards: newsItems
) { newsItem in
    NewsCardView(newsItem: newsItem)
}
```

### User Carousel
```swift
CardCarouselSection(
    title: "Team Members",
    description: "Meet our amazing team",
    cards: teamMembers
) { member in
    TeamMemberCardView(member: member)
}
```

## Dependencies

- SwiftUI
- iOS 14.0+ (for `.scrollTargetBehavior`)

## Notes

- The generic implementation allows for any card data type
- Card views are created using a closure for maximum flexibility
- Snap scrolling provides smooth user experience
- Dividers between sections help organize content visually
