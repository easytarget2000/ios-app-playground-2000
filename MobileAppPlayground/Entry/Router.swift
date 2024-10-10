import SwiftUI

// MARK: - Protocol

protocol Router: ObservableObject, Sendable {
    @MainActor var navigationPath: Binding<[NavigationItem]> { get }
    @MainActor func navigate(to: NavigationItem)
}

// MARK: - Other Types

enum NavigationItem: Hashable {
    case content1
    case content2
}

// MARK: - Default Implementation

@Observable final class DefaultRouter: Router {
    private struct State {
        var navigationPath: [NavigationItem] = [.content1]
    }
    
    private let lifecycleLogger: Logger
    @MainActor private var state: State = .init()
    
    init(lifecycleLogger: Logger = LifecycleLogger()) {
        self.lifecycleLogger = lifecycleLogger
        self.lifecycleLogger.debug("DefaultRouter initialized.")
    }
    
    deinit {
        self.lifecycleLogger.debug("DefaultRouter deinitialized.")
    }
    
    var navigationPath: Binding<[NavigationItem]> {
        .init(get: { self.state.navigationPath }, set: { self.state.navigationPath = $0 })
    }
    
    func navigate(to item: NavigationItem) {
        self.state.navigationPath.append(item)
    }
}

// MARK: - Preview Implementation

final class PreviewRouter: Router {
    var navigationPath: Binding<[NavigationItem]> = .constant([.content1])
    
    func navigate(to: NavigationItem) {}
}
