import UserNotifications

enum NotificationPermission {

    case unknown
    case denied
    case authorized

}

extension NotificationPermission {

    nonisolated static func map(_ osSettings: UNNotificationSettings) -> Self {
        Self.map(osSettings.authorizationStatus)
    }

    nonisolated static func map(_ osAuthStatus: UNAuthorizationStatus) -> Self {
        return switch osAuthStatus {
        case .notDetermined: .unknown
        case .denied: .denied
        case .authorized: .authorized
        case .provisional: .authorized
        case .ephemeral: .authorized
        @unknown default: .unknown
        }
    }

}
