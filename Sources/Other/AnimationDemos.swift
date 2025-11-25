// https://fatbobman.medium.com/swiftui-implicit-vs-explicit-animations-8032b8877abf

import SwiftUI

struct ImplicitAnimationDemo: View {
    @State private var isActive = false
    var body: some View {
        VStack {
            VStack {
                Text("Hello")
                    .font(.largeTitle)
                    .offset(x: isActive ? 200 : 0)
                    // Applies a .smooth animation when `isActive` changes
                    .animation(.smooth, value: isActive)

                Text("World")
                    .font(.largeTitle)
                    .offset(x: isActive ? 200 : 0)
            }
            // Applies a .linear animation with speed adjustment to VStack and its elements
            .animation(.linear.speed(0.1), value: isActive)

            // No animation applied
            Text("No Animation")
                .offset(x: isActive ? 200 : 0)

            Toggle("Active", isOn: $isActive)
                .padding()
        }
    }
}

struct ExplicitAnimationDemo: View {
    @State private var isActive = false
    var body: some View {
        VStack {
            VStack {
                Text("Hello")
                    .font(.largeTitle)
                    .offset(x: isActive ? 200 : 0)
                    // Applies a .smooth animation when `isActive` changes
                    .animation(.smooth, value: isActive)

                Text("World")
                    .font(.largeTitle)
                    .offset(x: isActive ? 200 : 0)
            }
            // Applies a .linear animation with speed adjustment to VStack and its elements
            .animation(.linear.speed(0.5), value: isActive)

            // No implicit animation applied
            Text("No Animation")
                .offset(x: isActive ? 200 : 0)

            Button("Toggle") {
                withAnimation(.spring) {
                    isActive.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

// MARK: - Preview

#Preview {
    ExplicitAnimationDemo()
}
