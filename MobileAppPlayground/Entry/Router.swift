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

// MARK: - Preview Implementation

final class PreviewRouter: Router {
    var navigationPath: Binding<[NavigationItem]> = .constant([.content1])
    
    func navigate(to: NavigationItem) {}
}

extension Router where Self == PreviewRouter {
    static var preview: Self {
        .init()
    }
}
