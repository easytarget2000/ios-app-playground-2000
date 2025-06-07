import SwiftUI

struct NotificationPlaygroundView: View {

    @State private var viewModel: NotificationPlaygroundViewModel

    init(viewModel: NotificationPlaygroundViewModel) {
        self._viewModel = .init(initialValue: viewModel)
    }

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

#if DEBUG

#Preview {
    NotificationPlaygroundView(viewModel: .preview)
}

#endif
