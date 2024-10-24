import SwiftUI

extension EnvironmentValues {
    @Entry var counterInteractor: any CounterInteractor = DefaultCounterInteractor.shared
    @Entry var router: any Router = DefaultRouter.shared
}
