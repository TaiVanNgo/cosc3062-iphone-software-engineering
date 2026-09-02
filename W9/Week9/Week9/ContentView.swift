import SwiftUI

struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 30) {
            // The Text view displaying the number
            Text("\(count)")
                .font(.system(size: 80, weight: .bold, design: .rounded))
                // 1. Apply the content transition
                .contentTransition(.numericText(value: Double(count)))
                // 2. Optional: Add an animation modifier to control the speed/curve
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: count)
            
            HStack(spacing: 20) {
                Button("Decrease") {
                    count -= 1
                }
                .buttonStyle(.bordered)
                
                Button("Increase") {
                    count += 1
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
