import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Image(systemName: "house.fill")
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            Text("Welcome to Briefly")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your brief content discovery platform")
                .font(.title3)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
