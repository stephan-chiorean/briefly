import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Featured Personas Section
                PersonaCarouselSection(
                    title: "Featured Personas",
                    description: "Our top-rated news concierges",
                    cards: featuredPersonas
                )
                
                // Divide line
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 24)
                
                // Community Personas Section
                PersonaCarouselSection(
                    title: "Community Personas",
                    description: "Choose from our community favorites",
                    cards: communityPersonas
                )
                
                // Divide line
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 24)
                
                // My Personas Section
                PersonaCarouselSection(
                    title: "My Personas",
                    description: "Your personalized news sources",
                    cards: myPersonas
                )
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // Sample data
    private var featuredPersonas: [PersonaCard] {
        [
            PersonaCard(
                name: "The Hair Tiger",
                tagline: "Tech news with a wild edge. Delivers cutting-edge technology insights with personality and humor. Perfect for developers and tech enthusiasts who want to stay ahead of the curve while being entertained. Covers everything from AI breakthroughs to startup culture with a fresh perspective.",
                chips: ["AI", "Startups", "Concise", "Daily 8am", "Tech", "Innovation"],
                rating: 4.8,
                gradient: [.blue, .purple]
            ),
            PersonaCard(
                name: "The Goose Moose",
                tagline: "Policy insights that matter. Breaks down complex government policies and regulations into digestible, actionable information. Ideal for professionals who need to understand how policy changes affect their industry. Provides context, implications, and practical next steps for each development.",
                chips: ["Policy", "Government", "Analytical", "Weekly", "Regulation", "Impact"],
                rating: 4.6,
                gradient: [.green, .mint]
            ),
            PersonaCard(
                name: "The Quantum Cat",
                tagline: "Frontier science made simple. Translates complex scientific discoveries into clear, engaging explanations that anyone can understand. Covers breakthrough research across physics, biology, chemistry, and space exploration. Perfect for curious minds who want to stay informed about humanity's greatest discoveries.",
                chips: ["Science", "Research", "Educational", "Bi-weekly", "Discovery", "Innovation"],
                rating: 4.9,
                gradient: [.orange, .red]
            ),
            PersonaCard(
                name: "The Data Dragon",
                tagline: "Market trends and analysis. Provides comprehensive financial market insights with data-driven predictions and analysis. Covers stocks, crypto, commodities, and economic indicators. Designed for investors and business professionals who need reliable market intelligence to make informed decisions.",
                chips: ["Finance", "Markets", "Data-driven", "Daily 6pm", "Investment", "Analysis"],
                rating: 4.7,
                gradient: [.pink, .purple]
            )
        ]
    }
    
    private var communityPersonas: [PersonaCard] {
        [
            PersonaCard(
                name: "The Code Whisperer",
                tagline: "Developer insights and trends. Shares the latest programming techniques, frameworks, and best practices from the developer community. Covers everything from coding tutorials to industry trends and career advice. Perfect for developers at any level who want to stay current with the rapidly evolving tech landscape.",
                chips: ["Programming", "Tech", "Concise", "Daily 9am", "Tutorials", "Career"],
                rating: 4.5,
                gradient: [.cyan, .blue]
            ),
            PersonaCard(
                name: "The Design Owl",
                tagline: "UI/UX wisdom and inspiration. Curates the best design resources, case studies, and creative inspiration for designers and product teams. Features interviews with leading designers, breakdowns of successful products, and practical design tips. Ideal for anyone involved in creating user experiences that delight and engage.",
                chips: ["Design", "UX", "Creative", "Weekly", "Inspiration", "Case Studies"],
                rating: 4.4,
                gradient: [.indigo, .purple]
            ),
            PersonaCard(
                name: "The Startup Phoenix",
                tagline: "Entrepreneurship and innovation. Delivers motivational stories, practical advice, and industry insights for entrepreneurs and startup founders. Covers fundraising strategies, product development, team building, and scaling challenges. Perfect for anyone building or considering starting their own business venture.",
                chips: ["Startups", "Business", "Motivational", "Daily 7am", "Fundraising", "Growth"],
                rating: 4.6,
                gradient: [.red, .orange]
            ),
            PersonaCard(
                name: "The Climate Hawk",
                tagline: "Environmental news and solutions. Provides urgent updates on climate change, sustainability initiatives, and environmental solutions. Covers policy developments, technological innovations, and actionable steps individuals and organizations can take. Essential for anyone committed to understanding and addressing environmental challenges.",
                chips: ["Climate", "Sustainability", "Urgent", "Daily 5pm", "Solutions", "Policy"],
                rating: 4.8,
                gradient: [.yellow, .orange]
            )
        ]
    }
    
    private var myPersonas: [PersonaCard] {
        [
            PersonaCard(
                name: "The Daily Brief",
                tagline: "Your personalized news digest. Curates the most important news and updates tailored specifically to your interests and preferences. Combines multiple sources to provide a comprehensive yet concise overview of what matters most to you. Delivers the perfect balance of depth and brevity to keep you informed without overwhelming you.",
                chips: ["Personal", "Custom", "Daily", "8am", "Curated", "Tailored"],
                rating: 4.9,
                gradient: [.mint, .green]
            ),
            PersonaCard(
                name: "The Meeting Master",
                tagline: "Professional insights and updates. Provides executive-level summaries of industry developments, market changes, and business trends that impact your work. Designed for busy professionals who need to stay informed but don't have time to sift through multiple sources. Delivers actionable intelligence in digestible formats.",
                chips: ["Business", "Professional", "Concise", "Daily 9am", "Executive", "Intelligence"],
                rating: 4.7,
                gradient: [.purple, .pink]
            ),
            PersonaCard(
                name: "The Learning Lion",
                tagline: "Educational content and tutorials. Offers in-depth learning resources, skill development guides, and educational content across various subjects. Perfect for lifelong learners who want to expand their knowledge and acquire new skills. Covers everything from technical skills to soft skills and personal development topics.",
                chips: ["Education", "Learning", "Detailed", "Weekly", "Skills", "Development"],
                rating: 4.5,
                gradient: [.blue, .cyan]
            )
        ]
    }
}

