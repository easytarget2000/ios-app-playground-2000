import UserNotifications

final class OSNotificationPermissionInteractor: NotificationPermissionInteractor, Sendable {
    
    // MARK: - Properties
    
    static let shared: OSNotificationPermissionInteractor = .init()
    
    private var center: UNUserNotificationCenter {
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
