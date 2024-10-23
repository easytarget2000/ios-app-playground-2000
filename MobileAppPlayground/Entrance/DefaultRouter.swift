import Foundation
import SwiftUI

@Observable final class DefaultRouter: Router {
    
    // MARK: - Nested Types
    
    private struct State {
        var navigationPath: [NavigationItem] = [.content1]
    }
    
    // MARK: - Properties
    
    static let shared: DefaultRouter = .init()
    
    private let lifecycleLogger: Logger
    @MainActor private var state: State = .init()
    
    // MARK: - Constructor/Deconstructor
    
    init(lifecycleLogger: some Logger = .lifecycle(subsystemSuffix: "Router")) {
        self.lifecycleLogger = lifecycleLogger
        self.lifecycleLogger.debug("DefaultRouter initialized.")
    }
    
    deinit {
        self.lifecycleLogger.debug("DefaultRouter deinitialized.")
    }
    
    // MARK: - Protocol Implementations
    
    var navigationPath: Binding<[NavigationItem]> {
        .init(get: { self.state.navigationPath }, set: { self.state.navigationPath = $0 })
    }
    
    func navigate(to item: NavigationItem) {
        self.state.navigationPath.append(item)
    }
}
