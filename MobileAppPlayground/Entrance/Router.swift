import SwiftUI

// MARK: - Protocol

protocol Router: Sendable {
    @MainActor var navigationPath: Binding<[NavigationItem]> { get }
    @MainActor func navigate(to item: NavigationItem)
    @MainActor func open(externalItem: ExternalNavigationItem)
}

// MARK: - Other Types

enum NavigationItem: Hashable {
    case counter
    case legacyCounter
    case notificationPlayground
}

enum ExternalNavigationItem {
    case appSettings
}

// MARK: - Preview Implementation

final class PreviewRouter: Router {
    var navigationPath: Binding<[NavigationItem]> = .constant([.counter])

    func navigate(to item: NavigationItem) {}

    func open(externalItem: ExternalNavigationItem) {}
}

extension Router where Self == PreviewRouter {
    static var preview: Self {
        .init()
    }
}
