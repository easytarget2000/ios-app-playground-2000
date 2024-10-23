import SwiftUI

extension EnvironmentValues {
    @Entry var contentInteractor: any ContentInteractor = SimpleContentInteractor.shared
    @Entry var router: any Router = DefaultRouter.shared
}
