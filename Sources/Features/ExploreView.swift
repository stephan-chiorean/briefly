import SwiftUI

struct ExploreView: View {
    let categories: [(String, [Color])] = [
        ("Sports", [Color.red, Color.orange]),
        ("Politics", [Color.blue, Color.purple]),
        ("Science", [Color.green, Color.mint]),
        ("Technology", [Color.cyan, Color.blue]),
        ("Business", [Color.indigo, Color.purple]),
        ("Health", [Color.pink, Color.red]),
        ("Entertainment", [Color.yellow, Color.orange]),
        ("World News", [Color.gray, Color.black]),
        ("Environment", [Color.mint, Color.green]),
        ("Education", [Color.purple, Color.pink]),
        ("Finance", [Color.orange, Color.yellow]),
        ("Culture", [Color.pink, Color.purple])
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                ForEach(categories, id: \.0) { category in
                    CategoryCard(
                        title: category.0,
                        gradient: category.1
                    )
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct CategoryCard: View {
    let title: String
    let gradient: [Color]
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .frame(height: 120)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: gradient,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    NavigationView {
        ExploreView()
    }
}
