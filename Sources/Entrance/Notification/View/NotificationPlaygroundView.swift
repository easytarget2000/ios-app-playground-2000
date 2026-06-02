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
            Button("Start Live Activity") {
                Task {
                    await self.viewModel.startLiveActivity()
                }
            }
            Button("Update Live Activity") {
                Task {
                    await self.viewModel.updateLiveActivity()
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