// MARK: - Generic Carousel Components

struct CardCarouselSection<CardData, CardView: View>: View {
    let title: String
    let description: String
    let cards: [CardData]
    let cardView: (CardData) -> CardView
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal, 20)
            
            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.horizontal, 20)
            
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

// MARK: - Persona-Specific Carousel Section

struct PersonaCarouselSection: View {
    let title: String
    let description: String
    let cards: [PersonaCard]
    
    var body: some View {
        CardCarouselSection(
            title: title,
            description: description,
            cards: cards
        ) { card in
            PersonaCardView(card: card)
        }
    }
}

struct CarouselSection: View {
    let title: String
    let cards: [TemplateCard]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal, 4)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(cards, id: \.title) { card in
                        TemplateCardView(card: card)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
}

// MARK: - Data Models

struct PersonaCard {
    let name: String
    let tagline: String
    let chips: [String]
    let rating: Double
    let gradient: [Color]
}

struct TemplateCard {
    let title: String
    let gradient: [Color]
}

// MARK: - Card Views

struct PersonaCardView: View {
    let card: PersonaCard
    
    var body: some View {
        VStack(spacing: 0) {
            // Image - 60% of card height
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: card.gradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 252) // 60% of 420
                .clipped()
            
            // Text content - 40% of card height
            VStack(alignment: .leading, spacing: 12) {
                // Title
                Text(card.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                
                // Star Rating and Category tag across from each other
                HStack {
                    // Star Rating
                    HStack(spacing: 2) {
                        ForEach(0..<5, id: \.self) { index in
                            Image(systemName: index < Int(card.rating) ? "star.fill" : "star")
                                .foregroundColor(.orange)
                                .font(.caption)
                        }
                    }
                    
                    Spacer()
                    
                    // Category tag
                    Text(card.chips.first ?? "General")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                // Short excerpt
                Text(card.tagline)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 168) // 40% of 420
        }
        .frame(width: 270, height: 420)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

struct TemplateCardView: View {
    let card: TemplateCard
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(card.title)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(.white)
            
            Text("Tap to use")
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(width: 160, height: 220)
        .background(
            LinearGradient(
                colors: card.gradient,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

// MARK: - Detail View

struct PersonaDetailView: View {
    let card: PersonaCard
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header with gradient background
                VStack(alignment: .leading, spacing: 16) {
                    Text(card.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(card.tagline)
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.9))
                    
                    // Star Rating
                    HStack {
                        HStack(spacing: 4) {
                            ForEach(0..<5, id: \.self) { index in
                                Image(systemName: index < Int(card.rating) ? "star.fill" : "star")
                                    .foregroundColor(.yellow)
                                    .font(.title3)
                            }
                        }
                        Text(String(format: "%.1f", card.rating))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
                .padding(24)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(
                        colors: card.gradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(20)
                
                // About Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("About")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("This AI concierge specializes in delivering \(card.tagline.lowercased()). It's designed to provide you with concise, relevant information tailored to your specific needs and interests.")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                // What You'll Get Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("What you'll get")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        BulletPoint(text: "Daily briefings tailored to your interests")
                        BulletPoint(text: "Concise summaries of complex topics")
                        BulletPoint(text: "Actionable insights and recommendations")
                        BulletPoint(text: "Customized tone and style preferences")
                    }
                }
                
                // Topics & Tone Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Topics & Tone")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                        ForEach(card.chips, id: \.self) { chip in
                            Text(chip)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(12)
                        }
                    }
                }
                
                // Configuration Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Configuration")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.blue)
                        Text("Daily at 8:00 AM")
                            .font(.body)
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
                }
                
                // Sample Headlines Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Sample Headlines")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        SampleHeadline(text: "Tech giants announce new AI safety standards")
                        SampleHeadline(text: "Market analysis: Q4 trends to watch")
                        SampleHeadline(text: "Policy update: New regulations impact startups")
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Persona Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BulletPoint: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•")
                .font(.title2)
                .foregroundColor(.blue)
            Text(text)
                .font(.body)
        }
    }
}

struct SampleHeadline: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
