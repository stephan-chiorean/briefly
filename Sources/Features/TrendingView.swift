import SwiftUI

struct TrendingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chart.line.uptrend.xyaxis")
                .font(.system(size: 50))
                .foregroundColor(.orange)
            
            Text("Trending")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("What's popular now")
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("Trending")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationView {
        TrendingView()
    }
}
