import SwiftUI

struct NotificationPlaygroundView: View {

    let viewModel: NotificationPlaygroundViewModel

    var body: some View {
        Button("Request Permission") {
            Task {
                try await self.viewModel.requestPermission()
            }
        }
        .task {
            await self.viewModel.setup()
        }
    }

}

// MARK: - Preview

#Preview {
    NotificationPlaygroundView(viewModel: .preview)
}
