// MARK: - Protocol

protocol NotificationPermissionInteractor: Sendable {
    func getPermission() async -> NotificationPermission
    func requestPermission() async throws
}

// MARK: - Preview Implementation

final class PreviewNotificationPermissionInteractor:
    NotificationPermissionInteractor {

    func getPermission() async -> NotificationPermission {
        .denied
    }

    func requestPermission() async throws { }

}

// MARK: Convenience Initalizer

extension NotificationPermissionInteractor
where Self == PreviewNotificationPermissionInteractor {
    
    static var preview: Self {
        .init()
    }

}
