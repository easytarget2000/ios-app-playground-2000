import SwiftUI

/// Playground view following along chapter 3 of "Thinking In SwiftUI"
struct ThinkingInSwiftUIChapter3View: View {

    @State private var value = 0

    var body: some View {
        Button("Increment: \(value)") {
            value += 1
        }
    }

}

// MARK: - Preview

#Preview {
    ThinkingInSwiftUIChapter3View()
}
