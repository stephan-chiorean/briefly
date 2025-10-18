import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Briefly")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Build is deterministic via XcodeGen")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
