// https://fatbobman.medium.com/swiftui-implicit-vs-explicit-animations-8032b8877abf

import SwiftUI

struct ImplicitAnimationDemo: View {
    @State private var isActive = false
    var body: some View {
        VStack {
            VStack {
                Text("animations.implicit.text1")
                    .font(.largeTitle)
                    .offset(x: isActive ? 200 : 0)
                    // Applies a .smooth animation when `isActive` changes
                    .animation(.smooth, value: isActive)

                Text("animations.implicit.text2")
                    .font(.largeTitle)
                    .offset(x: isActive ? 200 : 0)
            }
            // Applies a .linear animation with speed adjustment to VStack and its elements
            .animation(.linear.speed(0.1), value: isActive)

            // No animation applied
            Text("animations.implicite.activeLabel")
                .offset(x: isActive ? 200 : 0)

            Toggle("animations.implicit.toggle", isOn: $isActive)
                .padding()
        }
    }
}

struct ExplicitAnimationDemo: View {
    @State private var isActive = false
    var body: some View {
        VStack {
            VStack {
                Text("animations.explicit.text1")
                    .font(.largeTitle)
                    .offset(x: isActive ? 200 : 0)
                    // Applies a .smooth animation when `isActive` changes
                    .animation(.smooth, value: isActive)

                Text("animations.explicit.text2")
                    .font(.largeTitle)
                    .offset(x: isActive ? 200 : 0)
            }
            // Applies a .linear animation with speed adjustment to VStack and its elements
            .animation(.linear.speed(0.5), value: isActive)

            // No implicit animation applied
            Text("animations.explicit.activeLabel")
                .offset(x: isActive ? 200 : 0)

            Button("animations.explicit.toggle") {
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
