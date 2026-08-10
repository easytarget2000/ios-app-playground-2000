import SwiftUI

struct NotificationPlaygroundView: View {

    let viewModel: any NotificationPlaygroundViewModel

    var body: some View {
        VStack {
            Button("notifications.requestPermissionButton") {
                Task {
                    await self.viewModel.requestPermission()
                }
            }
            Button("notifications.startLiveActivityButton") {
                Task {
                    await self.viewModel.startLiveActivity()
                }
            }
            Button("notifications.updateLiveActivityButton") {
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
