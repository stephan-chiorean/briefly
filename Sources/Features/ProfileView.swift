import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 50))
                .foregroundColor(.purple)
            
            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your account and settings")
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationView {
        ProfileView()
    }
}
