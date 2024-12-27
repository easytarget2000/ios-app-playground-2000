import Foundation
import Observation

@Observable final class DefaultMenuViewModel: MenuViewModel {

    // MARK: - Properties

    private let router: any Router
    private let interactor: any CounterInteractor
    private let lifecycleLogger: any Logger

    let navigateToCounterTitle: String = "Counter in Another View"
    let navigateToNotificationPlaygroundTitle: String = "Notifications Playground"

    // MARK: - Lifecycle

    init(
        router: any Router,
        interactor: any CounterInteractor,
        lifecycleLogger: some Logger
    ) {
        self.router = router
        self.interactor = interactor
        self.lifecycleLogger = lifecycleLogger
        self.lifecycleLogger.debug("DefaultMenuViewModel initialized.")
    }

    deinit {
        self.lifecycleLogger.debug("DefaultMenuViewModel deinitialized.")
    }

    // MARK: - Interaction

    func navigateToCounter() {
        self.router.navigate(to: .counter2)
    }

    func navigateToNotificationPlayground() {
        self.router.navigate(to: .notificationPlayground)
    }

}

// MARK: - Convenience Initializer

extension MenuViewModel where Self == DefaultMenuViewModel {

    static func `default`(
        router: any Router,
        interactor: any CounterInteractor,
        lifecycleLogger: some Logger = .lifecycle(subsystemSuffix: "Menu")
    ) -> Self {
        .init(
            router: router,
            interactor: interactor,
            lifecycleLogger: lifecycleLogger
        )
    }

}
