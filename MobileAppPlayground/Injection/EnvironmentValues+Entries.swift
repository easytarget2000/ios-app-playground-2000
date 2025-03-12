import SwiftUI

extension EnvironmentValues {

    @Entry var notificationPermissionInteractor: any NotificationPermissionInteractor
    = OSNotificationPermissionInteractor.shared

    @Entry var router: any Router = .sharedDefault

    @Entry var counterViewModel: any CounterViewModel = .preview

}
