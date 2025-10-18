import SwiftUI

struct ContentView: View {
    @State private var showMainApp = false
    
    var body: some View {
        if showMainApp {
            MainTabView()
        } else {
            VStack(spacing: 30) {
                Spacer()
                
                Image(systemName: "app.badge")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)
                
                Text("Briefly")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Build is deterministic via XcodeGen")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Button("Get Started") {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showMainApp = true
                    }
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
