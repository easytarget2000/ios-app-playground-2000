import Foundation
import Observation

@Observable final class DefaultMenuViewModel: MenuViewModel {

    // MARK: - Properties

    private let router: any Router
    private let lifecycleLogger: any Logger

    let navigateToCounterTitle = "Counter"
    let navigateToLegacyCounterTitle = "Legacy Counter"
    let navigateToNotificationPlaygroundTitle = "Notifications Playground"

    // MARK: - Lifecycle

    init(router: any Router, lifecycleLogger: some Logger) {
        self.router = router
        self.lifecycleLogger = lifecycleLogger
        
        self.lifecycleLogger.debug("\(self) +: \(address(of: self))")
    }

    deinit {
        self.lifecycleLogger.debug("\(self) -: \(address(of: self))")
    }

    // MARK: - Interaction

    func navigateToCounter() {
        self.router.navigate(to: .counter)
    }

    func navigateToLegacyCounter() {
        self.router.navigate(to: .legacyCounter)
    }

    func navigateToNotificationPlayground() {
        self.router.navigate(to: .notificationPlayground)
    }

}

// MARK: - Convenience Initializer

extension MenuViewModel where Self == DefaultMenuViewModel {

    static func `default`(
        router: any Router,
        lifecycleLogger: some Logger = .lifecycle(subsystem: .menu)
    ) -> Self {
        .init(router: router, lifecycleLogger: lifecycleLogger)
    }

}
