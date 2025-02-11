import SwiftUI

/// Playground view following along chapter 2 of "Thinking In SwiftUI"
struct ThinkingInSwiftUIChapter2View: View {

    private var showText = true
    private var greeting: String? = "Hello"

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

        HStack {
            Image(systemName: "hand.wave")
            if showText {
                Text("Hello")
            }
        }

        HStack {
            Image(systemName: "hand.wave")
            if let greeting {
                Text(greeting)
            } else {
                Text("Hello")
            }
        }

        HStack {
            let textView = Text("Hello")
            textView
            textView
        }
    }

}

struct Hello: View {
    var body: some View {
        Image(systemName: "hand.wave")
        Text("Hello")
    }
}
struct Bye: View {
    var body: some View {
        Text("And Goodbye!")
        Image(systemName: "hand.wave")
    }
}
struct Greeting: View {
    var body: some View {
        HStack(spacing: 20) {
            Hello()
                .border(.blue)
            Spacer()
            Bye()
        }
    }
}

// MARK: - Preview

#Preview {
    ThinkingInSwiftUIChapter2View()
}
