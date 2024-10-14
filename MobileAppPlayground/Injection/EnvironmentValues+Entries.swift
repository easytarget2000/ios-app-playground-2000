import SwiftUI

extension EnvironmentValues {
    @Entry var contentInteractor: any ContentInteractor = DefaultContentInteractor()
    @Entry var router: any Router = DefaultRouter()
}
