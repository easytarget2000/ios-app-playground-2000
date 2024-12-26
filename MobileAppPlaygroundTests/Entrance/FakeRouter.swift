@testable import MobileAppPlayground
import SwiftUI

final class FakeRouter: Router {

    // MARK: - Properties

    // MARK: Spies

    @MainActor var navigateToNavigationItem: NavigationItem?
    @MainActor var openExternalItem: ExternalNavigationItem?

    // MARK: - Constructor

    init(navigationPath: Binding<[NavigationItem]> = .constant(.init())) {
        self.navigationPath = navigationPath
    }

    // MARK: - Protocol Implementation

    let navigationPath: Binding<[NavigationItem]>

    func navigate(to navigationItem: NavigationItem) {
        self.navigateToNavigationItem = navigationItem
    }

    func open(externalItem: ExternalNavigationItem) {
        self.openExternalItem = externalItem
    }

}
