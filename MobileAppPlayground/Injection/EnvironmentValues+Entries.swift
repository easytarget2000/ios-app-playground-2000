import SwiftUI

extension EnvironmentValues {
    @Entry var notificationPermissionInteractor: any NotificationPermissionInteractor
    = OSNotificationPermissionInteractor.shared

    @Entry var router: any Router = DefaultRouter.shared

    @Entry var counterViewModel: any CounterViewModel = .preview
}
