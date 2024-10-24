import SwiftUI

extension EnvironmentValues {
    @Entry var contentInteractor: any CounterInteractor = DefaultCounterInteractor.shared
    @Entry var router: any Router = DefaultRouter.shared
}
