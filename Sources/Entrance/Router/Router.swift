import SwiftUI

// MARK: - Protocol

protocol Router: Sendable {
    var navigationPath: Binding<[NavigationItem]> { get }
    func navigate(to item: NavigationItem)
    func open(externalItem: ExternalNavigationItem)
}

// MARK: - Other Types

enum NavigationItem: Hashable {
    case counter(id: Int)
    case legacyCounter(id: Int)
    case notificationPlayground
}

enum ExternalNavigationItem {
    case appSettings
}

// MARK: - Preview Implementation

final class PreviewRouter: Router {
    var navigationPath: Binding<[NavigationItem]> = .constant([.counter(id: -1)])

    func navigate(to item: NavigationItem) {}

    func open(externalItem: ExternalNavigationItem) {}
}

extension Router where Self == PreviewRouter {
    static var preview: Self {
        .init()
    }
}
