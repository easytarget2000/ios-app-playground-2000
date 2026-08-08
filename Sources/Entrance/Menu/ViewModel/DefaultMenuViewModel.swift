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
    let navigateToNestingTitle: String = .init(
        localized: .Menu.nestingItem
    )
    let navigateToNotificationPlaygroundTitle: String = .init(
        localized: .Menu.notificationPlaygroundItem
    )
    let navigateToRBEditorTitle: String = .init(
        localized: .menuRbEditorItem
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

        // Debug side-effect:
        let cInput: CPlaygroundData = .init(
            a: 42,
            b: .init(("a" as Character).asciiValue ?? 0)
        )
        let cResult = addFive(cInput)
        print("DEBUG: \(cInput): \(cInput), \(cResult)")
    }

    func navigateToLegacyCounter() {
        self.router.navigate(to: .legacyCounter(id: 25))
    }

    func navigateToNesting() {
        self.router.navigate(to: .nesting)
    }

    func navigateToNotificationPlayground() {
        self.router.navigate(to: .notificationPlayground)
    }

    func navigateToRBEditor() {

    }

}

// MARK: - Convenience Initializer

extension MenuViewModel where Self == DefaultMenuViewModel {

    static var sharedDefault: Self {
        Self.sharedDefault
    }

}
