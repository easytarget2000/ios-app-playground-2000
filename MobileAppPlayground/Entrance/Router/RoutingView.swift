import SwiftUI

struct RoutingView: View {

    // MARK: - Properties

    // MARK: Dependencies

    @Environment(\.router) private var router: any Router
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
        case .counter:
            CounterView(viewModel: .default(router: self.router))
        case .legacyCounter:
            LegacyCounterView(viewModel: .legacy(router: self.router))
        case .notificationPlayground:
            NotificationPlaygroundView(viewModel: .default(router: self.router))
        }
    }

}

// MARK: - Preview

#Preview {
    RoutingView()
        .environment(\.router, .preview)
        .environment(\.notificationPermissionInteractor, .preview)
}
