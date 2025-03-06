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
            rootView
                .navigationDestination(
                    for: NavigationItem.self,
                    destination: viewDestination
                )
        }
    }

    private var rootView: some View {
        MenuView()
    }

    @ViewBuilder private func viewDestination(
        for navigationItem: NavigationItem
    ) -> some View {
        switch navigationItem {
        case .counter1:
            CounterView()
                .environment(
                    \.counterViewModel,
                     .default(router: router, interactor: counterInteractor)
                )
        case .counter2:
            CounterView()
                .environment(
                    \.counterViewModel,
                     .default(router: router, interactor: counterInteractor)
                )
        case .notificationPlayground:
            NotificationPlaygroundView(
                viewModel: .default(
                    router: self.router,
                    permissionInteractor: self.permissionInteractor
                )
            )
        }
    }

}

// MARK: - Preview

#Preview {
    RoutingView()
        .environment(\.router, .preview)
        .environment(\.counterInteractor, .preview)
        .environment(\.notificationPermissionInteractor, .preview)
}
