import SwiftUI

struct NotificationPlaygroundView: View {

    @State private var viewModel: any NotificationPlaygroundViewModel

    init(viewModel: some NotificationPlaygroundViewModel) {
        self._viewModel = .init(initialValue: viewModel)
    }

    var body: some View {
        VStack {
            Button("Request Permission") {
                Task {
                    try await self.viewModel.requestPermission()
                }
            }
            Button("Start Live Activity") {
                self.viewModel.startLiveActivity()
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
