import UserNotifications

final class OSNotificationPermissionInteractor:
    NotificationPermissionInteractor {

    // MARK: - Properties

    static let shared: OSNotificationPermissionInteractor = .init()

    private nonisolated var center: UNUserNotificationCenter {
        .current()
    }

    // MARK: - Protocol Implementation

    func getPermission() async -> NotificationPermission {
        await withCheckedContinuation { continuation in
            self.center.getNotificationSettings { settings in
                continuation.resume(returning: .map(settings))
            }
        }
    }

    func requestPermission() async throws {
        try await self.center.requestAuthorization(options: [.alert, .sound, .badge])
    }

}

// MARK: - Convenience Initializer

extension NotificationPermissionInteractor where Self == OSNotificationPermissionInteractor {

    static var osShared: Self {
        Self.shared
    }

}
