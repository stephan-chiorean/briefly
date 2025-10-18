import SwiftUI

struct ExploreView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 50))
                .foregroundColor(.green)
            
            Text("Explore")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Discover new content")
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationView {
        ExploreView()
    }
}
