import SwiftUI

/// Playground view following along "Thinking In SwiftUI"
struct UnusedSampleView: View {

    @ViewBuilder @MainActor var body: some View {
        Text("Hello")
            .padding()
            .background(Color.blue)

        Text("Hello")
            .background(Color.blue)
            .padding()

        HStack(spacing: 20) {
            Image(systemName: "hand.wave")
            Text("Hello")
            Spacer()
            Text("And Goodbye!")
            Image(systemName: "hand.wave")
        }

        Greeting()
    }

}

struct Greeting: View {

    @ViewBuilder var hello: some View {
        Image(systemName: "hand.wave")
        Text("Hello")
    }

    @ViewBuilder var bye: some View {
        Text("And Goodbye!")
        Image(systemName: "hand.wave")
    }

    var body: some View {
        HStack(spacing: 20) {
            hello
            Spacer()
            bye
        }
    }
}

// MARK: - Preview

#Preview {
    UnusedSampleView()
}
