import SwiftUI

struct RoutingView: View {

    // MARK: - Properties

    // MARK: Dependencies

    private let router: any Router
    private let permissionInteractor: any NotificationPermissionInteractor

    init(
        router: some Router = .sharedDefault,
        permissionInteractor: some NotificationPermissionInteractor = .osShared,
    ) {
        self.router = router
        self.permissionInteractor = permissionInteractor
    }

    // MARK: - Body

    var body: some View {
        NavigationStack(path: router.navigationPath) {
            rootView
                .navigationDestination(
                    for: NavigationItem.self,
                    destination: self.viewDestination
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
        case let .counter(id):
            CounterView(
                viewModel: CounterViewModelStorage.defaultInstance(for: id)
            )
        case let .legacyCounter(id):
            LegacyCounterView(
                viewModel: CounterViewModelStorage.legacyInstance(for: id)
            )
        case .notificationPlayground:
            NotificationPlaygroundView(viewModel: .default(router: self.router))
        }
    }

}

// MARK: - Preview

#if DEBUG

#Preview {
    RoutingView(router: .preview, permissionInteractor: .preview)
}

#endif
