import SwiftUI

struct NotificationPlaygroundView: View {

    let viewModel: any NotificationPlaygroundViewModel

    var body: some View {
        VStack {
            Button("Request Permission") {
                Task {
                    await self.viewModel.requestPermission()
                }
            }
            Button("Start/Update Live Activity") {
                Task {
                    await self.viewModel.startLiveActivity()
                }
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
