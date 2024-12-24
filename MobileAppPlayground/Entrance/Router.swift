import SwiftUI

// MARK: - Protocol

protocol Router: Sendable {
    @MainActor var navigationPath: Binding<[NavigationItem]> { get }
    @MainActor func navigate(to: NavigationItem)
    @MainActor func open(externalItem: ExternalNavigationItem)
}

// MARK: - Other Types

enum NavigationItem: Hashable {
    case counter1
    case counter2
    case notificationPlayground
}

enum ExternalNavigationItem {
    case appSettings
}

// MARK: - Preview Implementation

final class PreviewRouter: Router {
    var navigationPath: Binding<[NavigationItem]> = .constant([.counter1])
    
    func navigate(to: NavigationItem) {}
    
    func open(externalItem: ExternalNavigationItem) {}
}

extension Router where Self == PreviewRouter {
    static var preview: Self {
        .init()
    }
}
