import Foundation
import Observation

@Observable final class DefaultMenuViewModel: MenuViewModel {

    // MARK: - Properties

    private let router: any Router
    private let lifecycleLogger: any Logger

    let navigateToCounterTitle: String = .init(
        localized: .counterItem
    )
    let navigateToLegacyCounterTitle: String = .init(
        localized: .legacyCounterItem
    )
    let navigateToNotificationPlaygroundTitle: String = .init(
        localized: .notificationPlaygroundItem
    )

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
