import Foundation
import Observation

@Observable final class DefaultMenuViewModel: MenuViewModel {

    // MARK: - Properties

    static let sharedDefault: DefaultMenuViewModel = .init(
        router: .sharedDefault,
        lifecycleLogger: .lifecycle(subsystem: .menu),
    )

    private let router: any Router
    private let lifecycleLogger: any Logger

    let navigateToCounterTitle: String = .init(
        localized: .Menu.counterItem
    )
    let navigateToLegacyCounterTitle: String = .init(
        localized: .Menu.legacyCounterItem
    )
    let navigateToNotificationPlaygroundTitle: String = .init(
        localized: .Menu.notificationPlaygroundItem
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
        self.router.navigate(to: .counter(id: 0))
    }

    func navigateToLegacyCounter() {
        self.router.navigate(to: .legacyCounter(id: 25))
    }

    func navigateToNotificationPlayground() {
        self.router.navigate(to: .notificationPlayground)
    }

}

// MARK: - Convenience Initializer

extension MenuViewModel where Self == DefaultMenuViewModel {

    static var sharedDefault: Self {
        Self.sharedDefault
    }

}
