import SwiftUI

// MARK: - Injector

struct NotificationPlaygroundViewInjector: View {
    @Environment(\.router) private var router: any Router
    @Environment(\.notificationPermissionInteractor)
    private var permissionInteractor: any NotificationPermissionInteractor

    var body: some View {
        NotificationPlaygroundView(
            viewModel: DefaultNotificationPlaygroundViewModel(
                router: self.router,
                permissionInteractor: self.permissionInteractor
            )
        )
    }
}

// MARK: - View

struct NotificationPlaygroundView: View {
    @State var viewModel: NotificationPlaygroundViewModel

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
