import SwiftUI

protocol Router: Sendable {
    @MainActor var navigationPath: Binding<[NavigationItem]> { get }
    @MainActor func navigate(to: NavigationItem)
}

final class DefaultRouter: Router {
    private struct State {
        var navigationPath: [NavigationItem] = [.content]
    }
    
    @MainActor private var state: State = .init()
    
    init() {
        NSLog("DefaultRouter initialized.")
    }
    
    var navigationPath: Binding<[NavigationItem]> {
        .init(get: { self.state.navigationPath }, set: { self.state.navigationPath = $0 })
    }
    
    func navigate(to item: NavigationItem) {
        state.navigationPath.append(item)
    }
}

final class PreviewRouter: Router {
    var navigationPath: Binding<[NavigationItem]> = .constant([.content])
    
    func navigate(to: NavigationItem) {}
}

final class RouterFactory {
    static func build() -> DefaultRouter {
        .init()
    }
}
