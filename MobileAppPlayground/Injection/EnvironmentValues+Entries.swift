import SwiftUI

extension EnvironmentValues {
    @Entry var contentInteractor: any ContentInteractor = DefaultContentInteractor.shared
    @Entry var router: any Router = DefaultRouter.shared
}
