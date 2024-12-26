import SwiftUI

struct RoutingView: View {

    // MARK: - Properties

    // MARK: Dependencies

    @Environment(\.router) private var router: any Router
    @Environment(\.counterInteractor)
    private var counterInteractor: any CounterInteractor
    @Environment(\.notificationPermissionInteractor)
    private var permissionInteractor: any NotificationPermissionInteractor

    // MARK: - Body

    var body: some View {
        NavigationStack(path: router.navigationPath) {
            EmptyView()
                .navigationDestination(
                    for: NavigationItem.self,
                    destination: viewDestination
                )
        } 
    }

    @ViewBuilder private func viewDestination(
        for navigationItem: NavigationItem
    ) -> some View {
        switch navigationItem {
        case .counter1:
            CounterView(
                viewModel: .default(
                    router: self.router,
                    interactor: self.counterInteractor
                )
            )
        case .counter2:
            CounterView(
                viewModel: .default(
                    router: self.router,
                    interactor: self.counterInteractor
                )
            )
        case .notificationPlayground:
            NotificationPlaygroundView(
                viewModel: DefaultNotificationPlaygroundViewModel(
                    router: router,
                    permissionInteractor: permissionInteractor
                )
            )
        }
    }
}

// MARK: - Preview

#warning("TODO: Add previews to RoutingView environment.")

#Preview {
    RoutingView()
        .environment(\.router, .preview)
}
