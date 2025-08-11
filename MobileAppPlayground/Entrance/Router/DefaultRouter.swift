import Foundation
import SwiftUI

@Observable final class DefaultRouter: Router {

    // MARK: - Nested Types

    private struct State {
        var navigationPath: [NavigationItem] = []
    }

    // MARK: - Properties

    static let sharedDefault: DefaultRouter = .init(lifecycleLogger: .lifecycle(subsystem: .router))

    private let lifecycleLogger: any Logger
    private var state: State = .init()

    // MARK: - Constructor/Deconstructor

    init(lifecycleLogger: some Logger) {
        self.lifecycleLogger = lifecycleLogger

        self.lifecycleLogger.debug("\(self) +: \(address(of: self))")
    }

    deinit {
        self.lifecycleLogger.debug("\(self) -: \(address(of: self))")
    }

    // MARK: - Protocol Implementations

    var navigationPath: Binding<[NavigationItem]> {
        .init(
            get: { self.state.navigationPath },
            set: { self.state.navigationPath = $0 }
        )
    }

    func navigate(to item: NavigationItem) {
        self.state.navigationPath.append(item)
    }

    func open(externalItem: ExternalNavigationItem) {
        switch externalItem {
        case .appSettings:
            UIApplication.shared.openSettings()
        }
    }

}

extension Router where Self == DefaultRouter {

    static var sharedDefault: Self {
        Self.sharedDefault
    }

}
