import SwiftUI

struct SavedView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "bookmark.fill")
                .font(.system(size: 50))
                .foregroundColor(.orange)
            
            Text("Saved")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your saved content")
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("Saved")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationView {
        SavedView()
    }
}
